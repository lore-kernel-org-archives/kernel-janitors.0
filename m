From: Dan Carpenter <error27@gmail.com>
Date: Tue, 25 May 2010 09:49:47 +0000
Subject: [patch] mv_cesa: fixup error handling in mv_probe()
Message-Id: <20100525094947.GF22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Uri Simchoni <uri@jdland.co.il>, Nicolas Pitre <nico@marvell.com>, Tejun Heo <tj@kernel.org>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

The error handling in mv_probe() was a bit messed up.  There were some 
gotos to the wrong labels so it ended up releasing stuff that that hadn't
been aquired and not releasing stuff that was meant to be released.  I
shuffled it around a bit to fix it and make it clearer.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I'm afraid that I don't have a cross compile environment set up so I
can't even compile this.  I'm very sorry about that.

diff --git a/drivers/crypto/mv_cesa.c b/drivers/crypto/mv_cesa.c
index e095422..7d279e5 100644
--- a/drivers/crypto/mv_cesa.c
+++ b/drivers/crypto/mv_cesa.c
@@ -1055,20 +1055,20 @@ static int mv_probe(struct platform_device *pdev)
 	cp->queue_th = kthread_run(queue_manag, cp, "mv_crypto");
 	if (IS_ERR(cp->queue_th)) {
 		ret = PTR_ERR(cp->queue_th);
-		goto err_thread;
+		goto err_unmap_sram;
 	}
 
 	ret = request_irq(irq, crypto_int, IRQF_DISABLED, dev_name(&pdev->dev),
 			cp);
 	if (ret)
-		goto err_unmap_sram;
+		goto err_thread;
 
 	writel(SEC_INT_ACCEL0_DONE, cpg->reg + SEC_ACCEL_INT_MASK);
 	writel(SEC_CFG_STOP_DIG_ERR, cpg->reg + SEC_ACCEL_CFG);
 
 	ret = crypto_register_alg(&mv_aes_alg_ecb);
 	if (ret)
-		goto err_reg;
+		goto err_irq;
 
 	ret = crypto_register_alg(&mv_aes_alg_cbc);
 	if (ret)
@@ -1091,9 +1091,9 @@ static int mv_probe(struct platform_device *pdev)
 	return 0;
 err_unreg_ecb:
 	crypto_unregister_alg(&mv_aes_alg_ecb);
-err_thread:
+err_irq:
 	free_irq(irq, cp);
-err_reg:
+err_thread:
 	kthread_stop(cp->queue_th);
 err_unmap_sram:
 	iounmap(cp->sram);
