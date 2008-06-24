From: Julia Lawall <julia@diku.dk>
Date: Tue, 24 Jun 2008 08:22:35 +0000
Subject: [PATCH 4/14] arch/m68k/mm/motorola.c: Eliminate NULL test and memset
Message-Id: <Pine.LNX.4.64.0806241022060.26777@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akinobu.mita@gmail.com, geert@linux-m68k.org, zippel@linux-m68k.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

As noted by Akinobu Mita in patch b1fceac2b9e04d278316b2faddf276015fc06e3b,
alloc_bootmem and related functions never return NULL and always return a
zeroed region of memory.  Thus a NULL test or memset after calls to these
functions is unnecessary.

 arch/m68k/mm/motorola.c |    1 -
 1 file changed, 1 deletion(-)

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

diff -u -p a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -285,7 +285,6 @@ void __init paging_init(void)
 	 * to a couple of allocated pages
 	 */
 	empty_zero_page = alloc_bootmem_pages(PAGE_SIZE);
-	memset(empty_zero_page, 0, PAGE_SIZE);
 
 	/*
 	 * Set up SFC/DFC registers
