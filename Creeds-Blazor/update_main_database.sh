file="Creeds/Data/Database.cs"
jsons="Creeds/wwwroot/creeds/"

echo -e "using System.Collections.Generic;\n\n  namespace Creeds.Data {\n\n  public class Database : IDatabase {\n\n  public ICollection<CreedSummary> Creeds { get; } = new List<CreedSummary> {" > $file;

for json in $(ls $jsons); do
  filename=$(basename -s .json $json)
  jq --arg FILE $filename '.Metadata | "new (\"\(.Title)\", \(.Year), \"\(.SourceAttribution)\", \"\($FILE)\", \"\(.CreedFormat)Page/\($FILE)\"),"' "${jsons}${json}" --raw-output | sed "s%${jsons}%%" >> $file;
done;

sed -i '$ s/.$//' $file;

echo -e "}; } }" >> $file;
