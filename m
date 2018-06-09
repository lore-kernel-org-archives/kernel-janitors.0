From: "JoonHwan.Kim" <spilit464@gmail.com>
Date: Sat, 09 Jun 2018 06:04:21 +0000
Subject: [PATCH 2/2] staging: mt7621-spi: fix indentation for switch statement
Message-Id: <2677421.r3Zvpk0yfm@joonhwan-virtualbox>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: neil@brown.name, blogic@openwrt.org, christian@lkamp.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

* fix checkpatch.pl error:
  ERROR: switch and case should be at the same indent

Signed-off-by: Joonhwan Kim <spilit464@gmail.com>
---
 drivers/staging/mt7621-spi/spi-mt7621.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/mt7621-spi/spi-mt7621.c b/drivers/staging/mt7621-spi/spi-mt7621.c
index a11cca3e2304..11a65ec48178 100644
--- a/drivers/staging/mt7621-spi/spi-mt7621.c
+++ b/drivers/staging/mt7621-spi/spi-mt7621.c
@@ -139,17 +139,17 @@ static int mt7621_spi_prepare(struct spi_device *spi, unsigned int speed)
 
 	reg &= ~(MT7621_CPHA | MT7621_CPOL);
 	switch(spi->mode & (SPI_CPOL | SPI_CPHA)) {
-		case SPI_MODE_0:
-			break;
-		case SPI_MODE_1:
-			reg |= MT7621_CPHA;
-			break;
-		case SPI_MODE_2:
-			reg |= MT7621_CPOL;
-			break;
-		case SPI_MODE_3:
-			reg |= MT7621_CPOL | MT7621_CPHA;
-			break;
+	case SPI_MODE_0:
+		break;
+	case SPI_MODE_1:
+		reg |= MT7621_CPHA;
+		break;
+	case SPI_MODE_2:
+		reg |= MT7621_CPOL;
+		break;
+	case SPI_MODE_3:
+		reg |= MT7621_CPOL | MT7621_CPHA;
+		break;
 	}
 	mt7621_spi_write(rs, MT7621_SPI_MASTER, reg);
 
-- 
2.17.0




