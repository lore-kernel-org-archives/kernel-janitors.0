From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 22 Jan 2007 09:37:27 +0000
Subject: [KJ] patch to add extra power-of-two functionality to log2.h
Message-Id: <Pine.LNX.4.64.0701220429130.21991@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  and after all that discussion on power-of-two stuff, it turns out
that most of that already existed in david howells' header file
log2.h, so i trivially added the following, which adds checking
whether a value is a power of two, and rounding down as well.

  can someone sanity check this?  i haven't tested it yet, i just cut
and pasted from what was there already.  if it looks good, i'll submit
it officially.

  after it goes in, the original poster who was interested in working
on this problem can have the job of submitting all of the patches for
the cleanup, and there should be a few of them.  note that my style
script detects at least the most obvious examples of code that should
be replaced by a "is_power_of_2" test.  checking for rounding up and
rounding down will be a little trickier, but still doable.

rday

p.s.  note that the name "is_power_of_2" sort of disagrees with
david's verbiage, which spells out the word "two".  i went with the
former only because there's a (minor) precedent for that:

  $ grep -r is_power_of_2 .

but i'm easy about it being defined either way, for consistency's
sake.


diff --git a/include/linux/log2.h b/include/linux/log2.h
index d02e1a5..b227599 100644
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
+	return 1UL << (fls_long(n) - 1));
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
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
