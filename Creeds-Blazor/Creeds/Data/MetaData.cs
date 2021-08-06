using System.Collections.Generic;

namespace Creeds.Data
{
    public class MetaData
    {
        public string Title { get; set; }
        public ICollection<string> AlternativeTitles { get; set; }
        public string Year { get; set; }
        public ICollection<string> Authors { get; set; }
        public string Location { get; set; }
        public string OriginalLanguage { get; set; }
        public string OriginStory { get; set; }
        public string SourceUrl { get; set; }
        public string SourceAttribution { get; set; }
        public string CreedFormat { get; set; }
    }
}