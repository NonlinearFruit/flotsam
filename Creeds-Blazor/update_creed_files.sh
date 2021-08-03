start="creeds"
finish="Creeds/wwwroot/creeds"
rm $start/*.json
rm $finish/*.json
svn checkout https://github.com/NonlinearFruit/Creeds.json/trunk/creeds
cp $start/*.json $finish
rm $start/*.json