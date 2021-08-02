using Creeds;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
var bootstrapper = new Bootstrapper(new Configuration
{
    BaseAddress = builder.HostEnvironment.BaseAddress
});
bootstrapper.ConfigureServices(builder.Services);
bootstrapper.Configure(builder);
await builder.Build().RunAsync();