From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 19:18:33 +0000
Subject: [PATCH 52] include/asm-m32r/thread_info.h: kmalloc + memset conversion to kzalloc
Message-Id: <200707312118.34417.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, takata@linux-m32r.org, linux-m32r@ml.linux-m32r.org

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 include/asm-m32r/thread_info.h |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/include/asm-m32r/thread_info.h	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/include/asm-m32r/thread_info.h	2007-07-31 15:08:17.000000000 +0200
@@ -100,9 +100,8 @@ static inline struct thread_info *curren
 	({							\
 		struct thread_info *ret;			\
 	 							\
-	 	ret = kmalloc(THREAD_SIZE, GFP_KERNEL);		\
-	 	if (ret)					\
-	 		memset(ret, 0, THREAD_SIZE);		\
+	 	ret = kzalloc(THREAD_SIZE, GFP_KERNEL);		\
+								\
 	 	ret;						\
 	 })
 #else
