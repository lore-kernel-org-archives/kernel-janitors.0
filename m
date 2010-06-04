From: Dan Carpenter <error27@gmail.com>
Date: Fri, 04 Jun 2010 10:34:40 +0000
Subject: [patch] media/radio: fix copy_to_user to user handling
Message-Id: <20100604103440.GB5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Eduardo Valentin <eduardo.valentin@nokia.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_to/from_user() returns the number of bytes remaining to be copied
but the code here was testing for negative returns.  I modified it to
return -EFAULT.  These functions are called from si4713_s_ext_ctrls() and
that only tests for negative error codes. 

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/radio/si4713-i2c.c b/drivers/media/radio/si4713-i2c.c
index ab63dd5..fc7f4b7 100644
--- a/drivers/media/radio/si4713-i2c.c
+++ b/drivers/media/radio/si4713-i2c.c
@@ -1009,8 +1009,10 @@ static int si4713_write_econtrol_string(struct si4713_device *sdev,
 			goto exit;
 		}
 		rval = copy_from_user(ps_name, control->string, len);
-		if (rval < 0)
+		if (rval) {
+			rval = -EFAULT;
 			goto exit;
+		}
 		ps_name[len] = '\0';
 
 		if (strlen(ps_name) % vqc.step) {
@@ -1031,8 +1033,10 @@ static int si4713_write_econtrol_string(struct si4713_device *sdev,
 			goto exit;
 		}
 		rval = copy_from_user(radio_text, control->string, len);
-		if (rval < 0)
+		if (rval) {
+			rval = -EFAULT;
 			goto exit;
+		}
 		radio_text[len] = '\0';
 
 		if (strlen(radio_text) % vqc.step) {
@@ -1367,6 +1371,8 @@ static int si4713_read_econtrol_string(struct si4713_device *sdev,
 		}
 		rval = copy_to_user(control->string, sdev->rds_info.ps_name,
 					strlen(sdev->rds_info.ps_name) + 1);
+		if (rval)
+			rval = -EFAULT;
 		break;
 
 	case V4L2_CID_RDS_TX_RADIO_TEXT:
@@ -1377,6 +1383,8 @@ static int si4713_read_econtrol_string(struct si4713_device *sdev,
 		}
 		rval = copy_to_user(control->string, sdev->rds_info.radio_text,
 					strlen(sdev->rds_info.radio_text) + 1);
+		if (rval)
+			rval = -EFAULT;
 		break;
 
 	default:
