using System.Collections.Generic;

namespace Creeds.Data
{
    public class ChapterCatechism
    {
        public string Number { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
        public ICollection<StringyCatechism> SubQuestions { get; set; }
    }
}