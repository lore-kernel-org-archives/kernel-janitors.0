From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Feb 2014 15:00:45 +0000
Subject: [patch] [media] gspca_stv06xx: remove an unneeded check
Message-Id: <20140218150044.GC6914@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, Theodore Kilgore <kilgota@banach.math.auburn.edu>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

"err" is zero here so we don't need to check again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c b/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c
index bf3e5c317a26..e60cbb3aa609 100644
--- a/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c
+++ b/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c
@@ -178,7 +178,7 @@ static int vv6410_stop(struct sd *sd)
 
 	PDEBUG(D_STREAM, "Halting stream");
 
-	return (err < 0) ? err : 0;
+	return 0;
 }
 
 static int vv6410_dump(struct sd *sd)
