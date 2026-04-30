using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Creeds.Data;
using Xunit;

namespace Creeds.Tests
{
    public class DatabaseTests
    {
        private readonly IDatabase _db;
        private readonly Database _dbImplementation;
        private readonly JsonLoader_TestDouble _loader;

        private DatabaseTests()
        {
            _loader = new JsonLoader_TestDouble();
            _dbImplementation = new Database(_loader);
            _db = _dbImplementation;
        }

        public class Creeds : DatabaseTests
        {
            [Fact]
            public void has_approximately_the_right_number_of_creeds()
            {
                Assert.True(_db.Creeds.Count > 30);
            }

            [Theory]
            [InlineData("apostles_creed")]
            [InlineData("westminster_confession_of_faith")]
            public void has_expected_creeds(string creed)
            {
                Assert.Contains(creed, _db.Creeds.Select(c => c.FileName));
            }
        }

        public class GetSummary : DatabaseTests
        {
            [Fact]
            public void returns_a_creed()
            {
                var filename = "my_creed";
                _dbImplementation.Creeds = new List<Summary>{new (null, 0, null, filename, null)};

                var summary = _db.GetSummary(filename);

                Assert.NotNull(summary);
            }

            [Fact]
            public void returns_null_when_no_summary_found()
            {
                _dbImplementation.Creeds = new List<Summary>{new (null, 0, null, null, null)};

                var summary = _db.GetSummary("unexistant_creed");

                Assert.Null(summary);
            }
        }

        public class LoadDocumentAsync : DatabaseTests
        {
            [Fact]
            public async Task does_not_load_document_when_summary_is_null()
            {
                await _db.LoadDocumentAsync<string>(null);

                Assert.Equal(0, _loader.CountOfCallsTo_LoadAsync);
            }

            [Fact]
            public async Task does_not_load_document_when_summary_is_not_in_creed_list()
            {
                _dbImplementation.Creeds = new List<Summary>();

                await _db.LoadDocumentAsync<string>(new (null, 0, null, null, null));

                Assert.Equal(0, _loader.CountOfCallsTo_LoadAsync);
            }

            [Fact]
            public async Task calls_json_load_when_summary_is_valid()
            {
                var summary = new Summary(null, 0, null, "filename", null);
                _dbImplementation.Creeds = new List<Summary>{summary};

                await _db.LoadDocumentAsync<string>(summary);

                Assert.Equal(1, _loader.CountOfCallsTo_LoadAsync);
                Assert.Equal($"creeds/{summary.FileName}.json", _loader.LastFilePassedTo_LoadAsync);
                Assert.Equal(typeof(Document<string>), _loader.LastTypePassedTo_LoadAsync);
            }

            [Fact]
            public async Task returns_document_when_summary_is_valid()
            {
                var summary = new Summary(null, 0, null, "filename", null);
                var expectedDocument = new Document<string>();
                _dbImplementation.Creeds = new List<Summary>{summary};
                _loader.ReturnFor_LoadAsync = expectedDocument;

                var actualDocument = await _db.LoadDocumentAsync<string>(summary);

                Assert.Equal(expectedDocument, actualDocument);
            }
        }
    }
}