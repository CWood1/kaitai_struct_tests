using NUnit.Framework;

namespace Kaitai
{
    [TestFixture]
    public class SpecTsPacketHeader : CommonSpec
    {
        [Test]
        public void TestTsPacketHeader()
        {
            var r = TsPacketHeader.FromFile(SourceFile("ts_packet.bin"));
            Assert.AreEqual(r.SyncByte, 0x47);
            Assert.AreEqual(r.TransportErrorIndicator, false);
            Assert.AreEqual(r.PayloadUnitStartIndicator, false);
            Assert.AreEqual(r.TransportPriority, true);
            Assert.AreEqual(r.Pid, 33);
            Assert.AreEqual(r.TransportScramblingControl, 0);
            Assert.AreEqual(r.AdaptationFieldControl, TsPacketHeader.AdaptationFieldControlEnum.PayloadOnly);
        }
    }
}
