using System.Collections.Generic;

namespace Creeds.Data
{
    public interface IDatabase
    {
        public ICollection<Summary> Creeds { get; }
    }
}