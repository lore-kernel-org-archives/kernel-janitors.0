From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Aug 2017 08:07:51 +0000
Subject: [PATCH] [media] adv7604: Prevent out of bounds access
Message-Id: <20170804080751.ysp543gbsg4peqdp@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hans.verkuil@cisco.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

These can only be accessed with CAP_SYS_ADMIN so it's not a critical
security issue.  The problem is that "page" is controlled by the user in
the ioctl().  The test to see if the bit is set in state->info->page_mask
is not sufficient because "page" can be very high and shift wrap around
to a bit which is set.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 660bacb8f7d9..8c633b8f30e7 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -618,7 +618,7 @@ static int adv76xx_read_reg(struct v4l2_subdev *sd, unsigned int reg)
 	unsigned int val;
 	int err;
 
-	if (!(BIT(page) & state->info->page_mask))
+	if (page >= ADV76XX_PAGE_MAX || !(BIT(page) & state->info->page_mask))
 		return -EINVAL;
 
 	reg &= 0xff;
@@ -633,7 +633,7 @@ static int adv76xx_write_reg(struct v4l2_subdev *sd, unsigned int reg, u8 val)
 	struct adv76xx_state *state = to_state(sd);
 	unsigned int page = reg >> 8;
 
-	if (!(BIT(page) & state->info->page_mask))
+	if (page >= ADV76XX_PAGE_MAX || !(BIT(page) & state->info->page_mask))
 		return -EINVAL;
 
 	reg &= 0xff;
