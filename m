From: Shani Moideen <shani.moideen@wipro.com>
Date: Tue, 08 May 2007 10:57:56 +0000
Subject: [KJ] [KJ PATCH] Replacing memset(<addr>, 0,
Message-Id: <1178621156.3598.10.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Hi,

Replacing memset(<addr>,0,PAGE_SIZE) with clear_page() in mm/memory.c.

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

thanks.


diff --git a/mm/memory.c b/mm/memory.c
index e7066e7..2780d07 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1505,7 +1505,7 @@ static inline void cow_user_page(struct page *dst, struct page *src, unsigned lo
                 * zeroes.
                 */
                if (__copy_from_user_inatomic(kaddr, uaddr, PAGE_SIZE))
-                       memset(kaddr, 0, PAGE_SIZE);
+                       clear_page(kaddr);
                kunmap_atomic(kaddr, KM_USER0);
                flush_dcache_page(dst);
                return;


-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
