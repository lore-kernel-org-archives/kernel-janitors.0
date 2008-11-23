From: Julia Lawall <julia@diku.dk>
Date: Sun, 23 Nov 2008 10:46:58 +0000
Subject: [PATCH 2/5] arch/avr32: Eliminate NULL test and memset after
Message-Id: <Pine.LNX.4.64.0811231146250.28343@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hskinnemoen@atmel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

 arch/avr32/mm/init.c                |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/avr32/mm/init.c b/arch/avr32/mm/init.c
index fa92ff6..e819fa6 100644
--- a/arch/avr32/mm/init.c
+++ b/arch/avr32/mm/init.c
@@ -97,7 +97,6 @@ void __init paging_init(void)
 
 	mem_map = NODE_DATA(0)->node_mem_map;
 
-	memset(zero_page, 0, PAGE_SIZE);
 	empty_zero_page = virt_to_page(zero_page);
 	flush_dcache_page(empty_zero_page);
 }
