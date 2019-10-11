From: Colin King <colin.king@canonical.com>
Date: Fri, 11 Oct 2019 17:13:54 +0000
Subject: [PATCH] media: lm3646: remove redundant assignment to variable rval
Message-Id: <20191011171354.13787-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rval is being initialized with a value that
is never read and is being re-assigned a little later on. The
assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/lm3646.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/lm3646.c b/drivers/media/i2c/lm3646.c
index d8a8853f9a2b..c76ccf67a909 100644
--- a/drivers/media/i2c/lm3646.c
+++ b/drivers/media/i2c/lm3646.c
@@ -134,7 +134,7 @@ static int lm3646_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct lm3646_flash *flash = to_lm3646_flash(ctrl);
 	unsigned int reg_val;
-	int rval = -EINVAL;
+	int rval;
 
 	switch (ctrl->id) {
 	case V4L2_CID_FLASH_LED_MODE:
-- 
2.20.1
