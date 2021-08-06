using System.Threading.Tasks;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

namespace Creeds
{
    public static class Program
    {
        public static async Task Main(string[] args)
        {
            var builder = WebAssemblyHostBuilder.CreateDefault(args);
            var bootstrapper = new Bootstrapper(new Configuration
            {
                BaseAddress = builder.HostEnvironment.BaseAddress
            });
            bootstrapper.ConfigureServices(builder.Services);
            bootstrapper.Configure(builder);
            await builder.Build().RunAsync();
        }
    }
}