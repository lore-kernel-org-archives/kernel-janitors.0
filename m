From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 04 Aug 2012 16:50:46 +0000
Subject: [PATCH 3/6] drivers/char/hw_random/octeon-rng.c: drop frees of devm allocated data
Message-Id: <1344099049-15212-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>
Cc: kernel-janitors@vger.kernel.org, Herbert Xu <herbert@gondor.hengli.com.au>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

devm_kfree and devm_iounmap should not have to be explicitly used.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,d;
@@

x = devm_kzalloc(...)
...
?-devm_kfree(d,x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/char/hw_random/octeon-rng.c |   17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/char/hw_random/octeon-rng.c b/drivers/char/hw_random/octeon-rng.c
index 0943edc..5c34c09 100644
--- a/drivers/char/hw_random/octeon-rng.c
+++ b/drivers/char/hw_random/octeon-rng.c
@@ -75,42 +75,35 @@ static int __devinit octeon_rng_probe(struct platform_device *pdev)
 
 	res_ports = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res_ports)
-		goto err_ports;
+		return -ENOENT;
 
 	res_result = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (!res_result)
-		goto err_ports;
+		return -ENOENT;
 
 
 	rng->control_status = devm_ioremap_nocache(&pdev->dev,
 						   res_ports->start,
 						   sizeof(u64));
 	if (!rng->control_status)
-		goto err_ports;
+		return -ENOENT;
 
 	rng->result = devm_ioremap_nocache(&pdev->dev,
 					   res_result->start,
 					   sizeof(u64));
 	if (!rng->result)
-		goto err_r;
+		return -ENOENT;
 
 	rng->ops = ops;
 
 	dev_set_drvdata(&pdev->dev, &rng->ops);
 	ret = hwrng_register(&rng->ops);
 	if (ret)
-		goto err;
+		return -ENOENT;
 
 	dev_info(&pdev->dev, "Octeon Random Number Generator\n");
 
 	return 0;
-err:
-	devm_iounmap(&pdev->dev, rng->control_status);
-err_r:
-	devm_iounmap(&pdev->dev, rng->result);
-err_ports:
-	devm_kfree(&pdev->dev, rng);
-	return -ENOENT;
 }
 
 static int __exit octeon_rng_remove(struct platform_device *pdev)

