From: Julia Lawall <julia@diku.dk>
Date: Tue, 24 Jun 2008 08:21:34 +0000
Subject: [PATCH 2/14] arch/frv: Eliminate NULL test and memset after
Message-Id: <Pine.LNX.4.64.0806241021080.26777@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akinobu.mita@gmail.com, dhowells@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

As noted by Akinobu Mita in patch b1fceac2b9e04d278316b2faddf276015fc06e3b,
alloc_bootmem and related functions never return NULL and always return a
zeroed region of memory.  Thus a NULL test or memset after calls to these
functions is unnecessary.

 arch/frv/mm/init.c |    2 --
 1 file changed, 2 deletions(-)

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

diff -u -p a/arch/frv/mm/init.c b/arch/frv/mm/init.c
--- a/arch/frv/mm/init.c
+++ b/arch/frv/mm/init.c
@@ -118,8 +118,6 @@ void __init paging_init(void)
 
 		pkmap_page_table = alloc_bootmem_pages(PAGE_SIZE);
 
-		memset(pkmap_page_table, 0, PAGE_SIZE);
-
 		pge = swapper_pg_dir + pgd_index_k(PKMAP_BASE);
 		pue = pud_offset(pge, PKMAP_BASE);
 		pme = pmd_offset(pue, PKMAP_BASE);
