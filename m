From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Sep 2016 19:01:20 +0000
Subject: [PATCH 1/2] tile-module: Use kmalloc_array() in module_alloc()
Message-Id: <dfffa006-c2af-06f5-2acf-6ac32e52f95a@users.sourceforge.net>
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
Date: Sat, 3 Sep 2016 20:40:57 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/tile/kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/tile/kernel/module.c b/arch/tile/kernel/module.c
index 2305084..dce4120 100644
--- a/arch/tile/kernel/module.c
+++ b/arch/tile/kernel/module.c
@@ -43,7 +43,7 @@ void *module_alloc(unsigned long size)
 	int npages;
 
 	npages = (size + PAGE_SIZE - 1) / PAGE_SIZE;
-	pages = kmalloc(npages * sizeof(struct page *), GFP_KERNEL);
+	pages = kmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
 	if (pages = NULL)
 		return NULL;
 	for (; i < npages; ++i) {
-- 
2.9.3

