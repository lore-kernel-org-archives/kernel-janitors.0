From: Julia Lawall <julia@diku.dk>
Date: Fri, 30 Nov 2007 15:50:59 +0000
Subject: [PATCH 1/2] arch/cris: Added a missing iounmap
Message-Id: <Pine.LNX.4.64.0711301649570.26269@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: starvik@axis.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

An extra error handling label is needed for the case where the ioremap has
succeeded.

The problem was detected using the following semantic match
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T,T1,T2;
identifier E;
statement S;
expression x1,x2;
constant C;
int ret;
@@

  T E;
  ...
* E = ioremap(...);
  if (E = NULL) S
  ... when != iounmap(E)
      when != if (E != NULL) { ... iounmap(E); ...}
      when != x1 = (T1)E
  if (...) {
    ... when != iounmap(E)
        when != if (E != NULL) { ... iounmap(E); ...}
        when != x2 = (T2)E
(
*   return;
|
*   return C;
|
*   return ret;
)
  }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/arch/cris/arch-v32/drivers/pci/dma.c b/arch/cris/arch-v32/drivers/pci/dma.c
--- a/arch/cris/arch-v32/drivers/pci/dma.c	2007-07-20 17:45:43.000000000 +0200
+++ b/arch/cris/arch-v32/drivers/pci/dma.c	2007-11-29 18:45:16.000000000 +0100
@@ -93,7 +93,7 @@ int dma_declare_coherent_memory(struct d
 
 	dev->dma_mem = kzalloc(sizeof(struct dma_coherent_mem), GFP_KERNEL);
 	if (!dev->dma_mem)
-		goto out;
+		goto iounmap_out;
 	dev->dma_mem->bitmap = kzalloc(bitmap_size, GFP_KERNEL);
 	if (!dev->dma_mem->bitmap)
 		goto free1_out;
@@ -110,6 +110,8 @@ int dma_declare_coherent_memory(struct d
 
  free1_out:
 	kfree(dev->dma_mem);
+ iounmap_out:
+	iounmap(mem_base);
  out:
 	return 0;
 }
