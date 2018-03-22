From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 22 Mar 2018 02:10:07 +0000
Subject: [PATCH -next] staging: mt7621-eth: fix return value check in mt7621_gsw_probe()
Message-Id: <1521684607-77277-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1521684579-76660-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1521684579-76660-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: f079b6406348 ("staging: mt7621-eth: add gigabit switch driver (GSW)")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/mt7621-eth/gsw_mt7621.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-eth/gsw_mt7621.c b/drivers/staging/mt7621-eth/gsw_mt7621.c
index b49ee94..ce8d7d7 100644
--- a/drivers/staging/mt7621-eth/gsw_mt7621.c
+++ b/drivers/staging/mt7621-eth/gsw_mt7621.c
@@ -263,8 +263,8 @@ static int mt7621_gsw_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	gsw->base = devm_ioremap_resource(&pdev->dev, res);
-	if (!gsw->base)
-		return -EADDRNOTAVAIL;
+	if (IS_ERR(gsw->base))
+		return PTR_ERR(gsw->base);
 
 	gsw->dev = &pdev->dev;
 	gsw->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);

