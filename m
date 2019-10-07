From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Oct 2019 10:18:48 +0000
Subject: [PATCH] media: gspca: make array st6422_bridge_init static, makes object smaller
Message-Id: <20191007101848.30540-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array st6422_bridge_init on the stack but instead
make it static. Makes the object code smaller by 231 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
   3419	    752	     64	   4235	   108b	gspca/stv06xx/stv06xx_st6422.o

After:
   text	   data	    bss	    dec	    hex	filename
   3124	    816	     64	   4004	    fa4	gspca/stv06xx/stv06xx_st6422.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c b/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c
index 7104a88b1e43..aac19d449be2 100644
--- a/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c
+++ b/drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c
@@ -117,7 +117,7 @@ static int st6422_init(struct sd *sd)
 {
 	int err = 0, i;
 
-	const u16 st6422_bridge_init[][2] = {
+	static const u16 st6422_bridge_init[][2] = {
 		{ STV_ISO_ENABLE, 0x00 }, /* disable capture */
 		{ 0x1436, 0x00 },
 		{ 0x1432, 0x03 },	/* 0x00-0x1F brightness */
-- 
2.20.1
