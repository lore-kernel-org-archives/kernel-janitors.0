From: rodrigosiqueira <rodrigosiqueiramelo@gmail.com>
Date: Wed, 24 Jan 2018 19:07:25 +0000
Subject: [PATCH] byteorder: silence warning by use the proper type
Message-Id: <20180124190725.4rj5yban2heqd65r@smtp.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mika.westerberg@linux.intel.com
Cc: michael.jamet@intel.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This patch fixes the GCC warning:

warning: comparison between signed and unsigned integer expressions
[-Wsign-compare]
  for (i = 0; i < len; i++)
                ^

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 include/linux/byteorder/generic.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/byteorder/generic.h b/include/linux/byteorder/generic.h
index 451aaa0786ae..4e297a6376d3 100644
--- a/include/linux/byteorder/generic.h
+++ b/include/linux/byteorder/generic.h
@@ -173,7 +173,7 @@ static inline void be64_add_cpu(__be64 *var, u64 val)
 
 static inline void cpu_to_be32_array(__be32 *dst, const u32 *src, size_t len)
 {
-	int i;
+	size_t i;
 
 	for (i = 0; i < len; i++)
 		dst[i] = cpu_to_be32(src[i]);
@@ -181,7 +181,7 @@ static inline void cpu_to_be32_array(__be32 *dst, const u32 *src, size_t len)
 
 static inline void be32_to_cpu_array(u32 *dst, const __be32 *src, size_t len)
 {
-	int i;
+	size_t i;
 
 	for (i = 0; i < len; i++)
 		dst[i] = be32_to_cpu(src[i]);
-- 
2.16.1

