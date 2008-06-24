From: Julia Lawall <julia@diku.dk>
Date: Tue, 24 Jun 2008 08:26:47 +0000
Subject: [PATCH 13/14] lib: Eliminate NULL test and memset after alloc_bootmem
Message-Id: <Pine.LNX.4.64.0806241026250.26777@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akinobu.mita@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

As noted by Akinobu Mita in patch b1fceac2b9e04d278316b2faddf276015fc06e3b,
alloc_bootmem and related functions never return NULL and always return a
zeroed region of memory.  Thus a NULL test or memset after calls to these
functions is unnecessary.

 lib/swiotlb.c |    4 ----
 1 file changed, 4 deletions(-)

This was fixed using the following semantic patch.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E;
statement S;
@@

E = \(alloc_bootmem\|alloc_bootmem_low\|alloc_bootmem_pages\|alloc_bootmem_low_pages\)(...)
... when != E
(
- BUG_ON (E = NULL);
|
- if (E = NULL) S
)

@@
expression E,E1;
@@

E = \(alloc_bootmem\|alloc_bootmem_low\|alloc_bootmem_pages\|alloc_bootmem_low_pages\)(...)
... when != E
- memset(E,0,E1);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/lib/swiotlb.c b/lib/swiotlb.c
--- a/lib/swiotlb.c
+++ b/lib/swiotlb.c
@@ -146,8 +146,6 @@ swiotlb_init_with_default_size(size_t de
 	 * Get IO TLB memory from the low pages
 	 */
 	io_tlb_start = alloc_bootmem_low_pages(bytes);
-	if (!io_tlb_start)
-		panic("Cannot allocate SWIOTLB buffer");
 	io_tlb_end = io_tlb_start + bytes;
 
 	/*
@@ -165,8 +163,6 @@ swiotlb_init_with_default_size(size_t de
 	 * Get the overflow emergency buffer
 	 */
 	io_tlb_overflow_buffer = alloc_bootmem_low(io_tlb_overflow);
-	if (!io_tlb_overflow_buffer)
-		panic("Cannot allocate SWIOTLB overflow buffer!\n");
 
 	printk(KERN_INFO "Placing software IO TLB between 0x%lx - 0x%lx\n",
 	       virt_to_bus(io_tlb_start), virt_to_bus(io_tlb_end));
