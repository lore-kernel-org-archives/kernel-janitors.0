From: Julia Lawall <julia@diku.dk>
Date: Tue, 24 Jun 2008 08:24:24 +0000
Subject: [PATCH 8/14] arch/s390: Eliminate NULL test and memset after
Message-Id: <Pine.LNX.4.64.0806241023580.26777@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akinobu.mita@gmail.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, linux390@de.ibm.com, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

As noted by Akinobu Mita in patch b1fceac2b9e04d278316b2faddf276015fc06e3b,
alloc_bootmem and related functions never return NULL and always return a
zeroed region of memory.  Thus a NULL test or memset after calls to these
functions is unnecessary.

 arch/s390/kernel/topology.c |    2 --
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

diff -u -p a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -313,8 +313,6 @@ void __init s390_init_cpu_topology(void)
 		machine_has_topology_irq = 1;
 
 	tl_info = alloc_bootmem_pages(PAGE_SIZE);
-	if (!tl_info)
-		goto error;
 	info = tl_info;
 	stsi(info, 15, 1, 2);
 
