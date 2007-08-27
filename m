From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 27 Aug 2007 13:10:14 +0000
Subject: [PATCH] Add macro to round down to nearest power of two.
Message-Id: <Pine.LNX.4.64.0708270907270.929@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Consistent with the existing roundup_pow_of_two() routine, add the
corresponding rounddown_pow_of_two() routine.

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  i'm not sure if this has already been accepted into one of the
preliminary trees, but can someone check that the logic here makes
sense?  i've tested it, and it seems to return the correct results.

  and this would certainly allow some existing code to be simplified.


diff --git a/include/linux/log2.h b/include/linux/log2.h
index 1b8a2c1..ff8835b 100644
--- a/include/linux/log2.h
+++ b/include/linux/log2.h
@@ -63,6 +63,15 @@ unsigned long __roundup_pow_of_two(unsigned long n)
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
@@ -165,4 +174,20 @@ unsigned long __roundup_pow_of_two(unsigned long n)
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

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
