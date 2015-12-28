From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Dec 2015 19:20:27 +0000
Subject: [PATCH] [media] xc5000: Faster result reporting in xc_load_fw_and_init_tuner()
Message-Id: <56818B7B.8040801@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Dec 2015 20:10:30 +0100

This issue was detected by using the Coccinelle software.

Split the previous if statement at the end so that each final log statement
will eventually be performed by a direct jump to these labels.
* report_failure
* report_success

A check repetition can be excluded for the variable "ret" at the end then.


Apply also two recommendations from the script "checkpatch.pl".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/tuners/xc5000.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/tuners/xc5000.c b/drivers/media/tuners/xc5000.c
index e6e5e90..1360677 100644
--- a/drivers/media/tuners/xc5000.c
+++ b/drivers/media/tuners/xc5000.c
@@ -1166,7 +1166,7 @@ static int xc_load_fw_and_init_tuner(struct dvb_frontend *fe, int force)
 
 		ret = xc5000_fwupload(fe, desired_fw, fw);
 		if (ret != 0)
-			goto err;
+			goto report_failure;
 
 		msleep(20);
 
@@ -1229,18 +1229,16 @@ static int xc_load_fw_and_init_tuner(struct dvb_frontend *fe, int force)
 		/* Default to "CABLE" mode */
 		ret = xc_write_reg(priv, XREG_SIGNALSOURCE, XC_RF_MODE_CABLE);
 		if (!ret)
-			break;
+			goto report_success;
 		printk(KERN_ERR "xc5000: can't set to cable mode.");
 	}
 
-err:
-	if (!ret)
-		printk(KERN_INFO "xc5000: Firmware %s loaded and running.\n",
-		       desired_fw->name);
-	else
-		printk(KERN_CONT " - too many retries. Giving up\n");
-
+report_failure:
+	pr_cont(" - too many retries. Giving up\n");
 	return ret;
+report_success:
+	pr_info("xc5000: Firmware %s loaded and running.\n", desired_fw->name);
+	return 0;
 }
 
 static void xc5000_do_timer_sleep(struct work_struct *timer_sleep)
-- 
2.6.3

