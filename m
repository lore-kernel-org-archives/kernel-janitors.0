From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Jun 2018 11:19:48 +0000
Subject: [PATCH] media: sr030pc30: inconsistent NULL checking in sr030pc30_base_config()
Message-Id: <20180622111947.tormf7s7an5vj4lg@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

If info->pdata is NULL then we would oops on the next line.  And we can
flip the "ret" test around and give up if a failure has already occured.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/i2c/sr030pc30.c b/drivers/media/i2c/sr030pc30.c
index 2a4882cddc51..4ebd00198d34 100644
--- a/drivers/media/i2c/sr030pc30.c
+++ b/drivers/media/i2c/sr030pc30.c
@@ -569,8 +569,8 @@ static int sr030pc30_base_config(struct v4l2_subdev *sd)
 	if (!ret)
 		ret = sr030pc30_pwr_ctrl(sd, false, false);
 
-	if (!ret && !info->pdata)
-		return ret;
+	if (ret || !info->pdata)
+		return -EIO;
 
 	expmin = EXPOS_MIN_MS * info->pdata->clk_rate / (8 * 1000);
 	expmax = EXPOS_MAX_MS * info->pdata->clk_rate / (8 * 1000);
