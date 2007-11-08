From: Jiri Olsa <olsajiri@gmail.com>
Date: Thu, 08 Nov 2007 11:29:38 +0000
Subject: [PATCH] M32R - remove dead config symbols from M32R code
Message-Id: <4732F322.8040008@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

remove dead config symbols from M32R code
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>

---
 arch/m32r/boot/compressed/m32r_sio.c     |    4 ++--
 include/asm-m32r/irq.h                   |    2 +-
 include/asm-m32r/m32700ut/m32700ut_pld.h |    4 +---
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/m32r/boot/compressed/m32r_sio.c b/arch/m32r/boot/compressed/m32r_sio.c
index ee3c8be..01d877c 100644
--- a/arch/m32r/boot/compressed/m32r_sio.c
+++ b/arch/m32r/boot/compressed/m32r_sio.c
@@ -17,7 +17,7 @@ static int puts(const char *s)
 	return 0;
 }
 
-#if defined(CONFIG_PLAT_M32700UT_Alpha) || defined(CONFIG_PLAT_M32700UT) || defined(CONFIG_PLAT_OPSPUT)
+#if defined(CONFIG_PLAT_M32700UT) || defined(CONFIG_PLAT_OPSPUT)
 #include <asm/m32r.h>
 #include <asm/io.h>
 
@@ -52,7 +52,7 @@ static void putc(char c)
 	}
 	*BOOT_SIO0TXB = c;
 }
-#else /* !(CONFIG_PLAT_M32700UT_Alpha) && !(CONFIG_PLAT_M32700UT) */
+#else /* !(CONFIG_PLAT_M32700UT) */
 #if defined(CONFIG_PLAT_MAPPI2)
 #define SIO0STS	(volatile unsigned short *)(0xa0efd000 + 14)
 #define SIO0TXB	(volatile unsigned short *)(0xa0efd000 + 30)
diff --git a/include/asm-m32r/irq.h b/include/asm-m32r/irq.h
index 2f93f47..242028b 100644
--- a/include/asm-m32r/irq.h
+++ b/include/asm-m32r/irq.h
@@ -3,7 +3,7 @@
 #define _ASM_M32R_IRQ_H
 
 
-#if defined(CONFIG_PLAT_M32700UT_Alpha) || defined(CONFIG_PLAT_USRV)
+#if defined(CONFIG_PLAT_USRV)
 /*
  * IRQ definitions for M32700UT
  *  M32700 Chip: 64 interrupts
diff --git a/include/asm-m32r/m32700ut/m32700ut_pld.h b/include/asm-m32r/m32700ut/m32700ut_pld.h
index d391212..57623be 100644
--- a/include/asm-m32r/m32700ut/m32700ut_pld.h
+++ b/include/asm-m32r/m32700ut/m32700ut_pld.h
@@ -13,9 +13,7 @@
  * this archive for more details.
  */
 
-#if defined(CONFIG_PLAT_M32700UT_Alpha)
-#define PLD_PLAT_BASE		0x08c00000
-#elif defined(CONFIG_PLAT_M32700UT) || defined(CONFIG_PLAT_USRV)
+#if defined(CONFIG_PLAT_M32700UT) || defined(CONFIG_PLAT_USRV)
 #define PLD_PLAT_BASE		0x04c00000
 #else
 #error "no platform configuration"
