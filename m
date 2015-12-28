From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Dec 2015 21:15:33 +0000
Subject: [PATCH] [media] airspy: Better exception handling in two functions
Message-Id: <5681A675.80504@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Dec 2015 22:10:28 +0100

This issue was detected by using the Coccinelle software.

Move the jump label directly before the desired log statement
so that the variable "ret" will not be checked once more
after a function call.
Use the identifier "report_failure" instead of "err".

The error logging is performed in a separate section at the end now.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/airspy/airspy.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 0d4ac59..cf2444a 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -889,18 +889,17 @@ static int airspy_set_lna_gain(struct airspy *s)
 	ret = airspy_ctrl_msg(s, CMD_SET_LNA_AGC, 0, s->lna_gain_auto->val,
 			&u8tmp, 1);
 	if (ret)
-		goto err;
+		goto report_failure;
 
 	if (s->lna_gain_auto->val = false) {
 		ret = airspy_ctrl_msg(s, CMD_SET_LNA_GAIN, 0, s->lna_gain->val,
 				&u8tmp, 1);
 		if (ret)
-			goto err;
+			goto report_failure;
 	}
-err:
-	if (ret)
-		dev_dbg(s->dev, "failed=%d\n", ret);
-
+	return 0;
+report_failure:
+	dev_dbg(s->dev, "failed=%d\n", ret);
 	return ret;
 }
 
@@ -916,18 +915,17 @@ static int airspy_set_mixer_gain(struct airspy *s)
 	ret = airspy_ctrl_msg(s, CMD_SET_MIXER_AGC, 0, s->mixer_gain_auto->val,
 			&u8tmp, 1);
 	if (ret)
-		goto err;
+		goto report_failure;
 
 	if (s->mixer_gain_auto->val = false) {
 		ret = airspy_ctrl_msg(s, CMD_SET_MIXER_GAIN, 0,
 				s->mixer_gain->val, &u8tmp, 1);
 		if (ret)
-			goto err;
+			goto report_failure;
 	}
-err:
-	if (ret)
-		dev_dbg(s->dev, "failed=%d\n", ret);
-
+	return 0;
+report_failure:
+	dev_dbg(s->dev, "failed=%d\n", ret);
 	return ret;
 }
 
-- 
2.6.3

