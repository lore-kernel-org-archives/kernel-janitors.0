From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 25 Jul 2018 06:11:16 +0000
Subject: [PATCH net-next] lan743x: Make symbol lan743x_pm_ops static
Message-Id: <1532499076-191548-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Whitehead <bryan.whitehead@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/net/ethernet/microchip/lan743x_main.c:2944:25: warning:
 symbol 'lan743x_pm_ops' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index cd41911..bb323f2 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -2941,7 +2941,7 @@ static int lan743x_pm_resume(struct device *dev)
 	return 0;
 }
 
-const struct dev_pm_ops lan743x_pm_ops = {
+static const struct dev_pm_ops lan743x_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(lan743x_pm_suspend, lan743x_pm_resume)
 };
 #endif /*CONFIG_PM */

