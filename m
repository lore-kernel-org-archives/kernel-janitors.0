From: sebek64@post.cz (Marcel Sebek)
Date: Sun, 19 Dec 2004 19:08:01 +0000
Subject: [KJ] [PATCH] miropcm20-radio cleanup
Message-Id: <20041219190801.GB9205@penguin.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37633373714120033=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37633373714120033==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is cleanup of file miropcm20-radio.c

Compile tested.

Signed-off-by: Marcel Sebek <sebek64@post.cz>

diff -urpN linux-2.6/drivers/media/radio/miropcm20-radio.c linux-2.6-new/drivers/media/radio/miropcm20-radio.c
--- linux-2.6/drivers/media/radio/miropcm20-radio.c	2004-08-06 17:14:31.000000000 +0200
+++ linux-2.6-new/drivers/media/radio/miropcm20-radio.c	2004-12-18 19:19:42.000000000 +0100
@@ -22,11 +22,12 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/videodev.h>
+#include <linux/moduleparam.h>
 #include "../../../sound/oss/aci.h"
 #include "miropcm20-rds-core.h"
 
 static int radio_nr = -1;
-MODULE_PARM(radio_nr, "i");
+module_param(radio_nr, int, 0444);
 
 struct pcm20_device {
 	unsigned long freq;
@@ -75,9 +76,7 @@ static int pcm20_getflags(struct pcm20_d
 
 	if ((i=aci_rw_cmd(ACI_READ_TUNERSTATION, -1, -1))<0)
 		return i;
-#ifdef DEBUG
-	printk("check_sig: 0x%x\n", i);
-#endif
+	pr_debug("check_sig: 0x%x\n", i);
 	if (i & 0x80) {
 		/* no signal from tuner */
 		*flags=0;
@@ -107,9 +106,7 @@ static int pcm20_getflags(struct pcm20_d
 
 	if ((i=aci_rds_cmd(RDS_RXVALUE, &buf, 1))<0)
 		return i;
-#ifdef DEBUG
-	printk("rds-signal: %d\n", buf);
-#endif
+	pr_debug("rds-signal: %d\n", buf);
 	if (buf > 15) {
 		printk("miropcm20-radio: RX strengths unexpected high...\n");
 		buf=15;
@@ -172,9 +169,7 @@ static int pcm20_do_ioctl(struct inode *
 			unsigned long *freq = arg;
 			pcm20->freq = *freq;
 			i=pcm20_setfreq(pcm20, pcm20->freq);
-#ifdef DEBUG
-			printk("First view (setfreq): 0x%x\n", i);
-#endif
+			pr_debug("First view (setfreq): 0x%x\n", i);
 			return i;
 		}
 		case VIDIOCGAUDIO:


--===============37633373714120033==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37633373714120033==--
