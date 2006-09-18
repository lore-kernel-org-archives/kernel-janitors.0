From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 18 Sep 2006 21:40:06 +0000
Subject: [KJ] [Patch] BUG_ON conversion for drivers/mmc/omap.c
Message-Id: <1158615606.21907.4.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158615536.21907.1.camel@alice>
In-Reply-To: <1158615536.21907.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

this patch converts a if () BUG(); construct to BUG_ON();
which occupies less space, uses unlikely and is safer when
BUG() is disabled.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.18-rc7/drivers/mmc/omap.c.orig	2006-09-18 23:30:55.000000000 +0200
+++ linux-2.6.18-rc7/drivers/mmc/omap.c	2006-09-18 23:31:09.000000000 +0200
@@ -640,8 +640,7 @@ mmc_omap_prepare_dma(struct mmc_omap_hos
 	}
 
 	/* Max limit for DMA frame count is 0xffff */
-	if (unlikely(count > 0xffff))
-		BUG();
+	BUG_ON(count > 0xffff);
 
 	OMAP_MMC_WRITE(host->base, BUF, buf);
 	omap_set_dma_transfer_params(dma_ch, OMAP_DMA_DATA_TYPE_S16,


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
