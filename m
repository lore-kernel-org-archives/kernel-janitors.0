From: Ricardo Martins <ricardo@scarybox.net>
Date: Thu, 01 May 2008 19:06:52 +0000
Subject: [PATCH 1/1] mmap: fix uninitialized entities warnings.
Message-Id: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This is my first patch for the Linux kernel. It fixes the following
warnings given by gcc 4.3.0 about uninitialzed entities in mmap.c:

mm/mmap.c: In function ‘insert_vm_struct’:
mm/mmap.c:2079: warning: ‘rb_parent’ may be used uninitialized in this function
mm/mmap.c:2079: warning: ‘rb_link’ may be used uninitialized in this function
mm/mmap.c:2078: warning: ‘prev’ may be used uninitialized in this function
mm/mmap.c: In function ‘copy_vma’:
mm/mmap.c:2118: warning: ‘rb_parent’ may be used uninitialized in this function
mm/mmap.c:2118: warning: ‘rb_link’ may be used uninitialized in this function
mm/mmap.c:2117: warning: ‘prev’ may be used uninitialized in this function
mm/mmap.c: In function ‘do_brk’:
mm/mmap.c:1945: warning: ‘rb_parent’ may be used uninitialized in this function
mm/mmap.c:1945: warning: ‘rb_link’ may be used uninitialized in this function
mm/mmap.c:1943: warning: ‘prev’ may be used uninitialized in this function
mm/mmap.c: In function ‘mmap_region’:
mm/mmap.c:1086: warning: ‘rb_parent’ may be used uninitialized in this function
mm/mmap.c:1086: warning: ‘rb_link’ may be used uninitialized in this function
mm/mmap.c:1083: warning: ‘prev’ may be used uninitialized in this function

I'd appreciate some feedback.

Signed-off-by: Ricardo Martins <ricardo@scarybox.net>
---
 mm/mmap.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index fac6633..64b7df1 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -59,7 +59,7 @@ static void unmap_region(struct mm_struct *mm,
  * MAP_SHARED	r: (no) no	r: (yes) yes	r: (no) yes	r: (no) yes
  *		w: (no) no	w: (no) no	w: (yes) yes	w: (no) no
  *		x: (no) no	x: (no) yes	x: (no) yes	x: (yes) yes
- *		
+ *
  * MAP_PRIVATE	r: (no) no	r: (yes) yes	r: (no) yes	r: (no) yes
  *		w: (no) no	w: (no) no	w: (copy) copy	w: (no) no
  *		x: (no) no	x: (no) yes	x: (no) yes	x: (yes) yes
@@ -1080,10 +1080,10 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 			  int accountable)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma, *prev;
+	struct vm_area_struct *vma, *prev = NULL;
 	int correct_wcount = 0;
 	int error;
-	struct rb_node **rb_link, *rb_parent;
+	struct rb_node **rb_link = NULL, *rb_parent = NULL;
 	unsigned long charged = 0;
 	struct inode *inode =  file ? file->f_path.dentry->d_inode : NULL;
 
@@ -1299,7 +1299,7 @@ full_search:
 		addr = vma->vm_end;
 	}
 }
-#endif	
+#endif
 
 void arch_unmap_area(struct mm_struct *mm, unsigned long addr)
 {
@@ -1940,9 +1940,9 @@ static inline void verify_mm_writelocked(struct mm_struct *mm)
 unsigned long do_brk(unsigned long addr, unsigned long len)
 {
 	struct mm_struct * mm = current->mm;
-	struct vm_area_struct * vma, * prev;
+	struct vm_area_struct * vma, * prev = NULL;
 	unsigned long flags;
-	struct rb_node ** rb_link, * rb_parent;
+	struct rb_node ** rb_link = NULL, * rb_parent = NULL;
 	pgoff_t pgoff = addr >> PAGE_SHIFT;
 	int error;
 
@@ -2075,8 +2075,8 @@ void exit_mmap(struct mm_struct *mm)
  */
 int insert_vm_struct(struct mm_struct * mm, struct vm_area_struct * vma)
 {
-	struct vm_area_struct * __vma, * prev;
-	struct rb_node ** rb_link, * rb_parent;
+	struct vm_area_struct * __vma, * prev = NULL;
+	struct rb_node ** rb_link = NULL, * rb_parent = NULL;
 
 	/*
 	 * The vm_pgoff of a purely anonymous vma should be irrelevant
@@ -2114,8 +2114,8 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	struct vm_area_struct *vma = *vmap;
 	unsigned long vma_start = vma->vm_start;
 	struct mm_struct *mm = vma->vm_mm;
-	struct vm_area_struct *new_vma, *prev;
-	struct rb_node **rb_link, *rb_parent;
+	struct vm_area_struct *new_vma, *prev = NULL;
+	struct rb_node **rb_link = NULL, *rb_parent = NULL;
 	struct mempolicy *pol;
 
 	/*
-- 
1.5.5.1

