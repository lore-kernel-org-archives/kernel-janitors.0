From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 29 Dec 2018 00:05:40 +0000
Subject: [PATCH] i3c: master: Fix an error checking typo in 'cdns_i3c_master_probe()'
Message-Id: <20181229000540.25283-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bbrezillon@kernel.org, pgaj@cadence.com, yuehaibing@huawei.com, gregkh@linuxfoundation.org, arnd@arndb.de
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-i3c@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix a cut'n'paste typo.
Checking 'master->sysclk' is expected here.

Fixes: 603f2bee2c54 ("i3c: master: Add driver for Cadence IP")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i3c/master/i3c-master-cdns.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index bbd79b8b1a80..8889a4fdb454 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1556,8 +1556,8 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 		return PTR_ERR(master->pclk);
 
 	master->sysclk = devm_clk_get(&pdev->dev, "sysclk");
-	if (IS_ERR(master->pclk))
-		return PTR_ERR(master->pclk);
+	if (IS_ERR(master->sysclk))
+		return PTR_ERR(master->sysclk);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
2.19.1
