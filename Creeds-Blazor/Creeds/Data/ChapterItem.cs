using System.Collections.Generic;

namespace Creeds.Data
{
    public class ChapterItem
    {
        public int Chapter { get; set; }
        public string Title { get; set; }
        public ICollection<SectionItem> Sections { get; set; }
    }
}