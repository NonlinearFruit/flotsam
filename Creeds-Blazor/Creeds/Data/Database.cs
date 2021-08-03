using System.Collections.Generic;
using Creeds.Pages;

namespace Creeds.Data {

  public class Database : IDatabase {

  public ICollection<CreedSummary> Creeds { get; } = new List<CreedSummary> {
new ( "Abstract of Principles", 1858, "Public Domain", typeof(CanonPage), "creeds/abstract_of_principles.json"),
new ( "Apostles' Creed", 710, "Public Domain", typeof(CreedPage), "creeds/apostles_creed.json"),
new ( "Athanasian Creed", 800, "Public Domain", typeof(CreedPage), "creeds/athanasian_creed.json"),
new ( "Belgic Confession", 1561, "Public Domain", typeof(CanonPage), "creeds/belgic_confession_of_faith.json"),
new ( "Canons of Dort", 1619, "Public Domain", typeof(ConfessionPage), "creeds/canons_of_dort.json"),
new ( "Catechism For Young Children", 1840, "Public Domain", typeof(CatechismPage), "creeds/catechism_for_young_children.json"),
new ( "Chalcedonian Definition", 451, "Public Domain", typeof(CreedPage), "creeds/chalcedonian_definition.json"),
new ( "Chicago Statement on Biblical Inerrancy", 1978, "Copyright - Alliance of Confessing Evangelicals, Inc", typeof(CanonPage), "creeds/chicago_statement_on_biblical_inerrancy.json"),
new ( "Christ Hymn of Colossians", 60, "Copyright - Crossway", typeof(CreedPage), "creeds/christ_hymn_of_colossians.json"),
new ( "Christ Hymn of Philippians", 60, "Copyright - Crossway", typeof(CreedPage), "creeds/christ_hymn_of_philippians.json"),
new ( "Confession of Peter", 30, "Copyright - Crossway", typeof(CreedPage), "creeds/confession_of_peter.json"),
new ( "Consensus Tigurinus", 1549, "Public Domain", typeof(CanonPage), "creeds/consensus_tigurinus.json"),
new ( "Council of Orange", 529, "Public Domain", typeof(CanonPage), "creeds/council_of_orange.json"),
new ( "First Confession of Basel", 1534, "Public Domain", typeof(CanonPage), "creeds/first_confession_of_basel.json"),
new ( "First Helvetic Confession", 1536, "Public Domain - Translated by George Wishart (1537?)", typeof(CanonPage), "creeds/first_helvetic_confession.json"),
new ( "French Confession of Faith", 1559, "Public Domain - Translated by Emily O. Bulter (1692)", typeof(CanonPage), "creeds/french_confession_of_faith.json"),
new ( "Gregory's Declaration of Faith", 265, "Public Domain", typeof(CreedPage), "creeds/gregorys_declaration_of_faith.json"),
new ( "Heidelberg Catechism", 1563, "Public Domain", typeof(CatechismPage), "creeds/heidelberg_catechism.json"),
new ( "Helvetic Consensus", 1675, "Translation Copyright 1990 - Martin Klauber", typeof(CanonPage), "creeds/helvetic_consensus.json"),
new ( "Irenaeus' Rule of Faith", 180, "Public Domain", typeof(CreedPage), "creeds/irenaeus_rule_of_faith.json"),
new ( "Keach's Catechism", 1693, "Public Domain", typeof(CatechismPage), "creeds/keachs_catechism.json"),
new ( "1689 London Baptist Confession", 1677, "Public Domain", typeof(ConfessionPage), "creeds/london_baptist_1689.json"),
new ( "Matthew Henry's Scripture Catechism", 1703, "Public Domain", typeof(HenrysCatechismPage), "creeds/matthew_henrys_scripture_catechism.json"),
new ( "Nicene Creed", 381, "Public Domain", typeof(CreedPage), "creeds/nicene_creed.json"),
new ( "Puritan Catechism", 1855, "Public Domain", typeof(CatechismPage), "creeds/puritan_catechism.json"),
new ( "Scots Confession", 1560, "Public Domain", typeof(CanonPage), "creeds/scots_confession.json"),
new ( "Second Helvetic Confession", 1562, "Public Domain", typeof(ConfessionPage), "creeds/second_helvetic_confession.json"),
new ( "Shema Yisrael", -1500, "Copyright - Crossway", typeof(CreedPage), "creeds/shema_yisrael.json"),
new ( "Ten Theses of Berne", 1528, "Public Domain", typeof(CanonPage), "creeds/ten_theses_of_berne.json"),
new ( "Tetrapolitan Confession", 1530, "Public Domain", typeof(CanonPage), "creeds/tetrapolitan_confession.json"),
new ( "Waldensian Confession", 1120, "Public Domain", typeof(CanonPage), "creeds/waldensian_confession.json"),
new ( "Westminster Confession of Faith", 1646, "Public Domain", typeof(ConfessionPage), "creeds/westminster_confession_of_faith.json"),
new ( "Westminster Larger Catechism", 1647, "Public Domain", typeof(CatechismPage), "creeds/westminster_larger_catechism.json"),
new ( "Westminster Shorter Catechism", 1647, "Public Domain", typeof(CatechismPage), "creeds/westminster_shorter_catechism.json"),
new ( "Zwingli's 67 Articles", 1523, "Public Domain", typeof(CanonPage), "creeds/zwinglis_67_articles.json"),
new ( "Zwingli's Fidei Ratio", 1530, "Public Domain - Translated by Thomas Cotsforde (1555)", typeof(CanonPage), "creeds/zwinglis_fidei_ratio.json")
}; } }
