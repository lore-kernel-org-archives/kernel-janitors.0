From: Shani Moideen <shani.moideen@wipro.com>
Date: Wed, 09 May 2007 12:12:41 +0000
Subject: [KJ] [KJ PATCH] Replacing alloc_pages(gfp,
Message-Id: <1178712041.2280.25.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178711839.2280.21.camel@shani-win>
In-Reply-To: <1178711839.2280.21.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Hi,
 
Replacing alloc_pages(gfp,0) with alloc_page(gfp) in
arch/i386/mm/pgtable.c.

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/arch/i386/mm/pgtable.c b/arch/i386/mm/pgtable.c
index fa0cfbd..5d2b0fb 100644
--- a/arch/i386/mm/pgtable.c
+++ b/arch/i386/mm/pgtable.c
@@ -191,9 +191,9 @@ struct page *pte_alloc_one(struct mm_struct *mm, unsigned long address)
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

-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
