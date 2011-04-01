From: Maksym Planeta <mcsim.planeta@gmail.com>
Date: Fri, 01 Apr 2011 19:18:13 +0000
Subject: [PATCH] page: get_order() optimization
Message-Id: <1301685493-2567-1-git-send-email-mcsim.planeta@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mingo@redhat.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, hpa@zytor.com, Maksym Planeta <mcsim.planeta@gmail.com>

Loop was repalaced with __builtin_clz(). This still allows to precompute
constants, but on some architectures it uses special instruction to
calculate order.

Signed-off-by: Maksym Planeta <mcsim.planeta@gmail.com>
---
 include/asm-generic/getorder.h |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/asm-generic/getorder.h b/include/asm-generic/getorder.h
index 67e7245..fe8020c 100644
--- a/include/asm-generic/getorder.h
+++ b/include/asm-generic/getorder.h
@@ -11,11 +11,9 @@ static inline __attribute_const__ int get_order(unsigned long size)
 	int order;
 
 	size = (size - 1) >> (PAGE_SHIFT - 1);
-	order = -1;
-	do {
-		size >>= 1;
-		order++;
-	} while (size);
+	order = (__builtin_clzl(size) ^ (BITS_PER_LONG - 1));
+	if (size = 0)
+		order = 0;
 	return order;
 }
 
-- 
1.7.2.3

