file="Creeds/Data/Database.cs"
jsons="Creeds/wwwroot/creeds/"

echo -e "using System.Collections.Generic;\n\n  namespace Creeds.Data {\n\n  public class Database : IDatabase {\n\n  public ICollection<CreedSummary> Creeds { get; } = new List<CreedSummary> {" > $file;

for json in $(ls $jsons); do
  jq --arg FILE $json '.Metadata | "new (\"\(.Title)\", \(.Year), \"\(.SourceAttribution)\", typeof(\(.CreedFormat)Page), \"\($FILE)\"),"' "${jsons}${json}" --raw-output | sed "s%${jsons}%%" >> $file;
done;

sed -i '$ s/.$//' $file;

echo -e "}; } }" >> $file;
