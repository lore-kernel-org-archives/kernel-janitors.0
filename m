From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 27 Aug 2019 11:35:27 +0000
Subject: [PATCH -next] pinctrl: sh-pfc: Fix missing unlock on error in sh_pfc_func_set_mux()
Message-Id: <20190827113527.99831-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing unlock before return from function sh_pfc_func_set_mux()
in the error handling case.

Fixes: 8a0cc47ccc7c ("pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index 99f4ebd69861..212a4a9c3a8f 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -361,8 +361,10 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 		 * This driver cannot manage both gpio and mux when the gpio
 		 * pin is already enabled. So, this function fails.
 		 */
-		if (cfg->gpio_enabled)
-			return -EBUSY;
+		if (cfg->gpio_enabled) {
+			ret = -EBUSY;
+			goto done;
+		}
 
 		ret = sh_pfc_config_mux(pfc, grp->mux[i], PINMUX_TYPE_FUNCTION);
 		if (ret < 0)
