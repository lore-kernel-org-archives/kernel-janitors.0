From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 17 Jul 2019 11:52:15 +0000
Subject: [PATCH] net: ethernet: fix error return code in ag71xx_probe()
Message-Id: <20190717115215.22965-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return error code -ENOMEM from the dmam_alloc_coherent() error
handling case instead of 0, as done elsewhere in this function.

Fixes: d51b6ce441d3 ("net: ethernet: add ag71xx driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/atheros/ag71xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index 72a57c6cd254..446d62e93439 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1724,8 +1724,10 @@ static int ag71xx_probe(struct platform_device *pdev)
 	ag->stop_desc = dmam_alloc_coherent(&pdev->dev,
 					    sizeof(struct ag71xx_desc),
 					    &ag->stop_desc_dma, GFP_KERNEL);
-	if (!ag->stop_desc)
+	if (!ag->stop_desc) {
+		err = -ENOMEM;
 		goto err_free;
+	}
 
 	ag->stop_desc->data = 0;
 	ag->stop_desc->ctrl = 0;
