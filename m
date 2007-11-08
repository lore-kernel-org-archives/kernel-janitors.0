From: Jiri Olsa <olsajiri@gmail.com>
Date: Thu, 08 Nov 2007 11:54:07 +0000
Subject: [PATCH] m68knomu: remove dead config symbols from m68knomu code
Message-Id: <4732F8DF.6020501@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

remove dead config symbols from m68knommu code
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>

---
 arch/m68knommu/kernel/setup.c    |    3 ---
 include/asm-m68knommu/mcfne.h    |   27 ---------------------------
 include/asm-m68knommu/mcfsim.h   |    4 +---
 include/asm-m68knommu/mcftimer.h |    2 +-
 include/asm-m68knommu/mcfuart.h  |    2 +-
 include/asm-m68knommu/system.h   |   17 -----------------
 6 files changed, 3 insertions(+), 52 deletions(-)

diff --git a/arch/m68knommu/kernel/setup.c b/arch/m68knommu/kernel/setup.c
index 332345d..81507c5 100644
--- a/arch/m68knommu/kernel/setup.c
+++ b/arch/m68knommu/kernel/setup.c
@@ -64,9 +64,6 @@ void (*mach_power_off)(void);
 #ifdef CONFIG_M68VZ328
 	#define CPU "MC68VZ328"
 #endif
-#ifdef CONFIG_M68332
-	#define CPU "MC68332"
-#endif
 #ifdef CONFIG_M68360
 	#define CPU "MC68360"
 #endif
diff --git a/include/asm-m68knommu/mcfne.h b/include/asm-m68knommu/mcfne.h
index c920ccd..431f63a 100644
--- a/include/asm-m68knommu/mcfne.h
+++ b/include/asm-m68knommu/mcfne.h
@@ -60,17 +60,6 @@
 #define	NE2000_BYTE		volatile unsigned char
 #endif
 
-#if defined(CONFIG_CFV240)
-#define NE2000_ADDR             0x40010000
-#define NE2000_ADDR1            0x40010001
-#define NE2000_ODDOFFSET        0x00000000
-#define NE2000_IRQ              1
-#define NE2000_IRQ_VECTOR       0x19
-#define NE2000_IRQ_PRIORITY     2
-#define NE2000_IRQ_LEVEL        1
-#define	NE2000_BYTE		volatile unsigned char
-#endif
-
 #if defined(CONFIG_M5307C3)
 #define NE2000_ADDR		0x40000300
 #define NE2000_ODDOFFSET	0x00010000
@@ -173,13 +162,8 @@ void ne2000_outsw(unsigned int addr, void *vbuf, unsigned long len);
  *	On most NE2000 implementations on ColdFire boards the chip is
  *	mapped in kinda funny, due to its ISA heritage.
  */
-#ifdef CONFIG_CFV240
-#define NE2000_PTR(addr)	(NE2000_ADDR + ((addr & 0x3f) << 1) + 1)
-#define NE2000_DATA_PTR(addr)	(NE2000_ADDR + ((addr & 0x3f) << 1))
-#else
 #define	NE2000_PTR(addr)	((addr&0x1)?(NE2000_ODDOFFSET+addr-1):(addr))
 #define	NE2000_DATA_PTR(addr)	(addr)
-#endif
 
 
 void ne2000_outb(unsigned int val, unsigned int addr)
@@ -285,17 +269,6 @@ void ne2000_irqsetup(int irq)
 }
 #endif
 
