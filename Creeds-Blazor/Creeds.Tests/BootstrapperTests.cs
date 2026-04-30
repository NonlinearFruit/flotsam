using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using Xunit;

namespace Creeds.Tests
{
    public class BootstrapperTests
    {
        public class Constructor : BootstrapperTests
        {
            [Fact]
            public void stores_config_for_later()
            {
                var config = new Configuration();

                var bootstrapper = new Bootstrapper(config);

                Assert.Equal(config, bootstrapper.Configuration);
            }
        }

        public class ConfigureServices : BootstrapperTests
        {
            public static IEnumerable<object[]> ServiceTypes => new Bootstrapper(null)
                .ConfigureServices(new ServiceCollection())
                .Where(s => s.ServiceType.Assembly == typeof(App).Assembly)
                .Select(s => new object[] {s.ServiceType});

            [Theory]
            [MemberData(nameof(ServiceTypes))]
            public void service_is_resolvable(Type service)
            {
                var boot = new Bootstrapper(new Configuration{BaseAddress = "https://www.url.com"});
                var services = new ServiceCollection();

                boot.ConfigureServices(services).BuildServiceProvider().GetService(service);
            }

            [Fact]
            public void http_has_correct_base()
            {
                var address = "https://www.url.com/";
                var boot = new Bootstrapper(new Configuration{BaseAddress = address});
                var services = new ServiceCollection();

                var client = boot.ConfigureServices(services).BuildServiceProvider().GetService<HttpClient>();

                Assert.Equal(address, client.BaseAddress.ToString());
            }
        }
    }
}