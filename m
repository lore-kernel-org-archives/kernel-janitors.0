From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Mar 2018 10:07:14 +0000
Subject: [PATCH] media: ov5695: Off by one in ov5695_enum_frame_sizes()
Message-Id: <20180301100714.GA14140@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shunqian Zheng <zhengsq@rock-chips.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The ">" should be ">=" so that we don't read one element beyond the end
of the array.

Fixes: 8a77009be4be ("media: ov5695: add support for OV5695 sensor")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index a4985a4715f5..9be38a0a2046 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -884,7 +884,7 @@ static int ov5695_enum_frame_sizes(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_pad_config *cfg,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index > ARRAY_SIZE(supported_modes))
+	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
 	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
