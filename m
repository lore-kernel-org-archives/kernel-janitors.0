From: Jiri Olsa <olsajiri@gmail.com>
Date: Thu, 08 Nov 2007 15:08:24 +0000
Subject: [PATCH] FRV - remove dead config symbol from FRV code
Message-Id: <47332668.7060301@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

remove dead config symbol from FRV code
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>

---
 include/asm-frv/page.h |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/include/asm-frv/page.h b/include/asm-frv/page.h
index 213d92f..bd9bd2d 100644
--- a/include/asm-frv/page.h
+++ b/include/asm-frv/page.h
@@ -76,10 +76,6 @@ extern unsigned long max_pfn;
 
 #endif /* __ASSEMBLY__ */
 
-#ifdef CONFIG_CONTIGUOUS_PAGE_ALLOC
-#define WANT_PAGE_VIRTUAL	1
-#endif
-
 #include <asm-generic/memory_model.h>
 #include <asm-generic/page.h>
 
