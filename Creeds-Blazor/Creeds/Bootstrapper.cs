using System;
using System.Net.Http;
using Creeds.Data;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using Microsoft.Extensions.DependencyInjection;

namespace Creeds
{
    public class Bootstrapper
    {
        public Configuration Configuration { get; set; }

        public Bootstrapper(Configuration config)
        {
            Configuration = config;
        }

        public IServiceCollection ConfigureServices(IServiceCollection services)
        {
            services.AddTransient<IDatabase, Database>();
            services.AddTransient<IJsonLoader, JsonLoader>();
            services.AddScoped(_ => new HttpClient
                {
                    BaseAddress = new Uri(Configuration.BaseAddress)
                }
            );
            return services;
        }

        public void Configure(WebAssemblyHostBuilder builder)
        {
            builder.RootComponents.Add<App>("#app");
        }
    }
}