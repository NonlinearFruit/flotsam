using System.Threading.Tasks;

namespace Creeds
{
    public interface IJsonLoader
    {
        public Task<T> LoadAsync<T>(string file);
    }
}