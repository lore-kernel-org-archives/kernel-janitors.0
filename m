From: Shani Moideen <shani.moideen@wipro.com>
Date: Wed, 09 May 2007 12:09:19 +0000
Subject: [KJ] [KJ PATCH] Replacing alloc_pages(gfp,
Message-Id: <1178711839.2280.21.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Hi,
 
Replacing alloc_pages(gfp,0) with alloc_page(gfp) in
arch/i386/mm/pageattr.c.

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/arch/i386/mm/pageattr.c b/arch/i386/mm/pageattr.c
index 412ebbd..12f7f14 100644
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


-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
