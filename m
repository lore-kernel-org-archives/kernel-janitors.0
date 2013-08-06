From: Shaun Laing <shaun@XResource.ca>
Date: Tue, 06 Aug 2013 18:33:08 +0000
Subject: [patch] staging: comedi: drivers: resolves sparse endian warnings
Message-Id: <201308061833.r76IX8Fo153840@rivendell.pollux.laing>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Resolves sparse warnings of the form:
	* cast to restricted
	* incorrect type in assignment (different base types)

Signed-off-by: Shaun Laing <shaun@xresource.ca>

---

diff --git a/drivers/staging/comedi/drivers/mite.h b/drivers/staging/comedi/drivers/mite.h
index 8423b8b..2f3f9eb 100644
--- a/drivers/staging/comedi/drivers/mite.h
+++ b/drivers/staging/comedi/drivers/mite.h
@@ -36,10 +36,10 @@
 #define MAX_MITE_DMA_CHANNELS 8
 
 struct mite_dma_descriptor {
-	u32 count;
-	u32 addr;
-	u32 next;
-	u32 dar;
+	__le32 count;
+	__le32 addr;
+	__le32 next;
+	__le32 dar;
 };
 
 struct mite_dma_descriptor_ring {
diff --git a/drivers/staging/comedi/drivers/ni_pcimio.c b/drivers/staging/comedi/drivers/ni_pcimio.c
index 536be83..29c95ca 100644
--- a/drivers/staging/comedi/drivers/ni_pcimio.c
+++ b/drivers/staging/comedi/drivers/ni_pcimio.c
@@ -1394,6 +1394,7 @@ static void m_series_init_eeprom_buffer(struct comedi_device *dev)
 	unsigned old_iodwbsr1_bits;
 	unsigned old_iodwcr1_bits;
 	int i;
+	__be32 tmp32 = 0;
 
 	old_iodwbsr_bits = readl(devpriv->mite->mite_io_addr + MITE_IODWBSR);
 	old_iodwbsr1_bits = readl(devpriv->mite->mite_io_addr + MITE_IODWBSR_1);
@@ -1407,10 +1408,10 @@ static void m_series_init_eeprom_buffer(struct comedi_device *dev)
 
 	BUG_ON(serial_number_eeprom_length > sizeof(devpriv->serial_number));
 	for (i = 0; i < serial_number_eeprom_length; ++i) {
-		char *byte_ptr = (char *)&devpriv->serial_number + i;
+		char *byte_ptr = (char *)&tmp32 + i;
 		*byte_ptr = ni_readb(serial_number_eeprom_offset + i);
 	}
-	devpriv->serial_number = be32_to_cpu(devpriv->serial_number);
+	devpriv->serial_number = be32_to_cpu(tmp32);
 
 	for (i = 0; i < M_SERIES_EEPROM_SIZE; ++i)
 		devpriv->eeprom_buffer[i] = ni_readb(Start_Cal_EEPROM + i);
diff --git a/drivers/staging/comedi/drivers/usbdux.c b/drivers/staging/comedi/drivers/usbdux.c
index 689b452..cd9e686 100644
--- a/drivers/staging/comedi/drivers/usbdux.c
+++ b/drivers/staging/comedi/drivers/usbdux.c
@@ -199,9 +199,9 @@ struct usbdux_private {
 	/* size of the PWM buffer which holds the bit pattern */
 	int pwm_buf_sz;
 	/* input buffer for the ISO-transfer */
-	int16_t *in_buf;
+	__le16 *in_buf;
 	/* input buffer for single insn */
-	int16_t *insn_buf;
+	__le16 *insn_buf;
 
 	int8_t ao_chanlist[USBDUX_NUM_AO_CHAN];
 	unsigned int ao_readback[USBDUX_NUM_AO_CHAN];
diff --git a/drivers/staging/comedi/drivers/usbduxsigma.c b/drivers/staging/comedi/drivers/usbduxsigma.c
index fca89c3..1dff45e 100644
--- a/drivers/staging/comedi/drivers/usbduxsigma.c
+++ b/drivers/staging/comedi/drivers/usbduxsigma.c
@@ -157,7 +157,7 @@ struct usbduxsigma_private {
 	/* size of the PWM buffer which holds the bit pattern */
 	int pwm_buf_sz;
 	/* input buffer for the ISO-transfer */
-	int32_t *in_buf;
+	__be32 *in_buf;
 	/* input buffer for single insn */
 	int8_t *insn_buf;
 
@@ -793,7 +793,7 @@ static int usbduxsigma_ai_insn_read(struct comedi_device *dev,
 		}
 
 		/* 32 bits big endian from the A/D converter */
-		val = be32_to_cpu(*((int32_t *)((devpriv->insn_buf) + 1)));
+		val = be32_to_cpu(*((__be32 *)((devpriv->insn_buf) + 1)));
 		val &= 0x00ffffff;	/* strip status byte */
 		val ^= 0x00800000;	/* convert to unsigned */
 
@@ -1372,7 +1372,7 @@ static int usbduxsigma_getstatusinfo(struct comedi_device *dev, int chan)
 		return ret;
 
 	/* 32 bits big endian from the A/D converter */
-	val = be32_to_cpu(*((int32_t *)((devpriv->insn_buf)+1)));
+	val = be32_to_cpu(*((__be32 *)((devpriv->insn_buf)+1)));
 	val &= 0x00ffffff;	/* strip status byte */
 	val ^= 0x00800000;	/* convert to unsigned */
 
