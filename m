From: Julia Lawall <julia@diku.dk>
Date: Sun, 23 Nov 2008 10:48:56 +0000
Subject: [PATCH 4/5] arch/powerpc: Eliminate NULL test and memset after
Message-Id: <Pine.LNX.4.64.0811231148170.28343@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulus@samba.org, benh@kernel.crashing.org, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

 arch/powerpc/kernel/setup_64.c      |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 9dca8cf..261c1b0 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -606,8 +606,6 @@ void __init setup_per_cpu_areas(void)
 
 	for_each_possible_cpu(i) {
 		ptr = alloc_bootmem_pages_node(NODE_DATA(cpu_to_node(i)), size);
-		if (!ptr)
-			panic("Cannot allocate cpu data for CPU %d\n", i);
 
 		paca[i].data_offset = ptr - __per_cpu_start;
 		memcpy(ptr, __per_cpu_start, __per_cpu_end - __per_cpu_start);
