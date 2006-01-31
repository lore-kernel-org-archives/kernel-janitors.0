From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 13:03:17 +0000
Subject: [KJ] [Patch 4/7] BUG_ON() Conversion in mm/mmap.c
Message-Id: <1138712597.11570.16.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34517638335776279=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34517638335776279==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/mm/mmap.c.orig	2006-01-30 23:17:56.000000000 +0100
+++ linux-2.6.16-rc1-git4/mm/mmap.c	2006-01-30 23:20:24.000000000 +0100
@@ -294,8 +294,7 @@ void validate_mm(struct mm_struct *mm)
 	i = browse_rb(&mm->mm_rb);
 	if (i != mm->map_count)
 		printk("map_count %d rb %d\n", mm->map_count, i), bug = 1;
-	if (bug)
-		BUG();
+	BUG_ON(bug);
 }
 #else
 #define validate_mm(mm) do { } while (0)
@@ -432,8 +431,7 @@ __insert_vm_struct(struct mm_struct * mm
 	struct rb_node ** rb_link, * rb_parent;
 
 	__vma = find_vma_prepare(mm, vma->vm_start,&prev, &rb_link, &rb_parent);
-	if (__vma && __vma->vm_start < vma->vm_end)
-		BUG();
+	BUG_ON(__vma && __vma->vm_start < vma->vm_end);
 	__vma_link(mm, vma, prev, rb_link, rb_parent);
 	mm->map_count++;
 }
@@ -813,8 +811,7 @@ try_prev:
 	 * (e.g. stash info in next's anon_vma_node when assigning
 	 * an anon_vma, or when trying vma_merge).  Another time.
 	 */
-	if (find_vma_prev(vma->vm_mm, vma->vm_start, &near) != vma)
-		BUG();
+	BUG_ON(find_vma_prev(vma->vm_mm, vma->vm_start, &near) != vma);
 	if (!near)
 		goto none;
 



--===============34517638335776279==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34517638335776279==--
