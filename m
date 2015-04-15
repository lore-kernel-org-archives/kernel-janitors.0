From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Apr 2015 19:12:18 +0000
Subject: [media] i2c: ov2659: signedness bug inov2659_set_fmt()
Message-Id: <20150415191218.GC32654@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Benoit Parrot <bparrot@ti.com>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This needs to be signed or there is a risk of hitting a forever loop.

Fixes: c4c0283ab3cd ('[media] media: i2c: add support for omnivision's ov2659 sensor')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index edebd11..d700a1d 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1102,7 +1102,7 @@ static int ov2659_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_format *fmt)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	unsigned int index = ARRAY_SIZE(ov2659_formats);
+	int index = ARRAY_SIZE(ov2659_formats);
 	struct v4l2_mbus_framefmt *mf = &fmt->format;
 	const struct ov2659_framesize *size = NULL;
 	struct ov2659 *ov2659 = to_ov2659(sd);
