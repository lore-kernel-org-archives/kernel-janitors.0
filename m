From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sat, 03 Jan 2004 13:28:55 +0000
Subject: [Kernel-janitors] [PATCH] Minor cleanup in mm/mremap.c
Message-Id: <20040103132855.GD21909@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

http://www.anomalistic.org/patches/mremap-remove-allocated_vma-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/mm/mremap.c 2.6.1-rc1-mm1-fix/mm/mremap.c
--- 2.6.1-rc1-mm1/mm/mremap.c	2003-12-18 10:58:56.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/mm/mremap.c	2004-01-03 20:17:18.000000000 +0800
@@ -5,6 +5,9 @@
  *
  *	Address space accounting code	<alan@redhat.com>
  *	(C) Copyright 2002 Red Hat Inc, All Rights Reserved
+ *
+ * 	Eugene Teo January 3rd, 2004
+ * 	- A minor cleanup to remove allocated_vma since it is not necessary.
  */
 
 #include <linux/mm.h>
@@ -186,7 +189,6 @@
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct vm_area_struct *new_vma, *next, *prev;
-	int allocated_vma;
 	int split = 0;
 
 	new_vma = NULL;
@@ -232,18 +234,16 @@
 		}
 	}
 
-	allocated_vma = 0;
 	if (!new_vma) {
 		new_vma = kmem_cache_alloc(vm_area_cachep, SLAB_KERNEL);
 		if (!new_vma)
 			goto out;
-		allocated_vma = 1;
 	}
 
 	if (!move_page_tables(vma, new_addr, addr, old_len)) {
 		unsigned long vm_locked = vma->vm_flags & VM_LOCKED;
 
-		if (allocated_vma) {
+		if (new_vma) {
 			*new_vma = *vma;
 			INIT_LIST_HEAD(&new_vma->shared);
 			new_vma->vm_start = new_addr;
@@ -285,7 +285,7 @@
 		}
 		return new_addr;
 	}
-	if (allocated_vma)
+	if (new_vma)
 		kmem_cache_free(vm_area_cachep, new_vma);
  out:
 	return -ENOMEM;
 
-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
