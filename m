From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 Aug 2018 13:20:18 +0000
Subject: [PATCH v2] media: sr030pc30: remove NULL in sr030pc30_base_config()
Message-Id: <20180831132018.bbrvi2vt4vatyojj@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20180831124221.3kuamslh4xw3vjt7@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This code doesn't check for NULL consistently and it generates a Smatch
warning:

    drivers/media/i2c/sr030pc30.c:575 sr030pc30_base_config()
    error: we previously assumed 'info->pdata' could be null (see line 572)

Fortunately, "info->pdata" can't be NULL to that check can be removed.
The other thing is that if "ret" is an error code here, then we don't
want to do the next call to cam_i2c_write(), so actually let's flip that
test around and return the error.  This is more of a theoretical issue
than something which is likely to affect real life.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: just remove the check

Thanks Sakari Ailus for your review.

diff --git a/drivers/media/i2c/sr030pc30.c b/drivers/media/i2c/sr030pc30.c
index 2a4882cddc51..66d952624731 100644
--- a/drivers/media/i2c/sr030pc30.c
+++ b/drivers/media/i2c/sr030pc30.c
@@ -569,7 +569,7 @@ static int sr030pc30_base_config(struct v4l2_subdev *sd)
 	if (!ret)
 		ret = sr030pc30_pwr_ctrl(sd, false, false);
 
-	if (!ret && !info->pdata)
+	if (ret)
 		return ret;
 
 	expmin = EXPOS_MIN_MS * info->pdata->clk_rate / (8 * 1000);
