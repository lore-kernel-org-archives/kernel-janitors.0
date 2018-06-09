From: "JoonHwan.Kim" <spilit464@gmail.com>
Date: Sat, 09 Jun 2018 06:03:27 +0000
Subject: [PATCH 1/2] staging: mt7621-spi: change indentation from space to tab
Message-Id: <1646985.m1Qjj59is2@joonhwan-virtualbox>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: neil@brown.name, blogic@openwrt.org, christian@lkamp.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

* fix checkpatch.pl error:
  ERROR: code indent should use tabs where possible

Signed-off-by: Joonhwan Kim <spilit464@gmail.com>
---
 drivers/staging/mt7621-spi/spi-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-spi/spi-mt7621.c b/drivers/staging/mt7621-spi/spi-mt7621.c
index d9b55d2059b0..a11cca3e2304 100644
--- a/drivers/staging/mt7621-spi/spi-mt7621.c
+++ b/drivers/staging/mt7621-spi/spi-mt7621.c
@@ -105,7 +105,7 @@ static void mt7621_spi_set_cs(struct spi_device *spi, int enable)
 	int cs = spi->chip_select;
 	u32 polar = 0;
 
-        mt7621_spi_reset(rs, cs);
+	mt7621_spi_reset(rs, cs);
 	if (enable)
 		polar = BIT(cs);
 	mt7621_spi_write(rs, MT7621_SPI_POLAR, polar);
-- 
2.17.0




