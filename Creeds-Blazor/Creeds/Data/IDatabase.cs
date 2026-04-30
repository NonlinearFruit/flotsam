using System.Collections.Generic;
using System.Threading.Tasks;

namespace Creeds.Data
{
    public interface IDatabase
    {
        public ICollection<Summary> Creeds { get; }
        public Summary GetSummary(string filename);
        public Task<Document<T>> LoadDocumentAsync<T>(Summary summary);
    }
}