From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jul 2019 16:43:18 +0000
Subject: [PATCH] xtensa: One function call less in bootmem_init()
Message-Id: <495c9f2e-7880-ee9a-5c61-eee598bb24c2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jul 2019 18:33:58 +0200

Avoid an extra function call by using a ternary operator instead of
a conditional statement for a setting selection.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/xtensa/mm/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index b51746f2b80b..79467c749416 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -45,10 +45,7 @@ void __init bootmem_init(void)
 	 * If PHYS_OFFSET is zero reserve page at address 0:
 	 * successfull allocations should never return NULL.
 	 */
-	if (PHYS_OFFSET)
-		memblock_reserve(0, PHYS_OFFSET);
-	else
-		memblock_reserve(0, 1);
+	memblock_reserve(0, PHYS_OFFSET ? PHYS_OFFSET : 1);

 	early_init_fdt_scan_reserved_mem();

--
2.22.0
