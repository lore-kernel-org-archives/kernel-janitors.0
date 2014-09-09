From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Sep 2014 10:34:53 +0000
Subject: re: hwrng: xgene - add support for APM X-Gene SoC RNG support
Message-Id: <20140909103453.GA4507@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Feng Kan,

The patch a91ae4eba9f9: "hwrng: xgene - add support for APM X-Gene
SoC RNG support" from Aug 22, 2014, leads to the following static
checker warning:

	drivers/char/hw_random/xgene-rng.c:339 xgene_rng_probe()
	warn: unsigned 'ctx->irq' is never less than zero.

drivers/char/hw_random/xgene-rng.c
   335          if (IS_ERR(ctx->csr_base))
   336                  return PTR_ERR(ctx->csr_base);
   337  
   338          ctx->irq = platform_get_irq(pdev, 0);
   339          if (ctx->irq < 0) {
                    ^^^^^^^^^^^^
Impossible for unsigned values.

   340                  dev_err(&pdev->dev, "No IRQ resource\n");
   341                  return ctx->irq;
   342          }
   343  
   344          dev_dbg(&pdev->dev, "APM X-Gene RNG BASE %p ALARM IRQ %d",


regards,
dan carpenter
