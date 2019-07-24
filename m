From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 24 Jul 2019 22:01:45 +0000
Subject: [PATCH] ide: tx4939ide: Fix the name used in a 'devm_request_mem_region()' call
Message-Id: <20190724220145.17282-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This should be "tx4939ide" instead of "tx4938ide", but here MODNAME is even
better.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/ide/tx4939ide.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ide/tx4939ide.c b/drivers/ide/tx4939ide.c
index 88d132edc4e3..079b271dd5a7 100644
--- a/drivers/ide/tx4939ide.c
+++ b/drivers/ide/tx4939ide.c
@@ -549,7 +549,7 @@ static int __init tx4939ide_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	if (!devm_request_mem_region(&pdev->dev, res->start,
-				     resource_size(res), "tx4938ide"))
+				     resource_size(res), MODNAME))
 		return -EBUSY;
 	mapbase = (unsigned long)devm_ioremap(&pdev->dev, res->start,
 					      resource_size(res));
-- 
2.20.1
