From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 May 2012 06:15:25 +0000
Subject: [patch] [media] gspca: passing wrong length parameter to reg_w()
Message-Id: <20120502061525.GC28894@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This looks like a cut an paste error.  This is a two byte array but we
use 8 as a length parameter.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker fix.  I don't own the hardware.

diff --git a/drivers/media/video/gspca/conex.c b/drivers/media/video/gspca/conex.c
index ea17b5d..f39fee0 100644
--- a/drivers/media/video/gspca/conex.c
+++ b/drivers/media/video/gspca/conex.c
@@ -306,7 +306,7 @@ static void cx_sensor(struct gspca_dev*gspca_dev)
 
 	reg_w(gspca_dev, 0x0020, reg20, 8);
 	reg_w(gspca_dev, 0x0028, reg28, 8);
-	reg_w(gspca_dev, 0x0010, reg10, 8);
+	reg_w(gspca_dev, 0x0010, reg10, 2);
 	reg_w_val(gspca_dev, 0x0092, 0x03);
 
 	switch (gspca_dev->cam.cam_mode[(int) gspca_dev->curr_mode].priv) {
@@ -326,7 +326,7 @@ static void cx_sensor(struct gspca_dev*gspca_dev)
 	}
 	reg_w(gspca_dev, 0x007b, reg7b, 6);
 	reg_w_val(gspca_dev, 0x00f8, 0x00);
-	reg_w(gspca_dev, 0x0010, reg10, 8);
+	reg_w(gspca_dev, 0x0010, reg10, 2);
 	reg_w_val(gspca_dev, 0x0098, 0x41);
 	for (i = 0; i < 11; i++) {
 		if (i = 3 || i = 5 || i = 8)
