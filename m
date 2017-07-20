From: "Wolf Entwicklungen" <Marcus.Wolf@Wolf-Entwicklungen.de>
Date: Thu, 20 Jul 2017 11:01:46 +0000
Subject: Re: [PATCH 1/1][staging-next] staging: pi433: Make functions rf69_set_dc_cut_off_frequency_intern st
Message-Id: <294e80854a10c63451cf3e9d7ca02bce-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAhaW34EVVM=-webmailer1@server01.webmailer.webmailer.hosteurope.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170718130400.25436-1-colin.king@canonical.com>
    <20170718130400.25436-2-colin.king@canonical.com>
In-Reply-To: <20170718130400.25436-2-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Colin King <colin.king@canonical.com>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Declare rf69_set_dc_cut_off_frequency_intern as static since it
is used internaly only

Fixes: 874bcba65f9a ("staging: pi433: New driver")
Signed-off-by: Marcus Wolf <linux@wolf-entwicklungen.de>

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -433,7 +433,7 @@
 	return rf69_set_dc_cut_off_frequency_intern(spi, REG_AFCBW, dccPercent);
 }

-int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg, enum mantisse mantisse, u8 exponent)
+static int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg, enum mantisse mantisse, u8 exponent)
 {
 	u8 newValue;
diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -41,7 +41,6 @@
 int rf69_set_antenna_impedance(struct spi_device *spi, enum antennaImpedance antennaImpedance);
 int rf69_set_lna_gain(struct spi_device *spi, enum lnaGain lnaGain);
 enum lnaGain rf69_get_lna_gain(struct spi_device *spi);
-int rf69_set_dc_cut_off_frequency_intern(struct spi_device *spi, u8 reg, enum dccPercent dccPercent);
 int rf69_set_dc_cut_off_frequency(struct spi_device *spi, enum dccPercent dccPercent);
 int rf69_set_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum dccPercent dccPercent);
 int rf69_set_bandwidth(struct spi_device *spi, enum mantisse mantisse, u8 exponent);
