file="Creeds/Data/Database.cs"
jsons="Creeds/wwwroot/creeds/"

cat > $file << END
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Creeds.Data
{
    public class Database : IDatabase
    {
        private readonly IJsonLoader _loader;

        public Database(IJsonLoader loader)
        {
            _loader = loader;
        }

        public ICollection<Summary> Creeds { get; set; } = new List<Summary>
        {
END

for json in $(ls $jsons); do
  filename=$(basename -s .json $json)
  jq --arg FILE $filename '.Metadata | "new (\"\(.Title)\", \(.Year), \"\(.SourceAttribution)\", \"\($FILE)\", \"\(.CreedFormat)Page/\($FILE)\"),"' "${jsons}${json}" --raw-output | sed "s%${jsons}%%" >> $file;
done;

sed -i '$ s/.$//' $file;

cat >> $file << END
        };

        public Summary GetSummary(string filename) => Creeds.FirstOrDefault(c => c.FileName == filename);

        public async Task<Document<T>> LoadDocumentAsync<T>(Summary summary) => Creeds.Any(c => c == summary)
            ? await _loader.LoadAsync<Document<T>>($"creeds/{Creeds.First(c => c == summary).FileName}.json")
            : null;
    }
}
END
