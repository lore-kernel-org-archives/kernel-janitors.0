From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Jan 2021 08:46:03 +0000
Subject: [PATCH] media: i2c: ov5648: remove unnecessary NULL check
Message-Id: <YA6FSxjBGVtRgT+Z@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The "mode_index = ARRAY_SIZE(ov5648_modes)" check ensures that we
exited the loop via a break statement so we know that "mode" must
be valid.  Delete this unnecessary NULL check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/ov5648.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 609aa67b54ce..b3864be33df2 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2337,7 +2337,7 @@ static int ov5648_enum_frame_interval(struct v4l2_subdev *subdev,
 		}
 	}
 
-	if (mode_index = ARRAY_SIZE(ov5648_modes) || !mode)
+	if (mode_index = ARRAY_SIZE(ov5648_modes))
 		return -EINVAL;
 
 	switch (interval_enum->code) {
-- 
2.29.2
