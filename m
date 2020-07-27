From: Joe Perches <joe@perches.com>
Date: Mon, 27 Jul 2020 16:16:43 +0000
Subject: Re: [PATCH 2/2] media: bt8xx: avoid a useless memset
Message-Id: <30618c986727e5f8a9806f663b4e6f4aa80065ae.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727135151.54757-1-christophe.jaillet@wanadoo.fr>
         <0897d9bec8865859694c917f3f72ab8fd12321ff.camel@perches.com>
In-Reply-To: <0897d9bec8865859694c917f3f72ab8fd12321ff.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mchehab@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2020-07-27 at 09:09 -0700, Joe Perches wrote:
> On Mon, 2020-07-27 at 15:51 +0200, Christophe JAILLET wrote:
> > Avoid a memset after a call to 'dma_alloc_coherent()'.
> > This is useless since
> > commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")
> []
> > diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
> []
> > @@ -73,7 +73,6 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
> >  		dprintk("btcx: riscmem alloc [%d] dma=%lx cpu=%p size=%d\n",
> >  			memcnt, (unsigned long)dma, cpu, size);
> >  	}
> > -	memset(risc->cpu,0,risc->size);
> >  	return 0;
> >  }
> 
> Likely NAK.
> 
> This is not useless as risc->cpu may be reused
> and the alloc may not have been done.

Perhaps a little rewrite for clarity:
---
 drivers/media/pci/bt8xx/btcx-risc.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
index 51257980f539..311f4ca2a108 100644
--- a/drivers/media/pci/bt8xx/btcx-risc.c
+++ b/drivers/media/pci/bt8xx/btcx-risc.c
@@ -56,24 +56,26 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
 		       struct btcx_riscmem *risc,
 		       unsigned int size)
 {
-	__le32 *cpu;
-	dma_addr_t dma = 0;
-
-	if (NULL != risc->cpu && risc->size < size)
-		btcx_riscmem_free(pci,risc);
-	if (NULL = risc->cpu) {
-		cpu = pci_alloc_consistent(pci, size, &dma);
-		if (NULL = cpu)
+	if (risc->cpu && risc->size < size)
+		btcx_riscmem_free(pci, risc);
+
+	if (risc->cpu) {
+		memset(risc->cpu, 0, risc->size);
+	} else {
+		dma_addr_t dma = 0;
+
+		risc->cpu = pci_alloc_consistent(pci, size, &dma);
+		if (!risc->cpu)
 			return -ENOMEM;
-		risc->cpu  = cpu;
+
 		risc->dma  = dma;
 		risc->size = size;
 
 		memcnt++;
 		dprintk("btcx: riscmem alloc [%d] dma=%lx cpu=%p size=%d\n",
-			memcnt, (unsigned long)dma, cpu, size);
+			memcnt, (unsigned long)dma, risc->cpu, size);
 	}
-	memset(risc->cpu,0,risc->size);
+
 	return 0;
 }
 
