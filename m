From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 19 Feb 2017 13:02:29 +0000
Subject: [PATCH] phy: qcom-usb-hsic: Fix error handling
Message-Id: <20170219130229.11730-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kishon-l0cyMroinI0@public.gmane.org, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>

According to error handling in this function, it is likely that going to
'err_ulpi' was expected here.

Fixes: 	605b8652f7f0 ("phy: Add support for Qualcomm's USB HSIC phy")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/phy/phy-qcom-usb-hsic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-qcom-usb-hsic.c b/drivers/phy/phy-qcom-usb-hsic.c
index 47690f9945b9..b466ccb045fc 100644
--- a/drivers/phy/phy-qcom-usb-hsic.c
+++ b/drivers/phy/phy-qcom-usb-hsic.c
@@ -58,8 +58,10 @@ static int qcom_usb_hsic_phy_power_on(struct phy *phy)
 
 	/* Configure pins for HSIC functionality */
 	pins_default = pinctrl_lookup_state(uphy->pctl, PINCTRL_STATE_DEFAULT);
-	if (IS_ERR(pins_default))
-		return PTR_ERR(pins_default);
+	if (IS_ERR(pins_default)) {
+		ret = PTR_ERR(pins_default);
+		goto err_ulpi;
+	}
 
 	ret = pinctrl_select_state(uphy->pctl, pins_default);
 	if (ret)
-- 
2.9.3

