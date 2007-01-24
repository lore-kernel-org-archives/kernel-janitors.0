From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 24 Jan 2007 20:08:22 +0000
Subject: [KJ] [RFC][PATCH] Add extra power-of-2 functionality,
Message-Id: <Pine.LNX.4.64.0701241503260.28433@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  Add rounding down to the next power of 2 and is_power_of_2 testing
to include/linux/log2.h, and edit a small number of files to remove
their local definition of the is_power_of_2() macro.

---

  this is just asking for feedback, to see if anyone can see anything
obviously wrong with this patch.  it adds the previously-discussed
functionality to log2.h, and also removes a few local definitions of
an is_power_of_2() macro to avoid redefinitions.

  since there was no earlier rounding down functionality, there was
nothing to remove *there*.

  this patch builds on x86 after "make allyesconfig", but it wasn't
tested for a powerpc build.

  thoughts?



 arch/powerpc/mm/pgtable_32.c  |    3 --
 arch/ppc/mm/pgtable.c         |    3 --
 arch/ppc/syslib/ppc85xx_rio.c |    2 -
 drivers/net/gianfar_ethtool.c |    2 -
 include/linux/log2.h          |   36 ++++++++++++++++++++++++++++++++
 5 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 1891dbe..e2526a0 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -294,9 +294,6 @@ void __init mapin_ram(void)
 	}
 }

-/* is x a power of 2? */
-#define is_power_of_2(x)	((x) != 0 && (((x) & ((x) - 1)) = 0))
-
 /* is x a power of 4? */
 #define is_power_of_4(x)	((x) != 0 && (((x) & (x-1)) = 0) && (ffs(x) & 1))

diff --git a/arch/ppc/mm/pgtable.c b/arch/ppc/mm/pgtable.c
index 354a940..efabe28 100644
--- a/arch/ppc/mm/pgtable.c
+++ b/arch/ppc/mm/pgtable.c
@@ -313,9 +313,6 @@ void __init mapin_ram(void)
 	}
 }

-/* is x a power of 2? */
-#define is_power_of_2(x)	((x) != 0 && (((x) & ((x) - 1)) = 0))
-
 /* is x a power of 4? */
 #define is_power_of_4(x)	((x) != 0 && (((x) & (x-1)) = 0) && (ffs(x) & 1))

diff --git a/arch/ppc/syslib/ppc85xx_rio.c b/arch/ppc/syslib/ppc85xx_rio.c
index 05b0e94..2b09780 100644
--- a/arch/ppc/syslib/ppc85xx_rio.c
+++ b/arch/ppc/syslib/ppc85xx_rio.c
@@ -59,8 +59,6 @@
 #define DBELL_TID(x)		(*(u8 *)(x + DOORBELL_TID_OFFSET))
 #define DBELL_INF(x)		(*(u16 *)(x + DOORBELL_INFO_OFFSET))

-#define is_power_of_2(x)	(((x) & ((x) - 1)) = 0)
-
 struct rio_atmu_regs {
 	u32 rowtar;
 	u32 pad1;
diff --git a/drivers/net/gianfar_ethtool.c b/drivers/net/gianfar_ethtool.c
index 6d71bea..0d6943d 100644
--- a/drivers/net/gianfar_ethtool.c
+++ b/drivers/net/gianfar_ethtool.c
@@ -42,8 +42,6 @@

 #include "gianfar.h"

-#define is_power_of_2(x)        ((x) != 0 && (((x) & ((x) - 1)) = 0))
-
 extern void gfar_start(struct net_device *dev);
 extern int gfar_clean_rx_ring(struct net_device *dev, int rx_work_limit);

diff --git a/include/linux/log2.h b/include/linux/log2.h
index d02e1a5..6cf7081 100644
--- a/include/linux/log2.h
+++ b/include/linux/log2.h
@@ -44,6 +44,17 @@ int __ilog2_u64(u64 n)
 #endif

 /*
+ *  Determine whether some value is a power of two, where zero is
+ * *not* considered a power of two.
+ */
+
+static inline __attribute__((const))
+bool is_power_of_2(unsigned long n)
+{
+	return ((n & (n - 1)) = 0);
+}
+
+/*
  * round up to nearest power of two
  */
 static inline __attribute__((const))
@@ -52,6 +63,15 @@ unsigned long __roundup_pow_of_two(unsigned long n)
 	return 1UL << fls_long(n - 1);
 }

+/*
+ * round down to nearest power of two
+ */
+static inline __attribute__((const))
+unsigned long __rounddown_pow_of_two(unsigned long n)
+{
+	return 1UL << (fls_long(n) - 1);
+}
+
 /**
  * ilog2 - log of base 2 of 32-bit or a 64-bit unsigned value
  * @n - parameter
@@ -154,4 +174,20 @@ unsigned long __roundup_pow_of_two(unsigned long n)
 	__roundup_pow_of_two(n)			\
  )

+/**
+ * rounddown_pow_of_two - round the given value down to nearest power of two
+ * @n - parameter
+ *
+ * round the given value down to the nearest power of two
+ * - the result is undefined when n = 0
+ * - this can be used to initialise global variables from constant data
+ */
+#define rounddown_pow_of_two(n)			\
+(						\
+	__builtin_constant_p(n) ? (		\
+		(n = 1) ? 0 :			\
+		(1UL << ilog2(n)) :		\
+	__rounddown_pow_of_two(n)		\
+ )
+
 #endif /* _LINUX_LOG2_H */

-- 
===============================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Kernel_Janitor%27s_Todo_List
===============================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
