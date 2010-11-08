From: facugaich <facugaich@gmail.com>
Date: Mon, 08 Nov 2010 16:01:47 +0000
Subject: [PATCH resend] Staging: solo6x10: Fix checkpatch errors and most warnings
Message-Id: <1289232107-2251-1-git-send-email-facugaich@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch fixes all errors and most warnings reported by
checkpatch.pl for all the files in the driver.
Signed-off-by: Facundo Gaich <facugaich@gmail.com>
---
 drivers/staging/solo6x10/solo6010-core.c     |   30 +++---
 drivers/staging/solo6x10/solo6010-disp.c     |    6 +-
 drivers/staging/solo6x10/solo6010-enc.c      |    6 +-
 drivers/staging/solo6x10/solo6010-g723.c     |   22 +++--
 drivers/staging/solo6x10/solo6010-gpio.c     |    4 +-
 drivers/staging/solo6x10/solo6010-i2c.c      |    7 +-
 drivers/staging/solo6x10/solo6010-osd-font.h |   60 +++++++-------
 drivers/staging/solo6x10/solo6010-p2m.c      |    4 +-
 drivers/staging/solo6x10/solo6010-tw28.c     |  118 +++++++++++++-------------
 drivers/staging/solo6x10/solo6010-v4l2-enc.c |   44 +++++-----
 drivers/staging/solo6x10/solo6010-v4l2.c     |   35 ++++----
 drivers/staging/solo6x10/solo6010.h          |    4 +-
 12 files changed, 175 insertions(+), 165 deletions(-)

diff --git a/drivers/staging/solo6x10/solo6010-core.c b/drivers/staging/solo6x10/solo6010-core.c
index 4a051cd..0b4fe59 100644
--- a/drivers/staging/solo6x10/solo6010-core.c
+++ b/drivers/staging/solo6x10/solo6010-core.c
@@ -163,21 +163,21 @@ static int __devinit solo6010_pci_probe(struct pci_dev *pdev,
 	chip_id = solo_reg_read(solo_dev, SOLO_CHIP_OPTION) &
 					SOLO_CHIP_ID_MASK;
 	switch (chip_id) {
-		case 7:
-			solo_dev->nr_chans = 16;
-			solo_dev->nr_ext = 5;
-			break;
-		case 6:
-			solo_dev->nr_chans = 8;
-			solo_dev->nr_ext = 2;
-			break;
-		default:
-			dev_warn(&pdev->dev, "Invalid chip_id 0x%02x, "
-				 "defaulting to 4 channels\n",
-				 chip_id);
-		case 5:
-			solo_dev->nr_chans = 4;
-			solo_dev->nr_ext = 1;
+	case 7:
+		solo_dev->nr_chans = 16;
+		solo_dev->nr_ext = 5;
+		break;
+	case 6:
+		solo_dev->nr_chans = 8;
+		solo_dev->nr_ext = 2;
+		break;
+	default:
+		dev_warn(&pdev->dev, "Invalid chip_id 0x%02x, "
+			 "defaulting to 4 channels\n",
+			 chip_id);
+	case 5:
+		solo_dev->nr_chans = 4;
+		solo_dev->nr_ext = 1;
 	}
 
 	/* Disable all interrupts to start */
diff --git a/drivers/staging/solo6x10/solo6010-disp.c b/drivers/staging/solo6x10/solo6010-disp.c
index 555f024..a8389de 100644
--- a/drivers/staging/solo6x10/solo6010-disp.c
+++ b/drivers/staging/solo6x10/solo6010-disp.c
@@ -198,12 +198,12 @@ static void solo_motion_config(struct solo6010_dev *solo_dev)
 	}
 
 	/* Default motion settings */
-        solo_reg_write(solo_dev, SOLO_VI_MOT_ADR, SOLO_VI_MOTION_EN(0) |
+	solo_reg_write(solo_dev, SOLO_VI_MOT_ADR, SOLO_VI_MOTION_EN(0) |
 		       (SOLO_MOTION_EXT_ADDR(solo_dev) >> 16));
 	solo_reg_write(solo_dev, SOLO_VI_MOT_CTRL,
 		       SOLO_VI_MOTION_FRAME_COUNT(3) |
 		       SOLO_VI_MOTION_SAMPLE_LENGTH(solo_dev->video_hsize / 16)
-		       | //SOLO_VI_MOTION_INTR_START_STOP |
+		       | /*SOLO_VI_MOTION_INTR_START_STOP |*/
 		       SOLO_VI_MOTION_SAMPLE_COUNT(10));
 
 	solo_reg_write(solo_dev, SOLO_VI_MOTION_BORDER, 0);
@@ -264,7 +264,7 @@ void solo_disp_exit(struct solo6010_dev *solo_dev)
 	solo_reg_write(solo_dev, SOLO_VO_RECTANGLE_CTRL(0), 0);
 	solo_reg_write(solo_dev, SOLO_VO_RECTANGLE_START(0), 0);
 	solo_reg_write(solo_dev, SOLO_VO_RECTANGLE_STOP(0), 0);
-	
+
 	solo_reg_write(solo_dev, SOLO_VO_RECTANGLE_CTRL(1), 0);
 	solo_reg_write(solo_dev, SOLO_VO_RECTANGLE_START(1), 0);
 	solo_reg_write(solo_dev, SOLO_VO_RECTANGLE_STOP(1), 0);
diff --git a/drivers/staging/solo6x10/solo6010-enc.c b/drivers/staging/solo6x10/solo6010-enc.c
index a6cf0a8..481a492 100644
--- a/drivers/staging/solo6x10/solo6010-enc.c
+++ b/drivers/staging/solo6x10/solo6010-enc.c
@@ -22,7 +22,7 @@
 #include "solo6010.h"
 #include "solo6010-osd-font.h"
 
-#define CAPTURE_MAX_BANDWIDTH		32	// D1 4channel (D1 = 4)
+#define CAPTURE_MAX_BANDWIDTH		32	/* D1 4channel (D1 = 4) */
 #define OSG_BUFFER_SIZE			1024
 
 #define VI_PROG_HSIZE			(1280 - 16)
@@ -145,8 +145,8 @@ int solo_osd_print(struct solo_enc_dev *solo_enc)
 
 	solo_p2m_dma(solo_dev, 0, 1, buf, SOLO_EOSD_EXT_ADDR(solo_dev) +
 		     (solo_enc->ch * SOLO_EOSD_EXT_SIZE), SOLO_EOSD_EXT_SIZE);
-        reg |= (1 << solo_enc->ch);
-        solo_reg_write(solo_dev, SOLO_VE_OSD_CH, reg);
+	reg |= (1 << solo_enc->ch);
+	solo_reg_write(solo_dev, SOLO_VE_OSD_CH, reg);
 
 	kfree(buf);
 
diff --git a/drivers/staging/solo6x10/solo6010-g723.c b/drivers/staging/solo6x10/solo6010-g723.c
index 82fbcb8..254b46a 100644
--- a/drivers/staging/solo6x10/solo6010-g723.c
+++ b/drivers/staging/solo6x10/solo6010-g723.c
@@ -47,7 +47,7 @@
  * is broken down to 20 * 48 byte regions (one for each channel possible)
  * with the rest of the page being dummy data. */
 #define MAX_BUFFER		(G723_PERIOD_BYTES * PERIODS_MAX)
-#define IRQ_PAGES		4 // 0 - 4
+#define IRQ_PAGES		4 /* 0 - 4 */
 #define PERIODS_MIN		(1 << IRQ_PAGES)
 #define PERIODS_MAX		G723_FDMA_PAGES
 
@@ -158,7 +158,7 @@ static int snd_solo_pcm_close(struct snd_pcm_substream *ss)
 	snd_pcm_substream_chip(ss) = solo_pcm->solo_dev;
 	kfree(solo_pcm);
 
-        return 0;
+	return 0;
 }
 
 static int snd_solo_pcm_trigger(struct snd_pcm_substream *ss, int cmd)
