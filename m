From: Jaswinder Singh <jaswinder@infradead.org>
Date: Tue, 01 Jul 2008 10:48:07 +0000
Subject: [PATCH] fix mmap uninitialized warnings
Message-Id: <1214908567.31983.6.camel@jaswinder.satnam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hello all,

﻿I am surprise why no body is solving these mmap warnings :-

mm/mmap.c: In function ‘insert_vm_struct’:
mm/mmap.c:2085: warning: ‘rb_parent’ may be used uninitialized in this
function
mm/mmap.c:2085: warning: ‘rb_link’ may be used uninitialized in this
function
mm/mmap.c:2084: warning: ‘prev’ may be used uninitialized in this
function
mm/mmap.c: In function ‘copy_vma’:
mm/mmap.c:2124: warning: ‘rb_parent’ may be used uninitialized in this
function
mm/mmap.c:2124: warning: ‘rb_link’ may be used uninitialized in this
function
mm/mmap.c:2123: warning: ‘prev’ may be used uninitialized in this
function
mm/mmap.c: In function ‘do_brk’:
mm/mmap.c:1951: warning: ‘rb_parent’ may be used uninitialized in this
function
mm/mmap.c:1951: warning: ‘rb_link’ may be used uninitialized in this
function
mm/mmap.c:1949: warning: ‘prev’ may be used uninitialized in this
function
mm/mmap.c: In function ‘mmap_region’:
mm/mmap.c:1092: warning: ‘rb_parent’ may be used uninitialized in this
function
mm/mmap.c:1092: warning: ‘rb_link’ may be used uninitialized in this
function
mm/mmap.c:1089: warning: ‘prev’ may be used uninitialized in this
function

here is the patch to solve above warnings.

Please let me know your views about this patch or what is the best
option to remove these warnings.

Thank you,

Jaswinder Singh.

Signed-off-by: Jaswinder Singh <jaswinder@infradead.org>
--
diff --git a/mm/mmap.c b/mm/mmap.c
index 3354fdd..cb4386c 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1086,10 +1086,10 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
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
 
@@ -1946,9 +1946,9 @@ static inline void verify_mm_writelocked(struct mm_struct *mm)
 unsigned long do_brk(unsigned long addr, unsigned long len)
 {
 	struct mm_struct * mm = current->mm;
-	struct vm_area_struct * vma, * prev;
+	struct vm_area_struct *vma, *prev = NULL;
 	unsigned long flags;
-	struct rb_node ** rb_link, * rb_parent;
+	struct rb_node **rb_link = NULL, *rb_parent = NULL;
 	pgoff_t pgoff = addr >> PAGE_SHIFT;
 	int error;
 
@@ -2081,8 +2081,8 @@ void exit_mmap(struct mm_struct *mm)
  */
 int insert_vm_struct(struct mm_struct * mm, struct vm_area_struct * vma)
 {
-	struct vm_area_struct * __vma, * prev;
-	struct rb_node ** rb_link, * rb_parent;
+	struct vm_area_struct *__vma, *prev = NULL;
+	struct rb_node **rb_link = NULL, *rb_parent = NULL;
 
 	/*
 	 * The vm_pgoff of a purely anonymous vma should be irrelevant
@@ -2120,8 +2120,8 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	struct vm_area_struct *vma = *vmap;
 	unsigned long vma_start = vma->vm_start;
 	struct mm_struct *mm = vma->vm_mm;
-	struct vm_area_struct *new_vma, *prev;
-	struct rb_node **rb_link, *rb_parent;
+	struct vm_area_struct *new_vma, *prev = NULL;
+	struct rb_node **rb_link = NULL, *rb_parent = NULL;
 	struct mempolicy *pol;
 
 	/*


