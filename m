From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 20 Dec 2006 21:09:07 +0000
Subject: [KJ] [RFC][PATCH] does this patch look remotely sane?
Message-Id: <Pine.LNX.4.64.0612201607010.6547@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  followup to my previous question, if that equivalence holds, does
this patch look like it would make sense?

 arch/frv/mm/pgalloc.c               |    4 ++--
 arch/i386/mm/pageattr.c             |    2 +-
 arch/i386/mm/pgtable.c              |    4 ++--
 arch/powerpc/mm/pgtable_32.c        |    2 +-
 arch/ppc/mm/pgtable.c               |    2 +-
 arch/sparc64/mm/init.c              |    2 +-
 arch/x86_64/mm/pageattr.c           |    2 +-
 arch/xtensa/mm/init.c               |    2 +-
 include/asm-arm/pgalloc.h           |    2 +-
 include/asm-avr32/pgalloc.h         |    2 +-
 include/asm-cris/pgalloc.h          |    2 +-
 include/asm-m68k/motorola_pgalloc.h |    2 +-
 include/asm-m68k/sun3_pgalloc.h     |    2 +-
 include/asm-sh64/pgalloc.h          |    2 +-
 include/linux/pagemap.h             |    2 +-
 include/net/sock.h                  |    2 +-
 kernel/kexec.c                      |    2 +-
 mm/filemap.c                        |    2 +-
 mm/page_alloc.c                     |    2 +-
 net/core/pktgen.c                   |    4 ++--
 net/core/skbuff.c                   |    2 +-
 net/core/sock.c                     |    2 +-
 net/ipv4/ip_output.c                |    2 +-
 net/ipv6/ip6_output.c               |    2 +-
 24 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/frv/mm/pgalloc.c b/arch/frv/mm/pgalloc.c
index 19b13be..9a06a8d 100644
--- a/arch/frv/mm/pgalloc.c
+++ b/arch/frv/mm/pgalloc.c
@@ -33,9 +33,9 @@ struct page *pte_alloc_one(struct mm_struct *mm, unsigned long address)
 	struct page *page;

 #ifdef CONFIG_HIGHPTE
-	page = alloc_pages(GFP_KERNEL|__GFP_HIGHMEM|__GFP_REPEAT, 0);
+	page = alloc_page(GFP_KERNEL|__GFP_HIGHMEM|__GFP_REPEAT);
 #else
-	page = alloc_pages(GFP_KERNEL|__GFP_REPEAT, 0);
+	page = alloc_page(GFP_KERNEL|__GFP_REPEAT);
 #endif
 	if (page)
 		clear_highpage(page);
diff --git a/arch/i386/mm/pageattr.c b/arch/i386/mm/pageattr.c
index ad91528..dfec242 100644
--- a/arch/i386/mm/pageattr.c
+++ b/arch/i386/mm/pageattr.c
@@ -45,7 +45,7 @@ static struct page *split_large_page(unsigned long address, pgprot_t prot,
 	pte_t *pbase;

 	spin_unlock_irq(&cpa_lock);
-	base = alloc_pages(GFP_KERNEL, 0);
+	base = alloc_page(GFP_KERNEL);
 	spin_lock_irq(&cpa_lock);
 	if (!base)
 		return NULL;
diff --git a/arch/i386/mm/pgtable.c b/arch/i386/mm/pgtable.c
index f349eaf..c015abb 100644
--- a/arch/i386/mm/pgtable.c
+++ b/arch/i386/mm/pgtable.c
@@ -189,9 +189,9 @@ struct page *pte_alloc_one(struct mm_struct *mm, unsigned long address)
 	struct page *pte;

 #ifdef CONFIG_HIGHPTE
-	pte = alloc_pages(GFP_KERNEL|__GFP_HIGHMEM|__GFP_REPEAT|__GFP_ZERO, 0);
+	pte = alloc_page(GFP_KERNEL|__GFP_HIGHMEM|__GFP_REPEAT|__GFP_ZERO);
 #else
-	pte = alloc_pages(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO, 0);
+	pte = alloc_page(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO);
 #endif
 	return pte;
 }
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 1891dbe..9e418f7 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -119,7 +119,7 @@ struct page *pte_alloc_one(struct mm_struct *mm, unsigned long address)
 	gfp_t flags = GFP_KERNEL | __GFP_REPEAT;
 #endif

