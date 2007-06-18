From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 18 Jun 2007 20:07:33 +0000
Subject: [KJ] [PATCH] Comment the endif's in highmem.h to make the logic
Message-Id: <Pine.LNX.4.64.0706181606300.6427@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 98e2cce..8d3626e 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -11,13 +11,13 @@
 static inline void flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
 {
 }
-#endif
+#endif /* !ARCH_HAS_FLUSH_ANON_PAGE */

 #ifndef ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
 static inline void flush_kernel_dcache_page(struct page *page)
 {
 }
-#endif
+#endif /* !ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE */

 #ifdef CONFIG_HIGHMEM

@@ -58,7 +58,7 @@ static inline void *kmap_atomic(struct page *page, enum km_type idx)
 #define kmap_atomic_to_page(ptr)	virt_to_page(ptr)

 #define kmap_flush_unused()	do {} while(0)
-#endif
+#endif /* !ARCH_HAS_KMAP */

 #endif /* CONFIG_HIGHMEM */

@@ -83,7 +83,7 @@ alloc_zeroed_user_highpage(struct vm_area_struct *vma, unsigned long vaddr)

 	return page;
 }
-#endif
+#endif /* !__HAVE_ARCH_ALLOC_ZEROED_USER_HIGHPAGE */

 static inline void clear_highpage(struct page *page)
 {
@@ -132,7 +132,7 @@ static inline void copy_user_highpage(struct page *to, struct page *from,
 	smp_wmb();
 }

-#endif
+#endif /* !__HAVE_ARCH_COPY_USER_HIGHPAGE */

 static inline void copy_highpage(struct page *to, struct page *from)
 {
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
