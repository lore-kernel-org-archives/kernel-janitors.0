From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 09 Sep 2017 20:33:08 +0000
Subject: [PATCH 3/3] [media] xc2028: Use common error handling code in load_firmware()
Message-Id: <bf939bbf-efb8-7e1f-9260-a2c3ac0640c4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c2317603-f640-b0a6-ab86-7fda8040b6ba@users.sourceforge.net>
In-Reply-To: <c2317603-f640-b0a6-ab86-7fda8040b6ba@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 9 Sep 2017 22:07:04 +0200

Add jump targets so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/tuners/tuner-xc2028.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/tuners/tuner-xc2028.c b/drivers/media/tuners/tuner-xc2028.c
index 90efe11aa0a8..4b617e09b81f 100644
--- a/drivers/media/tuners/tuner-xc2028.c
+++ b/drivers/media/tuners/tuner-xc2028.c
@@ -571,7 +571,7 @@ static int load_firmware(struct dvb_frontend *fe, unsigned int type,
 		/* Checks if there's enough bytes to read */
 		if (p + sizeof(size) > endp) {
 			tuner_err("Firmware chunk size is wrong\n");
-			return -EINVAL;
+			goto e_inval;
 		}
 
 		size = le16_to_cpu(*(__le16 *) p);
@@ -583,28 +583,23 @@ static int load_firmware(struct dvb_frontend *fe, unsigned int type,
 		if (!size) {
 			/* Special callback command received */
 			rc = do_tuner_callback(fe, XC2028_TUNER_RESET, 0);
-			if (rc < 0) {
-				tuner_err("Error at RESET code %d\n",
-					   (*p) & 0x7f);
-				return -EINVAL;
-			}
+			if (rc < 0)
+				goto report_failure;
+
 			continue;
 		}
 		if (size >= 0xff00) {
 			switch (size) {
 			case 0xff00:
 				rc = do_tuner_callback(fe, XC2028_RESET_CLK, 0);
-				if (rc < 0) {
-					tuner_err("Error at RESET code %d\n",
-						  (*p) & 0x7f);
-					return -EINVAL;
-				}
+				if (rc < 0)
+					goto report_failure;
+
 				break;
 			default:
 				tuner_info("Invalid RESET code %d\n",
 					   size & 0x7f);
-				return -EINVAL;
-
+				goto e_inval;
 			}
 			continue;
 		}
@@ -618,7 +613,7 @@ static int load_firmware(struct dvb_frontend *fe, unsigned int type,
 		if ((size + p > endp)) {
 			tuner_err("missing bytes: need %d, have %d\n",
 				   size, (int)(endp - p));
-			return -EINVAL;
+			goto e_inval;
 		}
 
 		buf[0] = *p;
@@ -635,7 +630,7 @@ static int load_firmware(struct dvb_frontend *fe, unsigned int type,
 			rc = i2c_send(priv, buf, len + 1);
 			if (rc < 0) {
 				tuner_err("%d returned from send\n", rc);
-				return -EINVAL;
+				goto e_inval;
 			}
 
 			p += len;
@@ -650,6 +645,11 @@ static int load_firmware(struct dvb_frontend *fe, unsigned int type,
 		}
 	}
 	return 0;
+
+report_failure:
+	tuner_err("Error at RESET code %d\n", (*p) & 0x7f);
+e_inval:
+	return -EINVAL;
 }
 
 static int load_scode(struct dvb_frontend *fe, unsigned int type,
-- 
2.14.1

