From: Xishi Qiu <qiuxishi@gmail.com>
Date: Mon, 15 Oct 2012 06:44:13 +0000
Subject: Re: WARNING: vmlinux.o(.meminit.text+0x1228): Section mismatch in reference from the function .free_
Message-Id: <507BB0BD.2040002@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121014104243.GB10836@localhost>
In-Reply-To: <20121014104243.GB10836@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi，Fengguang and Yuanhan，thank you for your test, I find the reason
which causes that warnings.

set_page_block_order() is called by free_area_init_core() and sparse_init(),
But free_area_init_core() is defined as __paginginit, sparse_init() and
set_page_block_order() are defined as __init.

#ifdef CONFIG_SPARSEMEM
#define __paginginit __meminit
#else
#define __paginginit __init
#endif

So if we config sparse memory and memory hotplug, when hot add a new
pgdat, free_area_init_core() will call set_page_block_order(), but
set_page_block_order() already has been released.

Here is the new patch, just use __paginginit instead of __init.

Thanks
Xishi Qiu

Signed-off-by: Xishi Qiu <qiuxishi@huawei.com>
---
 mm/internal.h   |    2 ++
 mm/page_alloc.c |    4 ++--
 mm/sparse.c     |    3 +++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff -puN mm/internal.h~mm-setup-pageblock_order-before-its-used-by-sparsemem mm/internal.h
--- a/mm/internal.h~mm-setup-pageblock_order-before-its-used-by-sparsemem
+++ a/mm/internal.h
@@ -349,3 +349,5 @@ extern u32 hwpoison_filter_enable;
 extern unsigned long vm_mmap_pgoff(struct file *, unsigned long,
         unsigned long, unsigned long,
         unsigned long, unsigned long);
+
+extern void set_pageblock_order(void);
diff -puN mm/page_alloc.c~mm-setup-pageblock_order-before-its-used-by-sparsemem mm/page_alloc.c
--- a/mm/page_alloc.c~mm-setup-pageblock_order-before-its-used-by-sparsemem
+++ a/mm/page_alloc.c
@@ -4303,7 +4303,7 @@ static inline void setup_usemap(struct p
 #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE

 /* Initialise the number of pages represented by NR_PAGEBLOCK_BITS */
-static inline void __init set_pageblock_order(void)
+void __paginginit set_pageblock_order(void)
 {
 	unsigned int order;

@@ -4331,7 +4331,7 @@ static inline void __init set_pageblock_
  * include/linux/pageblock-flags.h for the values of pageblock_order based on
  * the kernel config
  */
-static inline void set_pageblock_order(void)
+void __paginginit set_pageblock_order(void)
 {
 }

diff -puN mm/sparse.c~mm-setup-pageblock_order-before-its-used-by-sparsemem mm/sparse.c
--- a/mm/sparse.c~mm-setup-pageblock_order-before-its-used-by-sparsemem
+++ a/mm/sparse.c
@@ -495,6 +495,9 @@ void __init sparse_init(void)
 	struct page **map_map;
 #endif

+	/* Setup pageblock_order for HUGETLB_PAGE_SIZE_VARIABLE */
+	set_pageblock_order();
+
 	/*
 	 * map is using big page (aka 2M in x86 64 bit)
 	 * usemap is less one page (aka 24 bytes)


On 2012/10/14 18:42, Fengguang Wu wrote:

> Hi Xishi,
>
> FYI, there are new compile warnings show up in
>
> commit: ca57df79d4f64e1a4886606af4289d40636189c5  mm: setup pageblock_order before it's used by sparsemem
> config: powerpc-allyesconfig # make ARCH=powerpc allyesconfig
>
> All warnings:
>
> WARNING: vmlinux.o(.meminit.text+0x1228): Section mismatch in reference from the function .free_area_init_core.isra.34() to the function .init.text:.set_pageblock_order()
> The function __meminit .free_area_init_core.isra.34() references
> a function __init .set_pageblock_order().
> If .set_pageblock_order is only used by .free_area_init_core.isra.34 then
> annotate .set_pageblock_order with a matching annotation.
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
>
>


