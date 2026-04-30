using System;
using System.Diagnostics.CodeAnalysis;
using System.Threading.Tasks;

namespace Creeds.Tests
{
    [SuppressMessage("ReSharper", "InconsistentNaming")]
    public class JsonLoader_TestDouble : IJsonLoader
    {
        public int CountOfCallsTo_LoadAsync { get; set; }
        public string LastFilePassedTo_LoadAsync { get; set; }
        public Type LastTypePassedTo_LoadAsync { get; set; }
        public dynamic ReturnFor_LoadAsync { get; set; }
        public async Task<T> LoadAsync<T>(string file)
        {
            CountOfCallsTo_LoadAsync++;
            LastFilePassedTo_LoadAsync = file;
            LastTypePassedTo_LoadAsync = typeof(T);
            return ReturnFor_LoadAsync is T properReturn
                ? properReturn
                : default(T);
        }
    }
}