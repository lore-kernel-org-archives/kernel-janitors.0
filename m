From: Colin King <colin.king@canonical.com>
Date: Mon, 13 Mar 2017 18:20:28 +0000
Subject: [PATCH] staging: atomisp: fix missing break in switch statement
Message-Id: <20170313182028.19318-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Cox <alan@linux.intel.com>, Varsha Rao <rvarsha016@gmail.com>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

I believe there is a missing break in the switch statement for
case V4L2_CID_FOCUS_STATUS as the current fall-through looks
suspect to me.

Detected by CoverityScan, CID#1416580 ("Missing break in switch")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/atomisp/i2c/ov5693/ov5693.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov5693/ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/ov5693.c
index e3d4d0e..ac75982 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/ov5693.c
@@ -1132,7 +1132,7 @@ static int ov5693_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_FOCUS_STATUS:
 		ret = ov5693_q_focus_status(&dev->sd, &ctrl->val);
-
+		break;
 	case V4L2_CID_BIN_FACTOR_HORZ:
 		ret = ov5693_g_bin_factor_x(&dev->sd, &ctrl->val);
 		break;
-- 
2.10.2

