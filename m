From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 27 Jul 2020 13:51:51 +0000
Subject: [PATCH 2/2] media: bt8xx: avoid a useless memset
Message-Id: <20200727135151.54757-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Avoid a memset after a call to 'dma_alloc_coherent()'.
This is useless since
commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/pci/bt8xx/btcx-risc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
index 13bb1490a568..b3179038b900 100644
--- a/drivers/media/pci/bt8xx/btcx-risc.c
+++ b/drivers/media/pci/bt8xx/btcx-risc.c
@@ -73,7 +73,6 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
 		dprintk("btcx: riscmem alloc [%d] dma=%lx cpu=%p size=%d\n",
 			memcnt, (unsigned long)dma, cpu, size);
 	}
-	memset(risc->cpu,0,risc->size);
 	return 0;
 }
 
-- 
2.25.1
