From: Shani Moideen <shani.moideen@wipro.com>
Date: Tue, 12 Jun 2007 03:28:14 +0000
Subject: [KJ] [KJ PATCH] Replacing memcpy(dest,src,PAGE_SIZE) with
Message-Id: <1181618174.2282.16.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181616342.2282.8.camel@shani-win>
In-Reply-To: <1181616342.2282.8.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Hi,
Replacing memcpy(dest,src,PAGE_SIZE) with copy_page(dest,src) in arch/i386/mm/init.c.

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----


diff --git a/arch/i386/mm/init.c b/arch/i386/mm/init.c
index ae43688..7dc3d46 100644
--- a/arch/i386/mm/init.c
+++ b/arch/i386/mm/init.c
@@ -397,7 +397,7 @@ char __nosavedata swsusp_pg_dir[PAGE_SIZE]
 
 static inline void save_pg_dir(void)
 {
-	memcpy(swsusp_pg_dir, swapper_pg_dir, PAGE_SIZE);
+	copy_page(swsusp_pg_dir, swapper_pg_dir);
 }
 #else
 static inline void save_pg_dir(void)

-- 
Regards,
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
