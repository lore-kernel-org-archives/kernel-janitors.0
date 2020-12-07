From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Dec 2020 13:00:29 +0000
Subject: [PATCH] media: i2c: ov02a10: fix an uninitialized return
Message-Id: <X84nbdgv0a/ak2ef@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The "ret" variable isn't set on the no-op path where we are setting to
on/off and it's in the on or off state already.

Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/ov02a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 391718136ade..cf40e207ea21 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -530,7 +530,7 @@ static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
 {
 	struct ov02a10 *ov02a10 = to_ov02a10(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&ov02a10->mutex);
 
-- 
2.29.2
