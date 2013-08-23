From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2013 09:33:48 +0000
Subject: [patch] [media] i2c/ov9650: off by one in ov965x_enum_frame_sizes()
Message-Id: <20130823093348.GI31293@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The ">" should be ">=" otherwise we read one space beyond the end of the
array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index 1dbb811..4da90c6 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1083,7 +1083,7 @@ static int ov965x_enum_frame_sizes(struct v4l2_subdev *sd,
 {
 	int i = ARRAY_SIZE(ov965x_formats);
 
-	if (fse->index > ARRAY_SIZE(ov965x_framesizes))
+	if (fse->index >= ARRAY_SIZE(ov965x_framesizes))
 		return -EINVAL;
 
 	while (--i)
