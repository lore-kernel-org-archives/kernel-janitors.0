From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Nov 2017 06:41:06 +0000
Subject: [PATCH] media: imx274: fix missing return assignment from call to imx274_mode_regs
Message-Id: <20171103064106.25593-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Leon Luo <leonl@leopardimaging.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being checked for failure however it is not being set
from the return status from the call to imx274_mode_regs. Currently ret is
alwayus zero and the check is redundant. Fix this by assigning it.

Detected by CoverityScan, CID#1460278 ("Logically dead code")

Fixes: 0985dd306f72 ("media: imx274: V4l2 driver for Sony imx274 CMOS sensor")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/imx274.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index ab6a5f31da74..800b9bf9cdd3 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1059,7 +1059,7 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 
 	if (on) {
 		/* load mode registers */
-		imx274_mode_regs(imx274, imx274->mode_index);
+		ret = imx274_mode_regs(imx274, imx274->mode_index);
 		if (ret)
 			goto fail;
 
-- 
2.14.1

