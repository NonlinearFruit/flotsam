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
new ("Abstract of Principles", 1858, "Public Domain", "abstract_of_principles", "CanonPage/abstract_of_principles"),
new ("Apostles' Creed", 710, "Public Domain", "apostles_creed", "CreedPage/apostles_creed"),
new ("Athanasian Creed", 800, "Public Domain", "athanasian_creed", "CreedPage/athanasian_creed"),
new ("Belgic Confession", 1561, "Public Domain", "belgic_confession_of_faith", "CanonPage/belgic_confession_of_faith"),
new ("Canons of Dort", 1619, "Public Domain", "canons_of_dort", "ConfessionPage/canons_of_dort"),
new ("Catechism For Young Children", 1840, "Public Domain", "catechism_for_young_children", "CatechismPage/catechism_for_young_children"),
new ("Chalcedonian Definition", 451, "Public Domain", "chalcedonian_definition", "CreedPage/chalcedonian_definition"),
new ("Chicago Statement on Biblical Inerrancy", 1978, "Copyright - Alliance of Confessing Evangelicals, Inc", "chicago_statement_on_biblical_inerrancy", "CanonPage/chicago_statement_on_biblical_inerrancy"),
new ("Christ Hymn of Colossians", 60, "Copyright - Crossway", "christ_hymn_of_colossians", "CreedPage/christ_hymn_of_colossians"),
new ("Christ Hymn of Philippians", 60, "Copyright - Crossway", "christ_hymn_of_philippians", "CreedPage/christ_hymn_of_philippians"),
new ("Confession of Peter", 30, "Copyright - Crossway", "confession_of_peter", "CreedPage/confession_of_peter"),
new ("Consensus Tigurinus", 1549, "Public Domain", "consensus_tigurinus", "CanonPage/consensus_tigurinus"),
new ("Council of Orange", 529, "Public Domain", "council_of_orange", "CanonPage/council_of_orange"),
new ("First Confession of Basel", 1534, "Public Domain", "first_confession_of_basel", "CanonPage/first_confession_of_basel"),
new ("First Helvetic Confession", 1536, "Public Domain - Translated by George Wishart (1537?)", "first_helvetic_confession", "CanonPage/first_helvetic_confession"),
new ("French Confession of Faith", 1559, "Public Domain - Translated by Emily O. Bulter (1692)", "french_confession_of_faith", "CanonPage/french_confession_of_faith"),
new ("Gregory's Declaration of Faith", 265, "Public Domain", "gregorys_declaration_of_faith", "CreedPage/gregorys_declaration_of_faith"),
new ("Heidelberg Catechism", 1563, "Public Domain", "heidelberg_catechism", "CatechismPage/heidelberg_catechism"),
new ("Helvetic Consensus", 1675, "Translation Copyright 1990 - Martin Klauber", "helvetic_consensus", "CanonPage/helvetic_consensus"),
new ("Irenaeus' Rule of Faith", 180, "Public Domain", "irenaeus_rule_of_faith", "CreedPage/irenaeus_rule_of_faith"),
new ("Keach's Catechism", 1693, "Public Domain", "keachs_catechism", "CatechismPage/keachs_catechism"),
new ("1689 London Baptist Confession", 1677, "Public Domain", "london_baptist_1689", "ConfessionPage/london_baptist_1689"),
new ("Matthew Henry's Scripture Catechism", 1703, "Public Domain", "matthew_henrys_scripture_catechism", "HenrysCatechismPage/matthew_henrys_scripture_catechism"),
new ("Nicene Creed", 381, "Public Domain", "nicene_creed", "CreedPage/nicene_creed"),
new ("Puritan Catechism", 1855, "Public Domain", "puritan_catechism", "CatechismPage/puritan_catechism"),
new ("Scots Confession", 1560, "Public Domain", "scots_confession", "CanonPage/scots_confession"),
new ("Second Helvetic Confession", 1562, "Public Domain", "second_helvetic_confession", "ConfessionPage/second_helvetic_confession"),
new ("Shema Yisrael", -1500, "Copyright - Crossway", "shema_yisrael", "CreedPage/shema_yisrael"),
new ("Ten Theses of Berne", 1528, "Public Domain", "ten_theses_of_berne", "CanonPage/ten_theses_of_berne"),
new ("Tetrapolitan Confession", 1530, "Public Domain", "tetrapolitan_confession", "CanonPage/tetrapolitan_confession"),
new ("Waldensian Confession", 1120, "Public Domain", "waldensian_confession", "CanonPage/waldensian_confession"),
new ("Westminster Confession of Faith", 1646, "Public Domain", "westminster_confession_of_faith", "ConfessionPage/westminster_confession_of_faith"),
new ("Westminster Larger Catechism", 1647, "Public Domain", "westminster_larger_catechism", "CatechismPage/westminster_larger_catechism"),
new ("Westminster Shorter Catechism", 1647, "Public Domain", "westminster_shorter_catechism", "CatechismPage/westminster_shorter_catechism"),
new ("Zwingli's 67 Articles", 1523, "Public Domain", "zwinglis_67_articles", "CanonPage/zwinglis_67_articles"),
new ("Zwingli's Fidei Ratio", 1530, "Public Domain - Translated by Thomas Cotsforde (1555)", "zwinglis_fidei_ratio", "CanonPage/zwinglis_fidei_ratio")
        };

        public Summary GetSummary(string filename) => Creeds.FirstOrDefault(c => c.FileName == filename);

        public async Task<Document<T>> LoadDocumentAsync<T>(Summary summary) => Creeds.Any(c => c == summary)
            ? await _loader.LoadAsync<Document<T>>($"creeds/{Creeds.First(c => c == summary).FileName}.json")
            : null;
    }
}
