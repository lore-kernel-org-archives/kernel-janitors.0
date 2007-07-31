From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:40:38 +0000
Subject: [PATCH 24] include/asm-frv/thread_info.h: kmalloc + memset conversion to kzalloc
Message-Id: <200707311940.38742.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, dhowells@redhat.com

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 include/asm-frv/thread_info.h |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/include/asm-frv/thread_info.h	2007-07-26 13:07:40.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/include/asm-frv/thread_info.h	2007-07-31 15:06:07.000000000 +0200
@@ -88,9 +88,8 @@ register struct thread_info *__current_t
 	({							\
 		struct thread_info *ret;			\
 								\
-		ret = kmalloc(THREAD_SIZE, GFP_KERNEL);		\
-		if (ret)					\
-			memset(ret, 0, THREAD_SIZE);		\
+		ret = kzalloc(THREAD_SIZE, GFP_KERNEL);		\
+								\
 		ret;						\
 	})
 #else