-	ptepage = alloc_pages(flags, 0);
+	ptepage = alloc_page(flags);
 	if (ptepage)
 		clear_highpage(ptepage);
 	return ptepage;
diff --git a/arch/ppc/mm/pgtable.c b/arch/ppc/mm/pgtable.c
index 354a940..376bd84 100644
--- a/arch/ppc/mm/pgtable.c
+++ b/arch/ppc/mm/pgtable.c
@@ -118,7 +118,7 @@ struct page *pte_alloc_one(struct mm_struct *mm, unsigned long address)
 	gfp_t flags = GFP_KERNEL | __GFP_REPEAT;
 #endif

-	ptepage = alloc_pages(flags, 0);
+	ptepage = alloc_page(flags);
 	if (ptepage)
 		clear_highpage(ptepage);
 	return ptepage;
diff --git a/arch/sparc64/mm/init.c b/arch/sparc64/mm/init.c
index a8e8802..34cc83b 100644
--- a/arch/sparc64/mm/init.c
+++ b/arch/sparc64/mm/init.c
@@ -1478,7 +1478,7 @@ void __init mem_init(void)
 	 * Set up the zero page, mark it reserved, so that page count
 	 * is not manipulated when freeing the page from user ptes.
 	 */
-	mem_map_zero = alloc_pages(GFP_KERNEL|__GFP_ZERO, 0);
+	mem_map_zero = alloc_page(GFP_KERNEL|__GFP_ZERO);
 	if (mem_map_zero = NULL) {
 		prom_printf("paging_init: Cannot alloc zero page.\n");
 		prom_halt();
diff --git a/arch/x86_64/mm/pageattr.c b/arch/x86_64/mm/pageattr.c
index ccb91dd..d967902 100644
--- a/arch/x86_64/mm/pageattr.c
+++ b/arch/x86_64/mm/pageattr.c
@@ -40,7 +40,7 @@ static struct page *split_large_page(unsigned long address, pgprot_t prot,
 {
 	int i;
 	unsigned long addr;
-	struct page *base = alloc_pages(GFP_KERNEL, 0);
+	struct page *base = alloc_page(GFP_KERNEL);
 	pte_t *pbase;
 	if (!base)
 		return NULL;
diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index e1ec2d1..0542ba1 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -491,7 +491,7 @@ struct page* pte_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
 	struct page *page;

-	page = alloc_pages(GFP_KERNEL | __GFP_REPEAT, 0);
+	page = alloc_page(GFP_KERNEL | __GFP_REPEAT);

 	if (likely(page)) {
 		pte_t* ptep = kmap_atomic(page, KM_USER0);
diff --git a/include/asm-arm/pgalloc.h b/include/asm-arm/pgalloc.h
index 4d43945..0555e43 100644
--- a/include/asm-arm/pgalloc.h
+++ b/include/asm-arm/pgalloc.h
@@ -71,7 +71,7 @@ pte_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
 	struct page *pte;

-	pte = alloc_pages(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO, 0);
+	pte = alloc_page(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO);
 	if (pte) {
 		void *page = page_address(pte);
 		clean_dcache_area(page, sizeof(pte_t) * PTRS_PER_PTE);
diff --git a/include/asm-avr32/pgalloc.h b/include/asm-avr32/pgalloc.h
index bb82e70..d052501 100644
--- a/include/asm-avr32/pgalloc.h
+++ b/include/asm-avr32/pgalloc.h
@@ -67,7 +67,7 @@ static inline struct page *pte_alloc_one(struct mm_struct *mm,
 	struct page *pte;

 	do {
-		pte = alloc_pages(GFP_KERNEL, 0);
+		pte = alloc_page(GFP_KERNEL);
 		if (pte)
 			clear_page(page_address(pte));
 		else {
diff --git a/include/asm-cris/pgalloc.h b/include/asm-cris/pgalloc.h
index deaddfe..6766378 100644
--- a/include/asm-cris/pgalloc.h
+++ b/include/asm-cris/pgalloc.h
@@ -30,7 +30,7 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm, unsigned long ad
 static inline struct page *pte_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	struct page *pte;
-	pte = alloc_pages(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO, 0);
+	pte = alloc_page(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO);
 	return pte;
 }

diff --git a/include/asm-m68k/motorola_pgalloc.h b/include/asm-m68k/motorola_pgalloc.h
index 5158412..1d0389d 100644
--- a/include/asm-m68k/motorola_pgalloc.h
+++ b/include/asm-m68k/motorola_pgalloc.h
@@ -30,7 +30,7 @@ static inline void pte_free_kernel(pte_t *pte)

 static inline struct page *pte_alloc_one(struct mm_struct *mm, unsigned long address)
 {
-	struct page *page = alloc_pages(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO, 0);
+	struct page *page = alloc_page(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO);
 	pte_t *pte;

 	if(!page)
diff --git a/include/asm-m68k/sun3_pgalloc.h b/include/asm-m68k/sun3_pgalloc.h
index fd82411..3ef58bc 100644
--- a/include/asm-m68k/sun3_pgalloc.h
+++ b/include/asm-m68k/sun3_pgalloc.h
@@ -48,7 +48,7 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm,
 static inline struct page *pte_alloc_one(struct mm_struct *mm,
 					 unsigned long address)
 {
-        struct page *page = alloc_pages(GFP_KERNEL|__GFP_REPEAT, 0);
+        struct page *page = alloc_page(GFP_KERNEL|__GFP_REPEAT);

 	if (page = NULL)
 		return NULL;
diff --git a/include/asm-sh64/pgalloc.h b/include/asm-sh64/pgalloc.h
index cb803e5..e25111b 100644
--- a/include/asm-sh64/pgalloc.h
+++ b/include/asm-sh64/pgalloc.h
@@ -120,7 +120,7 @@ static inline struct page *pte_alloc_one(struct mm_struct *mm, unsigned long add
 {
 	struct page *pte;

-	pte = alloc_pages(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO, 0);
+	pte = alloc_page(GFP_KERNEL|__GFP_REPEAT|__GFP_ZERO);

 	return pte;
 }
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index c3e255b..acdb147 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -56,7 +56,7 @@ extern struct page *__page_cache_alloc(gfp_t gfp);
 #else
 static inline struct page *__page_cache_alloc(gfp_t gfp)
 {
-	return alloc_pages(gfp, 0);
+	return alloc_page(gfp);
 }
 #endif

diff --git a/include/net/sock.h b/include/net/sock.h
index 03684e7..0a84cd3 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -1248,7 +1248,7 @@ static inline struct page *sk_stream_alloc_page(struct sock *sk)
 {
 	struct page *page = NULL;

-	page = alloc_pages(sk->sk_allocation, 0);
+	page = alloc_page(sk->sk_allocation);
 	if (!page) {
 		sk->sk_prot->enter_memory_pressure();
 		sk_stream_moderate_sndbuf(sk);
diff --git a/kernel/kexec.c b/kernel/kexec.c
index 2a59c8a..c03b24b 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -698,7 +698,7 @@ static struct page *kimage_alloc_page(struct kimage *image,
 		kimage_entry_t *old;

 		/* Allocate a page, if we run out of memory give up */
-		page = kimage_alloc_pages(gfp_mask, 0);
+		page = kimage_alloc_page(gfp_mask);
 		if (!page)
 			return NULL;
 		/* If the page cannot be used file it away */
diff --git a/mm/filemap.c b/mm/filemap.c
index 8332c77..09515d2 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -473,7 +473,7 @@ struct page *__page_cache_alloc(gfp_t gfp)
 		int n = cpuset_mem_spread_node();
 		return alloc_pages_node(n, gfp, 0);
 	}
-	return alloc_pages(gfp, 0);
+	return alloc_page(gfp);
 }
 EXPORT_SYMBOL(__page_cache_alloc);
 #endif
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 8c1a116..59fe076 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1399,7 +1399,7 @@ fastcall unsigned long get_zeroed_page(gfp_t gfp_mask)
 	 */
 	VM_BUG_ON((gfp_mask & __GFP_HIGHMEM) != 0);

-	page = alloc_pages(gfp_mask | __GFP_ZERO, 0);
+	page = alloc_page(gfp_mask | __GFP_ZERO);
 	if (page)
 		return (unsigned long) page_address(page);
 	return 0;
diff --git a/net/core/pktgen.c b/net/core/pktgen.c
index 1897a3a..72c06e3 100644
--- a/net/core/pktgen.c
+++ b/net/core/pktgen.c
@@ -2423,7 +2423,7 @@ static struct sk_buff *fill_packet_ipv4(struct net_device *odev,

 		i = 0;
 		while (datalen > 0) {
-			struct page *page = alloc_pages(GFP_KERNEL, 0);
+			struct page *page = alloc_page(GFP_KERNEL);
 			skb_shinfo(skb)->frags[i].page = page;
 			skb_shinfo(skb)->frags[i].page_offset = 0;
 			skb_shinfo(skb)->frags[i].size @@ -2768,7 +2768,7 @@ static struct sk_buff *fill_packet_ipv6(struct net_device *odev,

 		i = 0;
 		while (datalen > 0) {
-			struct page *page = alloc_pages(GFP_KERNEL, 0);
+			struct page *page = alloc_page(GFP_KERNEL);
 			skb_shinfo(skb)->frags[i].page = page;
 			skb_shinfo(skb)->frags[i].page_offset = 0;
 			skb_shinfo(skb)->frags[i].size diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index de7801d..26d70d0 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1854,7 +1854,7 @@ int skb_append_datato_frags(struct sock *sk, struct sk_buff *skb,
 			return -EFAULT;

 		/* allocate a new page for next frag */
-		page = alloc_pages(sk->sk_allocation, 0);
+		page = alloc_page(sk->sk_allocation);

 		/* If alloc_page fails just return failure and caller will
 		 * free previous allocated pages by doing kfree_skb()
diff --git a/net/core/sock.c b/net/core/sock.c
index 0ed5b4f..d1a9c73 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1167,7 +1167,7 @@ static struct sk_buff *sock_alloc_send_pskb(struct sock *sk,
 					struct page *page;
 					skb_frag_t *frag;

-					page = alloc_pages(sk->sk_allocation, 0);
+					page = alloc_page(sk->sk_allocation);
 					if (!page) {
 						err = -ENOBUFS;
 						skb_shinfo(skb)->nr_frags = i;
diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index f071f84..d88eacc 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -998,7 +998,7 @@ alloc_new_skb:
 			} else if (i < MAX_SKB_FRAGS) {
 				if (copy > PAGE_SIZE)
 					copy = PAGE_SIZE;
-				page = alloc_pages(sk->sk_allocation, 0);
+				page = alloc_page(sk->sk_allocation);
 				if (page = NULL)  {
 					err = -ENOMEM;
 					goto error;
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 7b7bd44..475998f 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1234,7 +1234,7 @@ alloc_new_skb:
 			} else if(i < MAX_SKB_FRAGS) {
 				if (copy > PAGE_SIZE)
 					copy = PAGE_SIZE;
-				page = alloc_pages(sk->sk_allocation, 0);
+				page = alloc_page(sk->sk_allocation);
 				if (page = NULL) {
 					err = -ENOMEM;
 					goto error;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
