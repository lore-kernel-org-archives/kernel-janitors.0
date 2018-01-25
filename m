From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Jan 2018 14:15:25 +0000
Subject: [PATCH] [media] sr030pc30: prevent array underflow in try_fmt()
Message-Id: <20180125141525.GA7351@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org



Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/i2c/sr030pc30.c b/drivers/media/i2c/sr030pc30.c
index 0bf031b7e4fa..2a4882cddc51 100644
--- a/drivers/media/i2c/sr030pc30.c
+++ b/drivers/media/i2c/sr030pc30.c
@@ -511,13 +511,16 @@ static int sr030pc30_get_fmt(struct v4l2_subdev *sd,
 static const struct sr030pc30_format *try_fmt(struct v4l2_subdev *sd,
 					      struct v4l2_mbus_framefmt *mf)
 {
-	int i = ARRAY_SIZE(sr030pc30_formats);
+	int i;
 
 	sr030pc30_try_frame_size(mf);
 
-	while (i--)
+	for (i = 0; i < ARRAY_SIZE(sr030pc30_formats); i++) {
 		if (mf->code = sr030pc30_formats[i].code)
 			break;
+	}
+	if (i = ARRAY_SIZE(sr030pc30_formats))
+		i = 0;
 
 	mf->code = sr030pc30_formats[i].code;
 
