From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 02 Nov 2017 20:23:26 +0000
Subject: [PATCH] staging: comedi: usbduxsigma: Improve unlocking of a mutex in three functions
Message-Id: <fd59be96-b430-ffa5-40df-b89e114bbf0f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, Ian Abbott <abbotti@mev.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 2 Nov 2017 21:16:50 +0100

* Add a jump target so that a call of the function "mutex_unlock" is stored
  only twice in these function implementations.

* Replace seven calls by goto statements.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/comedi/drivers/usbduxsigma.c | 48 +++++++++++++++-------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/comedi/drivers/usbduxsigma.c b/drivers/staging/comedi/drivers/usbduxsigma.c
index 456e9f13becb..7e8284ed265a 100644
--- a/drivers/staging/comedi/drivers/usbduxsigma.c
+++ b/drivers/staging/comedi/drivers/usbduxsigma.c
@@ -672,10 +672,8 @@ static int usbduxsigma_ai_cmd(struct comedi_device *dev,
 	devpriv->dux_commands[8] = sysred;
 
 	ret = usbbuxsigma_send_cmd(dev, USBBUXSIGMA_AD_CMD);
-	if (ret < 0) {
-		mutex_unlock(&devpriv->mut);
-		return ret;
-	}
+	if (ret < 0)
+		goto unlock;
 
 	devpriv->ai_counter = devpriv->ai_timer;
 
@@ -686,8 +684,7 @@ static int usbduxsigma_ai_cmd(struct comedi_device *dev,
 					      devpriv->n_ai_urbs, 1);
 		if (ret < 0) {
 			devpriv->ai_cmd_running = 0;
-			mutex_unlock(&devpriv->mut);
-			return ret;
+			goto unlock;
 		}
 		s->async->inttrig = NULL;
 	} else {	/* TRIG_INT */
@@ -697,6 +694,10 @@ static int usbduxsigma_ai_cmd(struct comedi_device *dev,
 	mutex_unlock(&devpriv->mut);
 
 	return 0;
+
+unlock:
+	mutex_unlock(&devpriv->mut);
+	return ret;
 }
 
 static int usbduxsigma_ai_insn_read(struct comedi_device *dev,
@@ -714,8 +715,8 @@ static int usbduxsigma_ai_insn_read(struct comedi_device *dev,
 
 	mutex_lock(&devpriv->mut);
 	if (devpriv->ai_cmd_running) {
-		mutex_unlock(&devpriv->mut);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto unlock;
 	}
 
 	create_adc_command(chan, &muxsg0, &muxsg1);
@@ -730,19 +731,15 @@ static int usbduxsigma_ai_insn_read(struct comedi_device *dev,
 
 	/* adc commands */
 	ret = usbbuxsigma_send_cmd(dev, USBDUXSIGMA_SINGLE_AD_CMD);
-	if (ret < 0) {
-		mutex_unlock(&devpriv->mut);
-		return ret;
-	}
+	if (ret < 0)
+		goto unlock;
 
 	for (i = 0; i < insn->n; i++) {
 		u32 val;
 
 		ret = usbduxsigma_receive_cmd(dev, USBDUXSIGMA_SINGLE_AD_CMD);
-		if (ret < 0) {
-			mutex_unlock(&devpriv->mut);
-			return ret;
-		}
+		if (ret < 0)
+			goto unlock;
 
 		/* 32 bits big endian from the A/D converter */
 		val = be32_to_cpu(get_unaligned((__be32
@@ -753,6 +750,10 @@ static int usbduxsigma_ai_insn_read(struct comedi_device *dev,
 	mutex_unlock(&devpriv->mut);
 
 	return insn->n;
+
+unlock:
+	mutex_unlock(&devpriv->mut);
+	return ret;
 }
 
 static int usbduxsigma_ao_insn_read(struct comedi_device *dev,
@@ -782,8 +783,8 @@ static int usbduxsigma_ao_insn_write(struct comedi_device *dev,
 
 	mutex_lock(&devpriv->mut);
 	if (devpriv->ao_cmd_running) {
-		mutex_unlock(&devpriv->mut);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto unlock;
 	}
 
 	for (i = 0; i < insn->n; i++) {
@@ -791,15 +792,18 @@ static int usbduxsigma_ao_insn_write(struct comedi_device *dev,
 		devpriv->dux_commands[2] = data[i];	/* value */
 		devpriv->dux_commands[3] = chan;	/* channel number */
 		ret = usbbuxsigma_send_cmd(dev, USBDUXSIGMA_DA_CMD);
-		if (ret < 0) {
-			mutex_unlock(&devpriv->mut);
-			return ret;
-		}
+		if (ret < 0)
+			goto unlock;
+
 		s->readback[chan] = data[i];
 	}
 	mutex_unlock(&devpriv->mut);
 
 	return insn->n;
+
+unlock:
+	mutex_unlock(&devpriv->mut);
+	return ret;
 }
 
 static int usbduxsigma_ao_inttrig(struct comedi_device *dev,
-- 
2.15.0

