using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;

namespace Library.Gateway
{
    public static class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .ConfigureAppConfiguration((ic, config) =>
                {
                    config
                        .AddJsonFile($"appsettings.{ic.HostingEnvironment.EnvironmentName}.json", false, true)
                        .AddJsonFile($"ocelot.{ic.HostingEnvironment.EnvironmentName}.json", false, true);
                })
                .UseStartup<Startup>();
    }
}
