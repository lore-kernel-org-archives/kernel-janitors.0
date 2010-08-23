From: David Howells <dhowells@redhat.com>
Date: Mon, 23 Aug 2010 13:31:34 +0000
Subject: [PATCH] arch/mn10300/mm: eliminate NULL dereference
Message-Id: <20100823133134.25674.77240.stgit@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008211129440.2637@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008211129440.2637@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torvalds@osdl.org, akpm@linux-foundation.org
Cc: linux-am33-list@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia@diku.dk>, David Howells <dhowells@redhat.com>

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
Signed-off-by: David Howells <dhowells@redhat.com>
---

 arch/mn10300/mm/dma-alloc.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)


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

