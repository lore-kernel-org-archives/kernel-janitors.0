From: Dan Carpenter <error27@gmail.com>
Date: Tue, 25 May 2010 09:53:48 +0000
Subject: [patch 1/2] dma/timb_dma: fixup error handling in
Message-Id: <20100525095348.GI22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: Linus Walleij <linus.walleij@stericsson.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Richard =?iso-8859-1?Q?R=F6jfors?= <richard.rojfors@pelagicore.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code tried to kfree(td_desc->desc_list) when td_desc was
NULL so I re-arranged it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
index 0172fa3..3e101a0 100644
--- a/drivers/dma/timb_dma.c
+++ b/drivers/dma/timb_dma.c
@@ -390,7 +390,7 @@ static struct timb_dma_desc *td_alloc_init_desc(struct timb_dma_chan *td_chan)
 	td_desc->desc_list = kzalloc(td_desc->desc_list_len, GFP_KERNEL);
 	if (!td_desc->desc_list) {
 		dev_err(chan2dev(chan), "Failed to alloc descriptor\n");
-		goto err;
+		goto err_desc;
 	}
 
 	dma_async_tx_descriptor_init(&td_desc->txd, chan);
@@ -403,14 +403,16 @@ static struct timb_dma_desc *td_alloc_init_desc(struct timb_dma_chan *td_chan)
 	err = dma_mapping_error(chan2dmadev(chan), td_desc->txd.phys);
 	if (err) {
 		dev_err(chan2dev(chan), "DMA mapping error: %d\n", err);
-		goto err;
+		goto err_list;
 	}
 
 	return td_desc;
-err:
+
+err_list:
 	kfree(td_desc->desc_list);
+err_desc:
 	kfree(td_desc);
-
+err:
 	return NULL;
 
 }
