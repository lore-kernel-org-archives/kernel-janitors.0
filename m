From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 18 Dec 2020 17:46:36 +0000
Subject: [PATCH] soc: ti: pm33xx: Fix some resource leak in the error handling paths of the probe function
Message-Id: <20201218174636.172239-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ssantosh@kernel.org, tony@atomide.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

'am33xx_pm_rtc_setup()' allocates some resources that must be freed on the
error. Commit 2152fbbd47c0 ("soc: ti: pm33xx: Simplify RTC usage to prepare
to drop platform data") has introduced the use of these resources but has
only updated the remove function.

Fix the error handling path of the probe function now.

Fixes: 2152fbbd47c0 ("soc: ti: pm33xx: Simplify RTC usage to prepare to drop platform data")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/soc/ti/pm33xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/pm33xx.c b/drivers/soc/ti/pm33xx.c
index 64f3e3105540..7bab4bbaf02d 100644
--- a/drivers/soc/ti/pm33xx.c
+++ b/drivers/soc/ti/pm33xx.c
@@ -535,7 +535,7 @@ static int am33xx_pm_probe(struct platform_device *pdev)
 
 	ret = am33xx_push_sram_idle();
 	if (ret)
-		goto err_free_sram;
+		goto err_unsetup_rtc;
 
 	am33xx_pm_set_ipc_ops();
 
@@ -575,6 +575,9 @@ static int am33xx_pm_probe(struct platform_device *pdev)
 err_pm_runtime_disable:
 	pm_runtime_disable(dev);
 	wkup_m3_ipc_put(m3_ipc);
+err_unsetup_rtc:
+	iounmap(rtc_base_virt);
+	clk_put(rtc_fck);
 err_free_sram:
 	am33xx_pm_free_sram();
 	pm33xx_dev = NULL;
-- 
2.27.0
