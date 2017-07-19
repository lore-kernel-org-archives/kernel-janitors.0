From: "Wolf Entwicklungen" <Marcus.Wolf@Wolf-Entwicklungen.de>
Date: Wed, 19 Jul 2017 18:18:44 +0000
Subject: [PATCH] staging: pi433: fix bugs in register abstraction of rf69 chip
Message-Id: <95873f94b04fbc67769c3fc0051d3304-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAhbV34CV1E=-webmailer1@server02.webmailer.webmailer.hosteurope.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Bugfixes for rf69_set_modulation, rf69_set_deviation, rf69_set_lna_gain and rf69_get_lna_gain
The fixes are cross-checked with the datasheet of the rfm69cw

Fixes: 874bcba65f9a ("staging: pi433: New driver")
Signed-off-by: Marcus Wolf <linux@wolf-entwicklungen.de>

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -101,7 +101,7 @@ int rf69_set_modulation(struct spi_device *spi, enum modulation modulation)

 	currentValue = READ_REG(REG_DATAMODUL);

-	switch (currentValue & MASK_DATAMODUL_MODULATION_TYPE >> 3)  // TODO improvement: change 3 to define
+	switch (currentValue & MASK_DATAMODUL_MODULATION_TYPE)
 	{
 	case DATAMODUL_MODULATION_TYPE_OOK: return OOK;
 	case DATAMODUL_MODULATION_TYPE_FSK: return FSK;
@@ -203,7 +203,7 @@ int rf69_set_deviation(struct spi_device *spi, u32 deviation)
 	lsb = (f_reg&0xff);

 	// check msb
-	if (msb & !FDEVMASB_MASK)
+	if (msb & ~FDEVMASB_MASK)
 	{
 		dev_dbg(&spi->dev, "set_deviation: err in calc of msb");
 		INVALID_PARAM;
@@ -366,13 +366,13 @@ int rf69_set_lna_gain(struct spi_device *spi, enum lnaGain lnaGain)
 	#endif

 	switch(lnaGain) {
-	case automatic:	 return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_AUTO) );
-	case max:	 return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_MAX) );
-	case maxMinus6:  return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_6) );
-	case maxMinus12: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_12) );
-	case maxMinus24: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_24) );
-	case maxMinus36: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_36) );
-	case maxMinus48: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_48) );
+	case automatic:	 return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_AUTO) );
+	case max:	 return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_MAX) );
+	case maxMinus6:  return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_6) );
+	case maxMinus12: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_12) );
+	case maxMinus24: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_24) );
+	case maxMinus36: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_36) );
+	case maxMinus48: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_48) );
 	default:	 INVALID_PARAM;
 	}
 }
@@ -387,7 +387,7 @@ enum lnaGain rf69_get_lna_gain(struct spi_device *spi)

 	currentValue = READ_REG(REG_LNA);

-	switch (currentValue & MASK_LNA_CURRENT_GAIN >> 3)  // improvement: change 3 to define
+	switch (currentValue & MASK_LNA_GAIN)
 	{
 	case LNA_GAIN_AUTO:	    return automatic;
 	case LNA_GAIN_MAX:	    return max;
