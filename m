From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Dec 2013 10:42:22 +0000
Subject: [patch] pinctrl: off by one in msm_config_group_set()
Message-Id: <20131216104222.GA19404@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This should be ">= ARRAY_SIZE()" instead of "> ARRAY_SIZE()".

Fixes: f365be092572 ('pinctrl: Add Qualcomm TLMM driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/pinctrl-msm.c b/drivers/pinctrl/pinctrl-msm.c
index 28b90aba708d..03c4e615ebb8 100644
--- a/drivers/pinctrl/pinctrl-msm.c
+++ b/drivers/pinctrl/pinctrl-msm.c
@@ -350,7 +350,7 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH:
 			/* Check for invalid values */
-			if (arg > ARRAY_SIZE(msm_drive_to_regval))
+			if (arg >= ARRAY_SIZE(msm_drive_to_regval))
 				arg = -1;
 			else
 				arg = msm_drive_to_regval[arg];
