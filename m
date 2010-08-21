From: Julia Lawall <julia@diku.dk>
Date: Sat, 21 Aug 2010 09:30:17 +0000
Subject: [PATCH] arch/mn10300/mm: eliminate NULL dereference
Message-Id: <Pine.LNX.4.64.1008211129440.2637@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, linux-am33-list@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

dev_name always dereferences its argument, so it should not be called if
the argument is NULL.  The function indeed later tests the argument for
being NULL.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression dev,E;
@@

*dev_name(dev)
... when != dev = E
(
*dev = NULL
|
*dev != NULL
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/mn10300/mm/dma-alloc.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mn10300/mm/dma-alloc.c b/arch/mn10300/mm/dma-alloc.c
index 4e34880..159acb0 100644
--- a/arch/mn10300/mm/dma-alloc.c
+++ b/arch/mn10300/mm/dma-alloc.c
@@ -25,7 +25,8 @@ void *dma_alloc_coherent(struct device *dev, size_t size,
 	unsigned long addr;
 	void *ret;
 
-	printk("dma_alloc_coherent(%s,%zu,,%x)\n", dev_name(dev), size, gfp);
+	pr_debug("dma_alloc_coherent(%s,%zu,%x)\n",
+		 dev ? dev_name(dev) : "?", size, gfp);
 
 	if (0xbe000000 - pci_sram_allocated >= size) {
 		size = (size + 255) & ~255;
