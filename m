From: Dan Carpenter <error27@gmail.com>
Date: Sat, 14 Aug 2010 09:01:45 +0000
Subject: [patch] dma/shdma: move dereference below the NULL check
Message-Id: <20100814090145.GW645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Magnus Damm <damm@opensource.se>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"param" can be NULL here, so only dereference it after the check.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/dma/shdma.c b/drivers/dma/shdma.c
index fb64cf3..eb6b54d 100644
--- a/drivers/dma/shdma.c
+++ b/drivers/dma/shdma.c
@@ -580,7 +580,6 @@ static struct dma_async_tx_descriptor *sh_dmae_prep_slave_sg(
 
 	sh_chan = to_sh_chan(chan);
 	param = chan->private;
-	slave_addr = param->config->addr;
 
 	/* Someone calling slave DMA on a public channel? */
 	if (!param || !sg_len) {
@@ -589,6 +588,8 @@ static struct dma_async_tx_descriptor *sh_dmae_prep_slave_sg(
 		return NULL;
 	}
 
+	slave_addr = param->config->addr;
+
 	/*
 	 * if (param != NULL), this is a successfully requested slave channel,
 	 * therefore param->config != NULL too.
