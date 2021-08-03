using System;

namespace Creeds.Data
{
    public record CreedSummary(string Title, int Year, string SourceAttribution, Type CreedType, string FilePath);
}