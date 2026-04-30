using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace Creeds
{
    public class JsonLoader : IJsonLoader
    {
        private readonly HttpClient _client;

        public JsonLoader(HttpClient client)
        {
            _client = client;
        }

        public Task<T> LoadAsync<T>(string file)
        {
            return _client.GetFromJsonAsync<T>(file);
        }
    }
}