@@ -197,7 +197,7 @@ static int snd_solo_pcm_trigger(struct snd_pcm_substream *ss, int cmd)
 
 static int snd_solo_pcm_prepare(struct snd_pcm_substream *ss)
 {
-        return 0;
+	return 0;
 }
 
 static snd_pcm_uframes_t snd_solo_pcm_pointer(struct snd_pcm_substream *ss)
@@ -271,7 +271,7 @@ static int snd_solo_capture_volume_get(struct snd_kcontrol *kcontrol,
 
 	value->value.integer.value[0] = tw28_get_audio_gain(solo_dev, ch);
 
-        return 0;
+	return 0;
 }
 
 static int snd_solo_capture_volume_put(struct snd_kcontrol *kcontrol,
@@ -279,15 +279,15 @@ static int snd_solo_capture_volume_put(struct snd_kcontrol *kcontrol,
 {
 	struct solo6010_dev *solo_dev = snd_kcontrol_chip(kcontrol);
 	u8 ch = value->id.numid - 1;
-        u8 old_val;
+	u8 old_val;
 
-        old_val = tw28_get_audio_gain(solo_dev, ch);
+	old_val = tw28_get_audio_gain(solo_dev, ch);
 	if (old_val = value->value.integer.value[0])
 		return 0;
 
 	tw28_set_audio_gain(solo_dev, ch, value->value.integer.value[0]);
 
-        return 1;
+	return 1;
 }
 
 static struct snd_kcontrol_new snd_solo_capture_volume = {
@@ -368,14 +368,16 @@ int solo_g723_init(struct solo6010_dev *solo_dev)
 	strcpy(card->mixername, "SOLO-6010");
 	kctl = snd_solo_capture_volume;
 	kctl.count = solo_dev->nr_chans;
-        ret = snd_ctl_add(card, snd_ctl_new1(&kctl, solo_dev));
+	ret = snd_ctl_add(card, snd_ctl_new1(&kctl, solo_dev));
 	if (ret < 0)
 		return ret;
 
-	if ((ret = solo_snd_pcm_init(solo_dev)) < 0)
+	ret = solo_snd_pcm_init(solo_dev);
+	if (ret < 0)
 		goto snd_error;
 
-	if ((ret = snd_card_register(card)) < 0)
+	ret = snd_card_register(card);
+	if (ret < 0)
 		goto snd_error;
 
 	solo_g723_config(solo_dev);
diff --git a/drivers/staging/solo6x10/solo6010-gpio.c b/drivers/staging/solo6x10/solo6010-gpio.c
index 46f7a71..8869b88 100644
--- a/drivers/staging/solo6x10/solo6010-gpio.c
+++ b/drivers/staging/solo6x10/solo6010-gpio.c
@@ -92,8 +92,8 @@ static void solo_gpio_config(struct solo6010_dev *solo_dev)
 
 int solo_gpio_init(struct solo6010_dev *solo_dev)
 {
-        solo_gpio_config(solo_dev);
-        return 0;
+	solo_gpio_config(solo_dev);
+	return 0;
 }
 
 void solo_gpio_exit(struct solo6010_dev *solo_dev)
diff --git a/drivers/staging/solo6x10/solo6010-i2c.c b/drivers/staging/solo6x10/solo6010-i2c.c
index cadd512..75c2394 100644
--- a/drivers/staging/solo6x10/solo6010-i2c.c
+++ b/drivers/staging/solo6x10/solo6010-i2c.c
@@ -46,7 +46,7 @@ u8 solo_i2c_readbyte(struct solo6010_dev *solo_dev, int id, u8 addr, u8 off)
 
 	i2c_transfer(&solo_dev->i2c_adap[id], msgs, 2);
 
-        return data;
+	return data;
 }
 
 void solo_i2c_writebyte(struct solo6010_dev *solo_dev, int id, u8 addr,
@@ -225,7 +225,7 @@ static int solo_i2c_master_xfer(struct i2c_adapter *adap,
 	}
 
 	if (i = SOLO_I2C_ADAPTERS)
-		return num; // XXX Right return value for failure?
+		return num; /* XXX Right return value for failure? */
 
 	down(&solo_dev->i2c_sem);
 	solo_dev->i2c_id = i;
@@ -296,7 +296,8 @@ int solo_i2c_init(struct solo6010_dev *solo_dev)
 		adap->retries = 1;
 		adap->dev.parent = &solo_dev->pdev->dev;
 
-		if ((ret = i2c_add_adapter(adap))) {
+		ret = i2c_add_adapter(adap);
+		if (ret) {
 			adap->algo_data = NULL;
 			break;
 		}
diff --git a/drivers/staging/solo6x10/solo6010-osd-font.h b/drivers/staging/solo6x10/solo6010-osd-font.h
index d6f565b..d72efbb 100644
--- a/drivers/staging/solo6x10/solo6010-osd-font.h
+++ b/drivers/staging/solo6x10/solo6010-osd-font.h
@@ -22,7 +22,7 @@
 
 static const unsigned int solo_osd_font[] = {
 	0x00000000, 0x0000c0c8, 0xccfefe0c, 0x08000000,
-	0x00000000, 0x10103838, 0x7c7cfefe, 0x00000000,	// 0
+	0x00000000, 0x10103838, 0x7c7cfefe, 0x00000000,	/* 0 */
 	0x00000000, 0xfefe7c7c, 0x38381010, 0x10000000,
 	0x00000000, 0x7c82fefe, 0xfefefe7c, 0x00000000,
 	0x00000000, 0x00001038, 0x10000000, 0x00000000,
@@ -54,67 +54,67 @@ static const unsigned int solo_osd_font[] = {
 	0x0000003f, 0x7f404c52, 0x524c407f, 0x00000000,
 	0x0000007c, 0x82ba82ba, 0x82ba82fe, 0x00000000,
 	0x00000000, 0x00000000, 0x00000000, 0x00000000,
-	0x00000000, 0x183c3c3c, 0x18180018, 0x18000000,	// 32   !
+	0x00000000, 0x183c3c3c, 0x18180018, 0x18000000,	/* 32   ! */
 	0x00000066, 0x66240000, 0x00000000, 0x00000000,
-	0x00000000, 0x6c6cfe6c, 0x6c6cfe6c, 0x6c000000,	// 34 " #
+	0x00000000, 0x6c6cfe6c, 0x6c6cfe6c, 0x6c000000,	/* 34 " # */
 	0x00001010, 0x7cd6d616, 0x7cd0d6d6, 0x7c101000,
-	0x00000000, 0x0086c660, 0x30180cc6, 0xc2000000,	// 36 $ %
+	0x00000000, 0x0086c660, 0x30180cc6, 0xc2000000,	/* 36 $ % */
 	0x00000000, 0x386c6c38, 0xdc766666, 0xdc000000,
-	0x0000000c, 0x0c0c0600, 0x00000000, 0x00000000,	// 38 & '
+	0x0000000c, 0x0c0c0600, 0x00000000, 0x00000000,	/* 38 & ' */
 	0x00000000, 0x30180c0c, 0x0c0c0c18, 0x30000000,
-	0x00000000, 0x0c183030, 0x30303018, 0x0c000000,	// 40 ( )
+	0x00000000, 0x0c183030, 0x30303018, 0x0c000000,	/* 40 ( ) */
 	0x00000000, 0x0000663c, 0xff3c6600, 0x00000000,
-	0x00000000, 0x00001818, 0x7e181800, 0x00000000,	// 42 * +
+	0x00000000, 0x00001818, 0x7e181800, 0x00000000,	/* 42 * + */
 	0x00000000, 0x00000000, 0x00000e0e, 0x0c060000,
-	0x00000000, 0x00000000, 0x7e000000, 0x00000000,	// 44 , -
+	0x00000000, 0x00000000, 0x7e000000, 0x00000000,	/* 44 , - */
 	0x00000000, 0x00000000, 0x00000006, 0x06000000,
-	0x00000000, 0x80c06030, 0x180c0602, 0x00000000,	// 46 . /
+	0x00000000, 0x80c06030, 0x180c0602, 0x00000000,	/* 46 . / */
 	0x0000007c, 0xc6e6f6de, 0xcec6c67c, 0x00000000,
-	0x00000030, 0x383c3030, 0x303030fc, 0x00000000,	// 48 0 1
+	0x00000030, 0x383c3030, 0x303030fc, 0x00000000,	/* 48 0 1 */
 	0x0000007c, 0xc6c06030, 0x180cc6fe, 0x00000000,
-	0x0000007c, 0xc6c0c07c, 0xc0c0c67c, 0x00000000,	// 50 2 3
+	0x0000007c, 0xc6c0c07c, 0xc0c0c67c, 0x00000000,	/* 50 2 3 */
 	0x00000060, 0x70786c66, 0xfe6060f0, 0x00000000,
-	0x000000fe, 0x0606067e, 0xc0c0c67c, 0x00000000,	// 52 4 5
+	0x000000fe, 0x0606067e, 0xc0c0c67c, 0x00000000,	/* 52 4 5 */
 	0x00000038, 0x0c06067e, 0xc6c6c67c, 0x00000000,
-	0x000000fe, 0xc6c06030, 0x18181818, 0x00000000,	// 54 6 7
+	0x000000fe, 0xc6c06030, 0x18181818, 0x00000000,	/* 54 6 7 */
 	0x0000007c, 0xc6c6c67c, 0xc6c6c67c, 0x00000000,
-	0x0000007c, 0xc6c6c6fc, 0xc0c06038, 0x00000000,	// 56 8 9
+	0x0000007c, 0xc6c6c6fc, 0xc0c06038, 0x00000000,	/* 56 8 9 */
 	0x00000000, 0x18180000, 0x00181800, 0x00000000,
-	0x00000000, 0x18180000, 0x0018180c, 0x00000000,	// 58 : ;
+	0x00000000, 0x18180000, 0x0018180c, 0x00000000,	/* 58 : ; */
 	0x00000060, 0x30180c06, 0x0c183060, 0x00000000,
 	0x00000000, 0x007e0000, 0x007e0000, 0x00000000,
 	0x00000006, 0x0c183060, 0x30180c06, 0x00000000,
 	0x0000007c, 0xc6c66030, 0x30003030, 0x00000000,
 	0x0000007c, 0xc6f6d6d6, 0x7606067c, 0x00000000,
-	0x00000010, 0x386cc6c6, 0xfec6c6c6, 0x00000000,	// 64 @ A
+	0x00000010, 0x386cc6c6, 0xfec6c6c6, 0x00000000,	/* 64 @ A */
 	0x0000007e, 0xc6c6c67e, 0xc6c6c67e, 0x00000000,
-	0x00000078, 0xcc060606, 0x0606cc78, 0x00000000,	// 66
+	0x00000078, 0xcc060606, 0x0606cc78, 0x00000000,	/* 66 */
 	0x0000003e, 0x66c6c6c6, 0xc6c6663e, 0x00000000,
-	0x000000fe, 0x0606063e, 0x060606fe, 0x00000000,	// 68
+	0x000000fe, 0x0606063e, 0x060606fe, 0x00000000,	/* 68 */
 	0x000000fe, 0x0606063e, 0x06060606, 0x00000000,
-	0x00000078, 0xcc060606, 0xf6c6ccb8, 0x00000000,	// 70
+	0x00000078, 0xcc060606, 0xf6c6ccb8, 0x00000000,	/* 70 */
 	0x000000c6, 0xc6c6c6fe, 0xc6c6c6c6, 0x00000000,
-	0x0000003c, 0x18181818, 0x1818183c, 0x00000000,	// 72
+	0x0000003c, 0x18181818, 0x1818183c, 0x00000000,	/* 72 */
 	0x00000060, 0x60606060, 0x6066663c, 0x00000000,
-	0x000000c6, 0xc666361e, 0x3666c6c6, 0x00000000,	// 74
+	0x000000c6, 0xc666361e, 0x3666c6c6, 0x00000000,	/* 74 */
 	0x00000006, 0x06060606, 0x060606fe, 0x00000000,
-	0x000000c6, 0xeefed6c6, 0xc6c6c6c6, 0x00000000,	// 76
+	0x000000c6, 0xeefed6c6, 0xc6c6c6c6, 0x00000000,	/* 76 */
 	0x000000c6, 0xcedefef6, 0xe6c6c6c6, 0x00000000,
-	0x00000038, 0x6cc6c6c6, 0xc6c66c38, 0x00000000,	// 78
+	0x00000038, 0x6cc6c6c6, 0xc6c66c38, 0x00000000,	/* 78 */
 	0x0000007e, 0xc6c6c67e, 0x06060606, 0x00000000,
-	0x00000038, 0x6cc6c6c6, 0xc6d67c38, 0x60000000,	// 80
+	0x00000038, 0x6cc6c6c6, 0xc6d67c38, 0x60000000,	/* 80 */
 	0x0000007e, 0xc6c6c67e, 0x66c6c6c6, 0x00000000,
-	0x0000007c, 0xc6c60c38, 0x60c6c67c, 0x00000000,	// 82
+	0x0000007c, 0xc6c60c38, 0x60c6c67c, 0x00000000,	/* 82 */
 	0x0000007e, 0x18181818, 0x18181818, 0x00000000,
-	0x000000c6, 0xc6c6c6c6, 0xc6c6c67c, 0x00000000,	// 84
+	0x000000c6, 0xc6c6c6c6, 0xc6c6c67c, 0x00000000,	/* 84 */
 	0x000000c6, 0xc6c6c6c6, 0xc66c3810, 0x00000000,
-	0x000000c6, 0xc6c6c6c6, 0xd6d6fe6c, 0x00000000,	// 86
+	0x000000c6, 0xc6c6c6c6, 0xd6d6fe6c, 0x00000000,	/* 86 */
 	0x000000c6, 0xc6c66c38, 0x6cc6c6c6, 0x00000000,
-	0x00000066, 0x66666666, 0x3c181818, 0x00000000,	// 88
+	0x00000066, 0x66666666, 0x3c181818, 0x00000000,	/* 88 */
 	0x000000fe, 0xc0603018, 0x0c0606fe, 0x00000000,
-	0x0000003c, 0x0c0c0c0c, 0x0c0c0c3c, 0x00000000,	// 90
+	0x0000003c, 0x0c0c0c0c, 0x0c0c0c3c, 0x00000000,	/* 90 */
 	0x00000002, 0x060c1830, 0x60c08000, 0x00000000,
-	0x0000003c, 0x30303030, 0x3030303c, 0x00000000,	// 92
+	0x0000003c, 0x30303030, 0x3030303c, 0x00000000,	/* 92 */
 	0x00001038, 0x6cc60000, 0x00000000, 0x00000000,
 	0x00000000, 0x00000000, 0x00000000, 0x00fe0000,
 	0x00001818, 0x30000000, 0x00000000, 0x00000000,
diff --git a/drivers/staging/solo6x10/solo6010-p2m.c b/drivers/staging/solo6x10/solo6010-p2m.c
index 7ed3ed4..723ab2b 100644
--- a/drivers/staging/solo6x10/solo6010-p2m.c
+++ b/drivers/staging/solo6x10/solo6010-p2m.c
@@ -21,7 +21,7 @@
 
 #include "solo6010.h"
 
-// #define SOLO_TEST_P2M
+/* #define SOLO_TEST_P2M */
 
 int solo_p2m_dma(struct solo6010_dev *solo_dev, u8 id, int wr,
 		 void *sys_addr, u32 ext_addr, u32 size)
@@ -147,7 +147,7 @@ static void run_p2m_test(struct solo6010_dev *solo_dev)
 	return;
 }
 #else
-#define run_p2m_test(__solo)	do{}while(0)
+#define run_p2m_test(__solo)	do {} while (0)
 #endif
 
 void solo_p2m_isr(struct solo6010_dev *solo_dev, int id)
diff --git a/drivers/staging/solo6x10/solo6010-tw28.c b/drivers/staging/solo6x10/solo6010-tw28.c
index 0159c83..905a6ad 100644
--- a/drivers/staging/solo6x10/solo6010-tw28.c
+++ b/drivers/staging/solo6x10/solo6010-tw28.c
@@ -35,107 +35,107 @@
 #define DEFAULT_VACTIVE_PAL		(312-DEFAULT_VDELAY_PAL)
 
 static u8 tbl_tw2864_template[] = {
-	0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, // 0x00
+	0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, /* 0x00 */
 	0x12, 0xf5, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
-	0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, // 0x10
+	0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, /* 0x10 */
 	0x12, 0xf5, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
-	0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, // 0x20
+	0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, /* 0x20 */
 	0x12, 0xf5, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
-	0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, // 0x30
+	0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, /* 0x30 */
 	0x12, 0xf5, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x40
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x40 */
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x50
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x50 */
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x60
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x60 */
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x70
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x70 */
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA3, 0x00,
-	0x00, 0x02, 0x00, 0xcc, 0x00, 0x80, 0x44, 0x50, // 0x80
+	0x00, 0x02, 0x00, 0xcc, 0x00, 0x80, 0x44, 0x50, /* 0x80 */
 	0x22, 0x01, 0xd8, 0xbc, 0xb8, 0x44, 0x38, 0x00,
-	0x00, 0x78, 0x72, 0x3e, 0x14, 0xa5, 0xe4, 0x05, // 0x90
+	0x00, 0x78, 0x72, 0x3e, 0x14, 0xa5, 0xe4, 0x05, /* 0x90 */
 	0x00, 0x28, 0x44, 0x44, 0xa0, 0x88, 0x5a, 0x01,
-	0x08, 0x08, 0x08, 0x08, 0x1a, 0x1a, 0x1a, 0x1a, // 0xa0
+	0x08, 0x08, 0x08, 0x08, 0x1a, 0x1a, 0x1a, 0x1a, /* 0xa0 */
 	0x00, 0x00, 0x00, 0xf0, 0xf0, 0xf0, 0xf0, 0x44,
-	0x44, 0x0a, 0x00, 0xff, 0xef, 0xef, 0xef, 0xef, // 0xb0
+	0x44, 0x0a, 0x00, 0xff, 0xef, 0xef, 0xef, 0xef, /* 0xb0 */
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0xc0
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0xc0 */
 	0x00, 0x00, 0x55, 0x00, 0xb1, 0xe4, 0x40, 0x00,
-	0x77, 0x77, 0x01, 0x13, 0x57, 0x9b, 0xdf, 0x20, // 0xd0
+	0x77, 0x77, 0x01, 0x13, 0x57, 0x9b, 0xdf, 0x20, /* 0xd0 */
 	0x64, 0xa8, 0xec, 0xd1, 0x0f, 0x11, 0x11, 0x81,
-	0x10, 0xe0, 0xbb, 0xbb, 0x00, 0x11, 0x00, 0x00, // 0xe0
+	0x10, 0xe0, 0xbb, 0xbb, 0x00, 0x11, 0x00, 0x00, /* 0xe0 */
 	0x11, 0x00, 0x00, 0x11, 0x00, 0x00, 0x11, 0x00,
-	0x83, 0xb5, 0x09, 0x78, 0x85, 0x00, 0x01, 0x20, // 0xf0
+	0x83, 0xb5, 0x09, 0x78, 0x85, 0x00, 0x01, 0x20, /* 0xf0 */
 	0x64, 0x11, 0x40, 0xaf, 0xff, 0x00, 0x00, 0x00,
 };
 
 static u8 tbl_tw2865_ntsc_template[] = {
-	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x02, // 0x00
+	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x02, /* 0x00 */
 	0x12, 0xff, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
-	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x02, // 0x10
+	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x02, /* 0x10 */
 	0x12, 0xff, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
-	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x02, // 0x20
+	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x02, /* 0x20 */
 	0x12, 0xff, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
-	0x00, 0xf0, 0x70, 0x48, 0x80, 0x80, 0x00, 0x02, // 0x30
+	0x00, 0xf0, 0x70, 0x48, 0x80, 0x80, 0x00, 0x02, /* 0x30 */
 	0x12, 0xff, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
-	0x00, 0x00, 0x90, 0x68, 0x00, 0x38, 0x80, 0x80, // 0x40
+	0x00, 0x00, 0x90, 0x68, 0x00, 0x38, 0x80, 0x80, /* 0x40 */
 	0x80, 0x80, 0x77, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x50
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x50 */
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x45, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x60
+	0x45, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x60 */
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x43,
-	0x08, 0x00, 0x00, 0x01, 0xf1, 0x03, 0xEF, 0x03, // 0x70
+	0x08, 0x00, 0x00, 0x01, 0xf1, 0x03, 0xEF, 0x03, /* 0x70 */
 	0xE9, 0x03, 0xD9, 0x15, 0x15, 0xE4, 0xA3, 0x80,
-	0x00, 0x02, 0x00, 0xCC, 0x00, 0x80, 0x44, 0x50, // 0x80
+	0x00, 0x02, 0x00, 0xCC, 0x00, 0x80, 0x44, 0x50, /* 0x80 */
 	0x22, 0x01, 0xD8, 0xBC, 0xB8, 0x44, 0x38, 0x00,
-	0x00, 0x78, 0x44, 0x3D, 0x14, 0xA5, 0xE0, 0x05, // 0x90
+	0x00, 0x78, 0x44, 0x3D, 0x14, 0xA5, 0xE0, 0x05, /* 0x90 */
 	0x00, 0x28, 0x44, 0x44, 0xA0, 0x90, 0x52, 0x13,
-	0x08, 0x08, 0x08, 0x08, 0x1A, 0x1A, 0x1B, 0x1A, // 0xa0
+	0x08, 0x08, 0x08, 0x08, 0x1A, 0x1A, 0x1B, 0x1A, /* 0xa0 */
 	0x00, 0x00, 0x00, 0xF0, 0xF0, 0xF0, 0xF0, 0x44,
-	0x44, 0x4A, 0x00, 0xFF, 0xEF, 0xEF, 0xEF, 0xEF, // 0xb0
+	0x44, 0x4A, 0x00, 0xFF, 0xEF, 0xEF, 0xEF, 0xEF, /* 0xb0 */
 	0xFF, 0xE7, 0xE9, 0xE9, 0xEB, 0xFF, 0xD6, 0xD8,
-	0xD8, 0xD7, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0xc0
+	0xD8, 0xD7, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0xc0 */
 	0x00, 0x00, 0x55, 0x00, 0xE4, 0x39, 0x00, 0x80,
-	0x77, 0x77, 0x03, 0x20, 0x57, 0x9b, 0xdf, 0x31, // 0xd0
+	0x77, 0x77, 0x03, 0x20, 0x57, 0x9b, 0xdf, 0x31, /* 0xd0 */
 	0x64, 0xa8, 0xec, 0xd1, 0x0f, 0x11, 0x11, 0x81,
-	0x10, 0xC0, 0xAA, 0xAA, 0x00, 0x11, 0x00, 0x00, // 0xe0
+	0x10, 0xC0, 0xAA, 0xAA, 0x00, 0x11, 0x00, 0x00, /* 0xe0 */
 	0x11, 0x00, 0x00, 0x11, 0x00, 0x00, 0x11, 0x00,
-	0x83, 0xB5, 0x09, 0x78, 0x85, 0x00, 0x01, 0x20, // 0xf0
+	0x83, 0xB5, 0x09, 0x78, 0x85, 0x00, 0x01, 0x20, /* 0xf0 */
 	0x64, 0x51, 0x40, 0xaf, 0xFF, 0xF0, 0x00, 0xC0,
 };
 
 static u8 tbl_tw2865_pal_template[] = {
-	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, // 0x00
+	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, /* 0x00 */
 	0x11, 0xff, 0x01, 0xc3, 0x00, 0x00, 0x01, 0x7f,
-	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, // 0x10
+	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, /* 0x10 */
 	0x11, 0xff, 0x01, 0xc3, 0x00, 0x00, 0x01, 0x7f,
-	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, // 0x20
+	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, /* 0x20 */
 	0x11, 0xff, 0x01, 0xc3, 0x00, 0x00, 0x01, 0x7f,
-	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, // 0x30
+	0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, /* 0x30 */
 	0x11, 0xff, 0x01, 0xc3, 0x00, 0x00, 0x01, 0x7f,
-	0x00, 0x94, 0x90, 0x48, 0x00, 0x38, 0x7F, 0x80, // 0x40
+	0x00, 0x94, 0x90, 0x48, 0x00, 0x38, 0x7F, 0x80, /* 0x40 */
 	0x80, 0x80, 0x77, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x50
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x50 */
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-	0x45, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x60
+	0x45, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x60 */
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x43,
-	0x08, 0x00, 0x00, 0x01, 0xf1, 0x03, 0xEF, 0x03, // 0x70
+	0x08, 0x00, 0x00, 0x01, 0xf1, 0x03, 0xEF, 0x03, /* 0x70 */
 	0xEA, 0x03, 0xD9, 0x15, 0x15, 0xE4, 0xA3, 0x80,
-	0x00, 0x02, 0x00, 0xCC, 0x00, 0x80, 0x44, 0x50, // 0x80
+	0x00, 0x02, 0x00, 0xCC, 0x00, 0x80, 0x44, 0x50, /* 0x80 */
 	0x22, 0x01, 0xD8, 0xBC, 0xB8, 0x44, 0x38, 0x00,
-	0x00, 0x78, 0x44, 0x3D, 0x14, 0xA5, 0xE0, 0x05, // 0x90
+	0x00, 0x78, 0x44, 0x3D, 0x14, 0xA5, 0xE0, 0x05, /* 0x90 */
 	0x00, 0x28, 0x44, 0x44, 0xA0, 0x90, 0x52, 0x13,
-	0x08, 0x08, 0x08, 0x08, 0x1A, 0x1A, 0x1A, 0x1A, // 0xa0
+	0x08, 0x08, 0x08, 0x08, 0x1A, 0x1A, 0x1A, 0x1A, /* 0xa0 */
 	0x00, 0x00, 0x00, 0xF0, 0xF0, 0xF0, 0xF0, 0x44,
-	0x44, 0x4A, 0x00, 0xFF, 0xEF, 0xEF, 0xEF, 0xEF, // 0xb0
+	0x44, 0x4A, 0x00, 0xFF, 0xEF, 0xEF, 0xEF, 0xEF, /* 0xb0 */
 	0xFF, 0xE7, 0xE9, 0xE9, 0xE9, 0xFF, 0xD7, 0xD8,
-	0xD9, 0xD8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0xc0
+	0xD9, 0xD8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0xc0 */
 	0x00, 0x00, 0x55, 0x00, 0xE4, 0x39, 0x00, 0x80,
-	0x77, 0x77, 0x03, 0x20, 0x57, 0x9b, 0xdf, 0x31, // 0xd0
+	0x77, 0x77, 0x03, 0x20, 0x57, 0x9b, 0xdf, 0x31, /* 0xd0 */
 	0x64, 0xa8, 0xec, 0xd1, 0x0f, 0x11, 0x11, 0x81,
-	0x10, 0xC0, 0xAA, 0xAA, 0x00, 0x11, 0x00, 0x00, // 0xe0
+	0x10, 0xC0, 0xAA, 0xAA, 0x00, 0x11, 0x00, 0x00, /* 0xe0 */
 	0x11, 0x00, 0x00, 0x11, 0x00, 0x00, 0x11, 0x00,
-	0x83, 0xB5, 0x09, 0x00, 0xA0, 0x00, 0x01, 0x20, // 0xf0
+	0x83, 0xB5, 0x09, 0x00, 0xA0, 0x00, 0x01, 0x20, /* 0xf0 */
 	0x64, 0x51, 0x40, 0xaf, 0xFF, 0xF0, 0x00, 0xC0,
 };
 
@@ -181,8 +181,8 @@ static void tw_write_and_verify(struct solo6010_dev *solo_dev, u8 addr, u8 off,
 		msleep_interruptible(1);
 	}
 
-//	printk("solo6010/tw28: Error writing register: %02x->%02x [%02x]\n",
-//		addr, off, val);
+/*	printk("solo6010/tw28: Error writing register: %02x->%02x [%02x]\n",
+		addr, off, val); */
 }
 
 static int tw2865_setup(struct solo6010_dev *solo_dev, u8 dev_addr)
@@ -217,7 +217,7 @@ static int tw2865_setup(struct solo6010_dev *solo_dev, u8 dev_addr)
 
 	for (i = 0; i < 0xff; i++) {
 		/* Skip read only registers */
-		if (i >= 0xb8 && i <= 0xc1 )
+		if (i >= 0xb8 && i <= 0xc1)
 			continue;
 		if ((i & ~0x30) = 0x00 ||
 		    (i & ~0x30) = 0x0c ||
@@ -302,7 +302,7 @@ static int tw2864_setup(struct solo6010_dev *solo_dev, u8 dev_addr)
 
 	for (i = 0; i < 0xff; i++) {
 		/* Skip read only registers */
-		if (i >= 0xb8 && i <= 0xc1 )
+		if (i >= 0xb8 && i <= 0xc1)
 			continue;
 		if ((i & ~0x30) = 0x00 ||
 		    (i & ~0x30) = 0x0c ||
@@ -334,13 +334,13 @@ static int tw2815_setup(struct solo6010_dev *solo_dev, u8 dev_addr)
 	};
 
 	u8 tbl_tw2815_sfr[] = {
-		0x00, 0x00, 0x00, 0xc0, 0x45, 0xa0, 0xd0, 0x2f, // 0x00
+		0x00, 0x00, 0x00, 0xc0, 0x45, 0xa0, 0xd0, 0x2f, /* 0x00 */
 		0x64, 0x80, 0x80, 0x82, 0x82, 0x00, 0x00, 0x00,
-		0x00, 0x0f, 0x05, 0x00, 0x00, 0x80, 0x06, 0x00, // 0x10
+		0x00, 0x0f, 0x05, 0x00, 0x00, 0x80, 0x06, 0x00, /* 0x10 */
 		0x00, 0x00, 0x00, 0xff, 0x8f, 0x00, 0x00, 0x00,
-		0x88, 0x88, 0xc0, 0x00, 0x20, 0x64, 0xa8, 0xec, // 0x20
+		0x88, 0x88, 0xc0, 0x00, 0x20, 0x64, 0xa8, 0xec, /* 0x20 */
 		0x31, 0x75, 0xb9, 0xfd, 0x00, 0x00, 0x88, 0x88,
-		0x88, 0x11, 0x00, 0x88, 0x88, 0x00,		// 0x30
+		0x88, 0x11, 0x00, 0x88, 0x88, 0x00,		/* 0x30 */
 	};
 	u8 *tbl_tw2815_common;
 	int i;
@@ -459,7 +459,7 @@ static int tw2815_setup(struct solo6010_dev *solo_dev, u8 dev_addr)
 
 		for (i = 0; i < 0x0f; i++) {
 			if (i = 0x00)
-				continue;	// read-only
+				continue;	/* read-only */
 			solo_i2c_writebyte(solo_dev, SOLO_I2C_TW,
 					   dev_addr, (ch * 0x10) + i,
 					   tbl_tw2815_common[i]);
@@ -597,7 +597,7 @@ int solo_tw28_init(struct solo6010_dev *solo_dev)
 	return 0;
 }
 
-/* 
+/*
  * We accessed the video status signal in the Techwell chip through
  * iic/i2c because the video status reported by register REG_VI_STATUS1
  * (address 0x012C) of the SOLO6010 chip doesn't give the correct video
@@ -751,7 +751,7 @@ int tw28_get_ctrl_val(struct solo6010_dev *solo_dev, u32 ctrl, u8 ch,
 		rval = tw_readbyte(solo_dev, chip_num,
 				   TW286x_BRIGHTNESS_ADDR(ch),
 				   TW_BRIGHTNESS_ADDR(ch));
-		if (is_tw286x(solo_dev, chip_num)) 
+		if (is_tw286x(solo_dev, chip_num))
 			*val = (s32)((char)rval) + 128;
 		else
 			*val = rval;
diff --git a/drivers/staging/solo6x10/solo6010-v4l2-enc.c b/drivers/staging/solo6x10/solo6010-v4l2-enc.c
index bbf3d9c..2122f26 100644
--- a/drivers/staging/solo6x10/solo6010-v4l2-enc.c
+++ b/drivers/staging/solo6x10/solo6010-v4l2-enc.c
@@ -488,7 +488,8 @@ static int solo_enc_fillbuf(struct solo_enc_fh *fh,
 		return -1;
 	}
 
-	if (!(vbuf = videobuf_to_dma_contig(vb)))
+	vbuf = videobuf_to_dma_contig(vb);
+	if (!vbuf)
 		return -1;
 
 	/* Is it ok that we mess with this buffer out of lock? */
@@ -499,7 +500,7 @@ static int solo_enc_fillbuf(struct solo_enc_fh *fh,
 	else
 		ret = solo_fill_jpeg(fh, enc_buf, vb, vbuf);
 
-	if (ret) // Ignore failures
+	if (ret) /* Ignore failures */
 		return 0;
 
 	list_del(&vb->queue);
@@ -557,7 +558,7 @@ static int solo_enc_thread(void *data)
 
 	remove_wait_queue(&solo_enc->thread_wait, &wait);
 
-        return 0;
+	return 0;
 }
 
 void solo_motion_isr(struct solo6010_dev *solo_dev)
@@ -614,7 +615,8 @@ void solo_enc_v4l2_isr(struct solo6010_dev *solo_dev)
 		jpeg_next = solo_reg_read(solo_dev,
 					SOLO_VE_JPEG_QUE(solo_dev->enc_idx));
 
-		if ((ch = (mpeg_current >> 24) & 0x1f) >= SOLO_MAX_CHANNELS) {
+		ch = (mpeg_current >> 24) & 0x1f;
+		if (ch >= SOLO_MAX_CHANNELS) {
 			ch -= SOLO_MAX_CHANNELS;
 			enc_type = SOLO_ENC_TYPE_EXT;
 		} else
@@ -669,12 +671,12 @@ void solo_enc_v4l2_isr(struct solo6010_dev *solo_dev)
 static int solo_enc_buf_setup(struct videobuf_queue *vq, unsigned int *count,
 			      unsigned int *size)
 {
-        *size = FRAME_BUF_SIZE;
+	*size = FRAME_BUF_SIZE;
 
-        if (*count < MIN_VID_BUFFERS)
+	if (*count < MIN_VID_BUFFERS)
 		*count = MIN_VID_BUFFERS;
 
-        return 0;
+	return 0;
 }
 
 static int solo_enc_buf_prepare(struct videobuf_queue *vq,
@@ -750,7 +752,8 @@ static int solo_enc_open(struct file *file)
 	struct solo_enc_dev *solo_enc = video_drvdata(file);
 	struct solo_enc_fh *fh;
 
-	if ((fh = kzalloc(sizeof(*fh), GFP_KERNEL)) = NULL)
+	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
+	if (fh = NULL)
 		return -ENOMEM;
 
 	spin_lock(&solo_enc->lock);
@@ -785,7 +788,7 @@ static ssize_t solo_enc_read(struct file *file, char __user *data,
 
 		spin_lock(&solo_enc->lock);
 		ret = solo_enc_on(fh);
-	        spin_unlock(&solo_enc->lock);
+		spin_unlock(&solo_enc->lock);
 		if (ret)
 			return ret;
 	}
@@ -915,9 +918,8 @@ static int solo_enc_try_fmt_cap(struct file *file, void *priv,
 
 	if (pix->field = V4L2_FIELD_ANY)
 		pix->field = V4L2_FIELD_INTERLACED;
-	else if (pix->field != V4L2_FIELD_INTERLACED) {
+	else if (pix->field != V4L2_FIELD_INTERLACED)
 		pix->field = V4L2_FIELD_INTERLACED;
-	}
 
 	/* Just set these */
 	pix->colorspace = V4L2_COLORSPACE_SMPTE170M;
@@ -937,7 +939,8 @@ static int solo_enc_set_fmt_cap(struct file *file, void *priv,
 
 	spin_lock(&solo_enc->lock);
 
-	if ((ret = solo_enc_try_fmt_cap(file, priv, f))) {
+	ret = solo_enc_try_fmt_cap(file, priv, f);
+	if (ret) {
 		spin_unlock(&solo_enc->lock);
 		return ret;
 	}
@@ -977,7 +980,7 @@ static int solo_enc_get_fmt_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_enc_reqbufs(struct file *file, void *priv, 
+static int solo_enc_reqbufs(struct file *file, void *priv,
 			    struct v4l2_requestbuffers *req)
 {
 	struct solo_enc_fh *fh = priv;
@@ -1136,7 +1139,7 @@ static int solo_g_parm(struct file *file, void *priv,
 	/* XXX: Shouldn't we be able to get/set this from videobuf? */
 	cp->readbuffers = 2;
 
-        return 0;
+	return 0;
 }
 
 static int solo_s_parm(struct file *file, void *priv,
@@ -1176,7 +1179,7 @@ static int solo_s_parm(struct file *file, void *priv,
 
 	spin_unlock(&solo_enc->lock);
 
-        return 0;
+	return 0;
 }
 
 static int solo_queryctrl(struct file *file, void *priv,
@@ -1240,7 +1243,7 @@ static int solo_queryctrl(struct file *file, void *priv,
 		return 0;
 	}
 
-        return -EINVAL;
+	return -EINVAL;
 }
 
 static int solo_querymenu(struct file *file, void *priv,
@@ -1250,7 +1253,8 @@ static int solo_querymenu(struct file *file, void *priv,
 	int err;
 
 	qctrl.id = qmenu->id;
-	if ((err = solo_queryctrl(file, priv, &qctrl)))
+	err = solo_queryctrl(file, priv, &qctrl);
+	if (err)
 		return err;
 
 	return v4l2_ctrl_query_menu(qmenu, &qctrl, NULL);
@@ -1350,9 +1354,9 @@ static int solo_s_ext_ctrls(struct file *file, void *priv,
 		switch (ctrl->id) {
 		case V4L2_CID_RDS_TX_RADIO_TEXT:
 			if (ctrl->size - 1 > OSD_TEXT_MAX)
-                                err = -ERANGE;
+				err = -ERANGE;
 			else {
-                        	err = copy_from_user(solo_enc->osd_text,
+				err = copy_from_user(solo_enc->osd_text,
 						     ctrl->string,
 						     OSD_TEXT_MAX);
 				solo_enc->osd_text[OSD_TEXT_MAX] = '\0';
@@ -1505,7 +1509,7 @@ static struct solo_enc_dev *solo_enc_alloc(struct solo6010_dev *solo_dev, u8 ch)
 	atomic_set(&solo_enc->readers, 0);
 
 	solo_enc->qp = SOLO_DEFAULT_QP;
-        solo_enc->gop = solo_dev->fps;
+	solo_enc->gop = solo_dev->fps;
 	solo_enc->interval = 1;
 	solo_enc->mode = SOLO_ENC_MODE_CIF;
 	solo_enc->motion_thresh = SOLO_DEF_MOT_THRESH;
diff --git a/drivers/staging/solo6x10/solo6010-v4l2.c b/drivers/staging/solo6x10/solo6010-v4l2.c
index 9731fa0..1340f1d 100644
--- a/drivers/staging/solo6x10/solo6010-v4l2.c
+++ b/drivers/staging/solo6x10/solo6010-v4l2.c
@@ -31,7 +31,7 @@
 
 #define SOLO_HW_BPL		2048
 #define SOLO_DISP_PIX_FIELD	V4L2_FIELD_INTERLACED
-#define SOLO_DISP_BUF_SIZE	(64 * 1024) // 64k
+#define SOLO_DISP_BUF_SIZE	(64 * 1024) /* 64k */
 
 /* Image size is two fields, SOLO_HW_BPL is one horizontal line */
 #define solo_vlines(__solo)	(__solo->video_vsize * 2)
@@ -96,7 +96,7 @@ static void solo_win_setup(struct solo6010_dev *solo_dev, u8 ch,
 		       SOLO_VI_WIN_EX(ex) |
 		       SOLO_VI_WIN_SCALE(scale));
 
-        solo_reg_write(solo_dev, SOLO_VI_WIN_CTRL1(ch),
+	solo_reg_write(solo_dev, SOLO_VI_WIN_CTRL1(ch),
 		       SOLO_VI_WIN_SY(sy) |
 		       SOLO_VI_WIN_EY(ey));
 }
@@ -213,7 +213,8 @@ static void solo_fillbuf(struct solo_filehandle *fh,
 	int error = 1;
 	int i;
 
-	if (!(vbuf = videobuf_to_dma_contig(vb)))
+	vbuf = videobuf_to_dma_contig(vb)
+	if (!vbuf)
 		goto finish_buf;
 
 	if (erase_off(solo_dev)) {
@@ -310,7 +311,7 @@ static int solo_thread(void *data)
 
 	remove_wait_queue(&solo_dev->disp_thread_wait, &wait);
 
-        return 0;
+	return 0;
 }
 
 static int solo_start_thread(struct solo_filehandle *fh)
@@ -337,12 +338,12 @@ static int solo_buf_setup(struct videobuf_queue *vq, unsigned int *count,
 	struct solo_filehandle *fh = vq->priv_data;
 	struct solo6010_dev *solo_dev  = fh->solo_dev;
 
-        *size = solo_image_size(solo_dev);
+	*size = solo_image_size(solo_dev);
 
-        if (*count < MIN_VID_BUFFERS)
+	if (*count < MIN_VID_BUFFERS)
 		*count = MIN_VID_BUFFERS;
 
-        return 0;
+	return 0;
 }
 
 static int solo_buf_prepare(struct videobuf_queue *vq,
@@ -404,7 +405,7 @@ static unsigned int solo_v4l2_poll(struct file *file,
 {
 	struct solo_filehandle *fh = file->private_data;
 
-        return videobuf_poll_stream(file, &fh->vidq, wait);
+	return videobuf_poll_stream(file, &fh->vidq, wait);
 }
 
 static int solo_v4l2_mmap(struct file *file, struct vm_area_struct *vma)
@@ -420,7 +421,8 @@ static int solo_v4l2_open(struct file *file)
 	struct solo_filehandle *fh;
 	int ret;
 
-	if ((fh = kzalloc(sizeof(*fh), GFP_KERNEL)) = NULL)
+	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
+	if (fh = NULL)
 		return -ENOMEM;
 
 	spin_lock_init(&fh->slock);
@@ -428,7 +430,8 @@ static int solo_v4l2_open(struct file *file)
 	fh->solo_dev = solo_dev;
 	file->private_data = fh;
 
-	if ((ret = solo_start_thread(fh))) {
+	ret = solo_start_thread(fh);
+	if (ret) {
 		kfree(fh);
 		return ret;
 	}
@@ -622,7 +625,7 @@ static int solo_get_fmt_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int solo_reqbufs(struct file *file, void *priv, 
+static int solo_reqbufs(struct file *file, void *priv,
 			struct v4l2_requestbuffers *req)
 {
 	struct solo_filehandle *fh = priv;
@@ -781,11 +784,11 @@ static const struct v4l2_ioctl_ops solo_v4l2_ioctl_ops = {
 	.vidioc_qbuf			= solo_qbuf,
 	.vidioc_dqbuf			= solo_dqbuf,
 	.vidioc_streamon		= solo_streamon,
-        .vidioc_streamoff		= solo_streamoff,
+	.vidioc_streamoff		= solo_streamoff,
 	/* Controls */
 	.vidioc_queryctrl		= solo_disp_queryctrl,
-        .vidioc_g_ctrl			= solo_disp_g_ctrl,
-        .vidioc_s_ctrl			= solo_disp_s_ctrl,
+	.vidioc_g_ctrl			= solo_disp_g_ctrl,
+	.vidioc_s_ctrl			= solo_disp_s_ctrl,
 };
 
 static struct video_device solo_v4l2_template = {
@@ -836,13 +839,13 @@ int solo_v4l2_init(struct solo6010_dev *solo_dev)
 	for (i = 0; i < solo_dev->nr_chans; i++) {
 		solo_v4l2_set_ch(solo_dev, i);
 		while (erase_off(solo_dev))
-			;// Do nothing
+			;/* Do nothing */
 	}
 
 	/* Set the default display channel */
 	solo_v4l2_set_ch(solo_dev, 0);
 	while (erase_off(solo_dev))
-		;// Do nothing
+		;/* Do nothing */
 
 	solo6010_irq_on(solo_dev, SOLO_IRQ_VIDEO_IN);
 
diff --git a/drivers/staging/solo6x10/solo6010.h b/drivers/staging/solo6x10/solo6010.h
index dca8e3e..4374c59 100644
--- a/drivers/staging/solo6x10/solo6010.h
+++ b/drivers/staging/solo6x10/solo6010.h
@@ -64,7 +64,7 @@
 #define SOLO6010_VER_MINOR		0
 #define SOLO6010_VER_SUB		0
 #define SOLO6010_VER_NUM \
-    KERNEL_VERSION(SOLO6010_VER_MAJOR, SOLO6010_VER_MINOR, SOLO6010_VER_SUB)
+	KERNEL_VERSION(SOLO6010_VER_MAJOR, SOLO6010_VER_MINOR, SOLO6010_VER_SUB)
 
 /*
  * The SOLO6010 actually has 8 i2c channels, but we only use 2.
@@ -212,7 +212,7 @@ struct solo6010_dev {
 	struct solo_enc_buf	enc_buf[SOLO_NR_RING_BUFS];
 
 	/* Current video settings */
-	u32 			video_type;
+	u32			video_type;
 	u16			video_hsize, video_vsize;
 	u16			vout_hstart, vout_vstart;
 	u16			vin_hstart, vin_vstart;
-- 
1.7.0.4

