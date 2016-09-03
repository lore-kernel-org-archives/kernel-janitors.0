From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Sep 2016 19:02:13 +0000
Subject: [PATCH 2/2] tile-module: Rename jump labels in module_alloc()
Message-Id: <b0b8d124-df22-9d69-49ee-7647028310bc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <764e5d1b-c7ab-c8aa-1482-334a00e11280@users.sourceforge.net>
In-Reply-To: <764e5d1b-c7ab-c8aa-1482-334a00e11280@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Metcalf <cmetcalf@mellanox.com>, Rusty Russell <rusty@rustcorp.com.au>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Sep 2016 20:45:20 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/tile/kernel/module.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/tile/kernel/module.c b/arch/tile/kernel/module.c
index dce4120..09233fb 100644
--- a/arch/tile/kernel/module.c
+++ b/arch/tile/kernel/module.c
@@ -49,23 +49,22 @@ void *module_alloc(unsigned long size)
 	for (; i < npages; ++i) {
 		pages[i] = alloc_page(GFP_KERNEL | __GFP_HIGHMEM);
 		if (!pages[i])
-			goto error;
+			goto free_pages;
 	}
 
 	area = __get_vm_area(size, VM_ALLOC, MEM_MODULE_START, MEM_MODULE_END);
 	if (!area)
-		goto error;
+		goto free_pages;
 	area->nr_pages = npages;
 	area->pages = pages;
 
 	if (map_vm_area(area, prot_rwx, pages)) {
 		vunmap(area->addr);
-		goto error;
+		goto free_pages;
 	}
 
 	return area->addr;
-
-error:
+ free_pages:
 	while (--i >= 0)
 		__free_page(pages[i]);
 	kfree(pages);
-- 
2.9.3

