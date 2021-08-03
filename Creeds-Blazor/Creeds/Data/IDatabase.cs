using System.Collections.Generic;

namespace Creeds.Data
{
    public interface IDatabase
    {
        public ICollection<CreedSummary> Creeds { get; }
    }
}