start="temp_creeds"
finish="Creeds/wwwroot/creeds"
mkdir $start
mkdir $finish
rm $start/*.json
rm $finish/*.json
svn checkout https://github.com/NonlinearFruit/Creeds.json/trunk/creeds $start
cp $start/*.json $finish
rm $start/*.json
