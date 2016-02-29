From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 29 Feb 2016 09:51:07 +0000
Subject: [patch] dma/mic_x100_dma: IS_ERR() vs PTR_ERR() typo
Message-Id: <20160229095107.GA32061@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is harmless because the caller only cares about zero vs non-zero
but we should be returning PTR_ERR() here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/mic_x100_dma.c b/drivers/dma/mic_x100_dma.c
index 068e920..1502b24 100644
--- a/drivers/dma/mic_x100_dma.c
+++ b/drivers/dma/mic_x100_dma.c
@@ -483,7 +483,7 @@ static int mic_dma_setup_irq(struct mic_dma_chan *ch)
 			mic_dma_intr_handler, mic_dma_thread_fn,
 			"mic dma_channel", ch, ch->ch_num);
 	if (IS_ERR(ch->cookie))
-		return IS_ERR(ch->cookie);
+		return PTR_ERR(ch->cookie);
 	return 0;
 }
 
