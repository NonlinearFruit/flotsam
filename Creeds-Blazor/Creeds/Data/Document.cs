namespace Creeds.Data
{
    public class Document<T>
    {
        public MetaData MetaData { get; set; }
        public T Data { get; set; }
    }
}