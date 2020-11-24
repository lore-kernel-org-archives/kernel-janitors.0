From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 24 Nov 2020 10:40:30 +0000
Subject: [PATCH] zlib: define get_unaligned16() only when used
Message-Id: <20201124104030.903-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Since commit acaab7335bd6 ("lib/zlib: remove outdated and incorrect
pre-increment optimization"), get_unaligned16() is only used when
!CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS.

Hence, make CC=clang W=1 warns:

  lib/zlib_inflate/inffast.c:20:1:
    warning: unused function 'get_unaligned16' [-Wunused-function]

Define get_unaligned16() only when it is actually used.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201124

Jann, please ack.
Andrew, please pick this minor non-urgent clean-up patch.

 lib/zlib_inflate/inffast.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/zlib_inflate/inffast.c b/lib/zlib_inflate/inffast.c
index ed1f3df27260..ca66d9008228 100644
--- a/lib/zlib_inflate/inffast.c
+++ b/lib/zlib_inflate/inffast.c
@@ -15,7 +15,8 @@ union uu {
 	unsigned char b[2];
 };
 
-/* Endian independed version */
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+/* Endian independent version */
 static inline unsigned short
 get_unaligned16(const unsigned short *p)
 {
@@ -26,6 +27,7 @@ get_unaligned16(const unsigned short *p)
 	mm.b[1] = b[1];
 	return mm.us;
 }
+#endif
 
 /*
    Decode literal, length, and distance codes and write out the resulting
-- 
2.17.1