-#if defined(CONFIG_CFV240)
-void ne2000_irqsetup(int irq)
-{
-	volatile unsigned char  *icrp;
-
-	icrp = (volatile unsigned char *) (MCF_MBAR + MCFSIM_ICR1);
-	*icrp = MCFSIM_ICR_LEVEL1 | MCFSIM_ICR_PRI2 | MCFSIM_ICR_AUTOVEC;
-	mcf_setimr(mcf_getimr() & ~MCFSIM_IMR_EINT1);
-}
-#endif
-
 #if defined(CONFIG_M5206e) && defined(CONFIG_NETtel)
 void ne2000_irqsetup(int irq)
 {
diff --git a/include/asm-m68knommu/mcfsim.h b/include/asm-m68knommu/mcfsim.h
index 1074ae7..da3f2ce 100644
--- a/include/asm-m68knommu/mcfsim.h
+++ b/include/asm-m68knommu/mcfsim.h
@@ -17,9 +17,7 @@
  *	Include 5204, 5206/e, 5235, 5249, 5270/5271, 5272, 5280/5282,
  *	5307 or 5407 specific addresses.
  */
-#if defined(CONFIG_M5204)
-#include <asm/m5204sim.h>
-#elif defined(CONFIG_M5206) || defined(CONFIG_M5206e)
+#if defined(CONFIG_M5206) || defined(CONFIG_M5206e)
 #include <asm/m5206sim.h>
 #elif defined(CONFIG_M520x)
 #include <asm/m520xsim.h>
diff --git a/include/asm-m68knommu/mcftimer.h b/include/asm-m68knommu/mcftimer.h
index 6f4d796..0f90f6d 100644
--- a/include/asm-m68knommu/mcftimer.h
+++ b/include/asm-m68knommu/mcftimer.h
@@ -16,7 +16,7 @@
 /*
  *	Get address specific defines for this ColdFire member.
  */
-#if defined(CONFIG_M5204) || defined(CONFIG_M5206) || defined(CONFIG_M5206e)
+#if defined(CONFIG_M5206) || defined(CONFIG_M5206e)
 #define	MCFTIMER_BASE1		0x100		/* Base address of TIMER1 */
 #define	MCFTIMER_BASE2		0x120		/* Base address of TIMER2 */
 #elif defined(CONFIG_M5272)
diff --git a/include/asm-m68knommu/mcfuart.h b/include/asm-m68knommu/mcfuart.h
index 873d080..c2b4a2f 100644
--- a/include/asm-m68knommu/mcfuart.h
+++ b/include/asm-m68knommu/mcfuart.h
@@ -20,7 +20,7 @@
 #if defined(CONFIG_M5272)
 #define	MCFUART_BASE1		0x100		/* Base address of UART1 */
 #define	MCFUART_BASE2		0x140		/* Base address of UART2 */
-#elif defined(CONFIG_M5204) || defined(CONFIG_M5206) || defined(CONFIG_M5206e)
+#elif defined(CONFIG_M5206) || defined(CONFIG_M5206e)
 #if defined(CONFIG_NETtel)
 #define	MCFUART_BASE1		0x180		/* Base address of UART1 */
 #define	MCFUART_BASE2		0x140		/* Base address of UART2 */
diff --git a/include/asm-m68knommu/system.h b/include/asm-m68knommu/system.h
index 15b4c7d..ee2dc07 100644
--- a/include/asm-m68knommu/system.h
+++ b/include/asm-m68knommu/system.h
@@ -207,23 +207,6 @@ cmpxchg(volatile int *p, int old, int new)
 }
 
 
-#ifdef CONFIG_M68332
-#define HARD_RESET_NOW() ({		\
-        local_irq_disable();		\
-        asm("				\
-	movew   #0x0000, 0xfffa6a;	\
-        reset;				\
-        /*movew #0x1557, 0xfffa44;*/	\
-        /*movew #0x0155, 0xfffa46;*/	\
-        moveal #0, %a0;			\
-        movec %a0, %vbr;		\
-        moveal 0, %sp;			\
-        moveal 4, %a0;			\
-        jmp (%a0);			\
-        ");				\
-})
-#endif
-
 #if defined( CONFIG_M68328 ) || defined( CONFIG_M68EZ328 ) || \
 	defined (CONFIG_M68360) || defined( CONFIG_M68VZ328 )
 #define HARD_RESET_NOW() ({		\
