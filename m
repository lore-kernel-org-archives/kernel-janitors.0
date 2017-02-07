From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 13:20:08 +0000
Subject: [patch] pinctrl: intel: unlock on error in intel_config_set_pull()
Message-Id: <20170207132008.GD31552@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to unlock before returning -EINVAL on this error path.

Fixes: 04cc058f0c52 ("pinctrl: intel: Add support for 1k additional pull-down")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 523264463d35..592b465e981e 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -599,8 +599,10 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned pin,
 			value |= PADCFG1_TERM_5K << PADCFG1_TERM_SHIFT;
 			break;
 		case 1000:
-			if (!(community->features & PINCTRL_FEATURE_1K_PD))
-				return -EINVAL;
+			if (!(community->features & PINCTRL_FEATURE_1K_PD)) {
+				ret = -EINVAL;
+				break;
+			}
 			value |= PADCFG1_TERM_1K << PADCFG1_TERM_SHIFT;
 			break;
 		default:
