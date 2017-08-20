From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 20 Aug 2017 10:16:23 +0000
Subject: [PATCH v2] phy: qcom-usb-hsic: Fix error handling
Message-Id: <20170820101623.26757-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kishon@ti.com, vivek.gautam@codeaurora.org, stephen.boyd@linaro.org, jh80.chung@samsung.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

According to error handling in this function, it is likely that going to
'err_ulpi' was expected here.

Fixes: 	605b8652f7f0 ("phy: Add support for Qualcomm's USB HSIC phy")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Stephen Boyd <stephen.boyd@linaro.org>
---
v2: rebase after commit 0b56e9a7e835 which has moved from
       drivers/phy/phy-qcom-usb-hsic.c
    to
       drivers/phy/qualcomm/phy-qcom-usb-hsic.c

Reviewed-by tag can be found at https://lkml.org/lkml/2017/2/20/48
---
 drivers/phy/qualcomm/phy-qcom-usb-hsic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
index c110563a73cb..00926df4bc5b 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
@@ -57,8 +57,10 @@ static int qcom_usb_hsic_phy_power_on(struct phy *phy)
 
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
2.11.0

