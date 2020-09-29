From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Tue, 29 Sep 2020 13:14:29 +0000
Subject: [PATCH 06/20] media: gspca: ov534-ov772x: use semicolons rather than commas to separate statements
Message-Id: <1601385283-26144-7-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/gspca/ov534.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/gspca/ov534.c b/drivers/media/usb/gspca/ov534.c
index 9a11158f38da..8b6a57f170d0 100644
--- a/drivers/media/usb/gspca/ov534.c
+++ b/drivers/media/usb/gspca/ov534.c
@@ -1220,9 +1220,9 @@ static int sd_init_controls(struct gspca_dev *gspca_dev)
 	int hflip_def;
 
 	if (sd->sensor = SENSOR_OV767x) {
-		saturation_min = 0,
-		saturation_max = 6,
-		saturation_def = 3,
+		saturation_min = 0;
+		saturation_max = 6;
+		saturation_def = 3;
 		brightness_min = -127;
 		brightness_max = 127;
 		brightness_def = 0;
@@ -1233,9 +1233,9 @@ static int sd_init_controls(struct gspca_dev *gspca_dev)
 		exposure_def = 0x13;
 		hflip_def = 1;
 	} else {
-		saturation_min = 0,
-		saturation_max = 255,
-		saturation_def = 64,
+		saturation_min = 0;
+		saturation_max = 255;
+		saturation_def = 64;
 		brightness_min = 0;
 		brightness_max = 255;
 		brightness_def = 0;
