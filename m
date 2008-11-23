From: Julia Lawall <julia@diku.dk>
Date: Sun, 23 Nov 2008 10:46:21 +0000
Subject: [PATCH 1/5] arch/arm: Eliminate NULL test and memset after alloc_bootmem
Message-Id: <Pine.LNX.4.64.0811231145370.28343@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rmk@arm.linux.org.uk, linux-arm-kernel@lists.arm.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

As noted by Akinobu Mita in patch b1fceac2b9e04d278316b2faddf276015fc06e3b,
alloc_bootmem and related functions never return NULL and always return a
zeroed region of memory.  Thus a NULL test or memset after calls to these
functions is unnecessary.

This was fixed using the following semantic patch.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E;
statement S;
@@

E = \(alloc_bootmem\|alloc_bootmem_low\|alloc_bootmem_pages\|alloc_bootmem_low_pages\|alloc_bootmem_node\|alloc_bootmem_low_pages_node\|alloc_bootmem_pages_node\)(...)
... when != E
(
- BUG_ON (E = NULL);
|
- if (E = NULL) S
)

@@
expression E,E1;
@@

E = \(alloc_bootmem\|alloc_bootmem_low\|alloc_bootmem_pages\|alloc_bootmem_low_pages\|alloc_bootmem_node\|alloc_bootmem_low_pages_node\|alloc_bootmem_pages_node\)(...)
... when != E
- memset(E,0,E1);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

 arch/arm/mm/mmu.c                   |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 9a17d51..6eb9f26 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -819,7 +819,6 @@ static void __init devicemaps_init(struct machine_desc *mdesc)
 	 * Allocate the vector page early.
 	 */
 	vectors = alloc_bootmem_low_pages(PAGE_SIZE);
-	BUG_ON(!vectors);
 
 	for (addr = VMALLOC_END; addr; addr += PGDIR_SIZE)
 		pmd_clear(pmd_off_k(addr));
@@ -904,10 +903,10 @@ void __init paging_init(struct machine_desc *mdesc)
 	top_pmd = pmd_off_k(0xffff0000);
 
 	/*
-	 * allocate the zero page.  Note that we count on this going ok.
+	 * allocate the zero page.  Note that this always succeeds and
+	 * returns a zeroed result.
 	 */
 	zero_page = alloc_bootmem_low_pages(PAGE_SIZE);
-	memset(zero_page, 0, PAGE_SIZE);
 	empty_zero_page = virt_to_page(zero_page);
 	flush_dcache_page(empty_zero_page);
 }
