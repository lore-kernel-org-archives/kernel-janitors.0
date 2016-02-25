From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Feb 2016 21:32:21 +0000
Subject: [patch] mailbox/xgene-slimpro: Checking for IS_ERR instead of NULL
Message-Id: <20160225213221.GC18267@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>, Duc Dang <dhdang@apm.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

devm_ioremap() returns NULL, it never returns an ERR_PTR.

Fixes: f700e84f417b ('mailbox: Add support for APM X-Gene platform mailbox driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mailbox/mailbox-xgene-slimpro.c b/drivers/mailbox/mailbox-xgene-slimpro.c
index b5f5106..bd07f39 100644
--- a/drivers/mailbox/mailbox-xgene-slimpro.c
+++ b/drivers/mailbox/mailbox-xgene-slimpro.c
@@ -196,8 +196,8 @@ static int slimpro_mbox_probe(struct platform_device *pdev)
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mb_base = devm_ioremap(&pdev->dev, regs->start, resource_size(regs));
-	if (IS_ERR(mb_base))
-		return PTR_ERR(mb_base);
+	if (!mb_base)
+		return -ENOMEM;
 
 	/* Setup mailbox links */
 	for (i = 0; i < MBOX_CNT; i++) {
