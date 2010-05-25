From: Dan Carpenter <error27@gmail.com>
Date: Tue, 25 May 2010 09:55:06 +0000
Subject: [patch 2/2] dma/timb_dma: compile warning on 32 bit
Message-Id: <20100525095506.GJ22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: Linus Walleij <linus.walleij@stericsson.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Richard =?iso-8859-1?Q?R=F6jfors?= <richard.rojfors@pelagicore.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This silences a compile warning on 32 bit systems:
drivers/dma/timb_dma.c:203: warning: cast to pointer from integer of different size

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
index 0172fa3..debc2b7 100644
--- a/drivers/dma/timb_dma.c
+++ b/drivers/dma/timb_dma.c
@@ -200,8 +200,8 @@ static int td_fill_desc(struct timb_dma_chan *td_chan, u8 *dma_desc,
 		return -EINVAL;
 	}
 
-	dev_dbg(chan2dev(&td_chan->chan), "desc: %p, addr: %p\n",
-		dma_desc, (void *)sg_dma_address(sg));
+	dev_dbg(chan2dev(&td_chan->chan), "desc: %p, addr: 0x%llx\n",
+		dma_desc, (unsigned long long)sg_dma_address(sg));
 
 	dma_desc[7] = (sg_dma_address(sg) >> 24) & 0xff;
 	dma_desc[6] = (sg_dma_address(sg) >> 16) & 0xff;

