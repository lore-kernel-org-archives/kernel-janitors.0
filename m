From: Colin King <colin.king@canonical.com>
Date: Thu, 20 Jul 2017 22:33:24 +0000
Subject: [PATCH] Make functions rf69_set_bandwidth_intern and rf69_set_dc_cut_off_frequency_intern static
Message-Id: <20170720223324.8093-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Colin Ian King <colin.king@canonical.com>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions rf69_set_bandwidth_intern and also
rf69_set_dc_cut_off_frequency_intern is local to the source and
do not need to be in global scope, so make it static. Also break
break overly wide line. Finally, remove the function declaration
rf69_set_dc_cut_off_frequency_intern from the rf69.h header.

Cleans up sparse warning:
symbol 'update_share_count' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/pi433/rf69.c | 7 +++++--
 drivers/staging/pi433/rf69.h | 1 -
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index e391ce777bc7..170e9cc59cde 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -400,7 +400,9 @@ enum lnaGain rf69_get_lna_gain(struct spi_device *spi)
 	}
 }
 
-int rf69_set_dc_cut_off_frequency_intern(struct spi_device *spi ,u8 reg, enum dccPercent dccPercent)
+static int rf69_set_dc_cut_off_frequency_intern(struct spi_device *spi,
+						u8 reg,
+						enum dccPercent dccPercent)
 {
 	switch (dccPercent) {
 	case dcc16Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_16_PERCENT) );
@@ -433,7 +435,8 @@ int rf69_set_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum dccPer
 	return rf69_set_dc_cut_off_frequency_intern(spi, REG_AFCBW, dccPercent);
 }
 
-int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg, enum mantisse mantisse, u8 exponent)
+static int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg,
+				     enum mantisse mantisse, u8 exponent)
 {
 	u8 newValue;
 
diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index b81e0762032e..3fdf5d3d225b 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -41,7 +41,6 @@ int rf69_set_pa_ramp(struct spi_device *spi, enum paRamp paRamp);
 int rf69_set_antenna_impedance(struct spi_device *spi, enum antennaImpedance antennaImpedance);
 int rf69_set_lna_gain(struct spi_device *spi, enum lnaGain lnaGain);
 enum lnaGain rf69_get_lna_gain(struct spi_device *spi);
-int rf69_set_dc_cut_off_frequency_intern(struct spi_device *spi, u8 reg, enum dccPercent dccPercent);
 int rf69_set_dc_cut_off_frequency(struct spi_device *spi, enum dccPercent dccPercent);
 int rf69_set_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum dccPercent dccPercent);
 int rf69_set_bandwidth(struct spi_device *spi, enum mantisse mantisse, u8 exponent);
-- 
2.11.0

