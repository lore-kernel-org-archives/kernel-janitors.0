From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Oct 2019 13:46:12 +0000
Subject: [PATCH] media: zr364xx: remove redundant assigmnent to idx, clean up code
Message-Id: <20191025134612.30703-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antoine Jacquet <royale@zerezo.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-usb@vger.kernel.org, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable cable_type is being initialized with a value that
is never read and is being re-assigned a little later on. Replace
the redundant initializtion with the assignment that occurs a little
later. Also initialize frm too rather than have a later assignment.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/zr364xx/zr364xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
index aff78d63b869..57dbcc8083bf 100644
--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -555,14 +555,12 @@ static int zr364xx_read_video_callback(struct zr364xx_camera *cam,
 {
 	unsigned char *pdest;
 	unsigned char *psrc;
-	s32 idx = -1;
-	struct zr364xx_framei *frm;
+	s32 idx = cam->cur_frame;
+	struct zr364xx_framei *frm = &cam->buffer.frame[idx];
 	int i = 0;
 	unsigned char *ptr = NULL;
 
 	_DBG("buffer to user\n");
-	idx = cam->cur_frame;
-	frm = &cam->buffer.frame[idx];
 
 	/* swap bytes if camera needs it */
 	if (cam->method = METHOD0) {
-- 
2.20.1
