From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2016 10:05:52 +0000
Subject: [patch] [media] vpx3220: signedness bug in vpx3220_fp_read()
Message-Id: <20160106100552.GI23185@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The intent was to return -1 on error and that's what the callers expect
but the current code returns USHRT_MAX instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/i2c/vpx3220.c b/drivers/media/i2c/vpx3220.c
index 4b564f1..90b693f 100644
--- a/drivers/media/i2c/vpx3220.c
+++ b/drivers/media/i2c/vpx3220.c
@@ -124,7 +124,7 @@ static int vpx3220_fp_write(struct v4l2_subdev *sd, u8 fpaddr, u16 data)
 	return 0;
 }
 
-static u16 vpx3220_fp_read(struct v4l2_subdev *sd, u16 fpaddr)
+static int vpx3220_fp_read(struct v4l2_subdev *sd, u16 fpaddr)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	s16 data;
