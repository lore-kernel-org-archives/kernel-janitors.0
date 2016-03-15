From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Mar 2016 07:07:10 +0000
Subject: [patch] [media] m5mols: potential uninitialized variable
Message-Id: <20160315070710.GD13560@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Heungjun Kim <riverful.kim@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that there are some paths where "status" isn't
initialized.  The code does assume that m5mols_read_u8() can fail so it
seems as if Smatch is correct.

Let's initialize it to REG_ISO_AUTO which is zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/i2c/m5mols/m5mols_controls.c b/drivers/media/i2c/m5mols/m5mols_controls.c
index a60931e..c2218c0 100644
--- a/drivers/media/i2c/m5mols/m5mols_controls.c
+++ b/drivers/media/i2c/m5mols/m5mols_controls.c
@@ -405,7 +405,7 @@ static int m5mols_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	struct v4l2_subdev *sd = to_sd(ctrl);
 	struct m5mols_info *info = to_m5mols(sd);
 	int ret = 0;
-	u8 status;
+	u8 status = REG_ISO_AUTO;
 
 	v4l2_dbg(1, m5mols_debug, sd, "%s: ctrl: %s (%d)\n",
 		 __func__, ctrl->name, info->isp_ready);
