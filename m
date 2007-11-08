From: Jiri Olsa <olsajiri@gmail.com>
Date: Thu, 08 Nov 2007 17:17:45 +0000
Subject: [PATCH] SH - remove dead config symbol from SH code
Message-Id: <473344B9.1010302@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

remove dead config symbols from SH code
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>

---
 include/asm-sh/cpu-sh3/timer.h |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/asm-sh/cpu-sh3/timer.h b/include/asm-sh/cpu-sh3/timer.h
index 3880ce0..7b795ac 100644
--- a/include/asm-sh/cpu-sh3/timer.h
+++ b/include/asm-sh/cpu-sh3/timer.h
@@ -23,8 +23,7 @@
  * ---------------------------------------------------------------------------
  */
 
-#if  !defined(CONFIG_CPU_SUBTYPE_SH7720) && \
-     !defined(CONFIG_CPU_SUBTYPE_SH7727)
+#if  !defined(CONFIG_CPU_SUBTYPE_SH7720)
 #define TMU_TOCR	0xfffffe90	/* Byte access */
 #endif
 
@@ -58,8 +57,7 @@
 #define TMU2_TCOR	0xfffffeac	/* Long access */
 #define TMU2_TCNT	0xfffffeb0	/* Long access */
 #define TMU2_TCR	0xfffffeb4	/* Word access */
-#if !defined(CONFIG_CPU_SUBTYPE_SH7720) && \
-    !defined(CONFIG_CPU_SUBTYPE_SH7727)
+#if !defined(CONFIG_CPU_SUBTYPE_SH7720)
 #define TMU2_TCPR2	0xfffffeb8	/* Long access */
 #endif
 #endif
