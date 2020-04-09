From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 09 Apr 2020 17:16:32 +0000
Subject: [PATCH] lib: avoid trailing '\n' hidden in pr_fmt() in test_hash.c
Message-Id: <20200409171632.30738-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

pr_xxx() functions usually have '\n' at the end of the logging message.
Here, this '\n' is added via the 'pr_fmt' macro.

In order to be more consistent with other files, use a more standard
convention and put these '\n' back in the messages themselves and remove it
from the pr_fmt macro.

While at it, merge some split strings.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 lib/test_hash.c | 55 ++++++++++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/lib/test_hash.c b/lib/test_hash.c
index 0ee40b4a56dd..e4bd06fdb9cb 100644
--- a/lib/test_hash.c
+++ b/lib/test_hash.c
@@ -14,7 +14,7 @@
  * and hash_64().
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt "\n"
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/compiler.h>
 #include <linux/types.h>
@@ -77,7 +77,7 @@ test_int_hash(unsigned long long h64, u32 hash_or[2][33])
 	hash_or[1][0] |= h2 = __hash_32_generic(h0);
 #if HAVE_ARCH__HASH_32 = 1
 	if (h1 != h2) {
-		pr_err("__hash_32(%#x) = %#x != __hash_32_generic() = %#x",
+		pr_err("__hash_32(%#x) = %#x != __hash_32_generic() = %#x\n",
 			h0, h1, h2);
 		return false;
 	}
@@ -91,20 +91,20 @@ test_int_hash(unsigned long long h64, u32 hash_or[2][33])
 		/* Test hash_32 */
 		hash_or[0][k] |= h1 = hash_32(h0, k);
 		if (h1 > m) {
-			pr_err("hash_32(%#x, %d) = %#x > %#x", h0, k, h1, m);
+			pr_err("hash_32(%#x, %d) = %#x > %#x\n", h0, k, h1, m);
 			return false;
 		}
 #ifdef HAVE_ARCH_HASH_32
 		h2 = hash_32_generic(h0, k);
 #if HAVE_ARCH_HASH_32 = 1
 		if (h1 != h2) {
-			pr_err("hash_32(%#x, %d) = %#x != hash_32_generic() "
-				" = %#x", h0, k, h1, h2);
+			pr_err("hash_32(%#x, %d) = %#x != hash_32_generic() = %#x\n",
+				h0, k, h1, h2);
 			return false;
 		}
 #else
 		if (h2 > m) {
-			pr_err("hash_32_generic(%#x, %d) = %#x > %#x",
+			pr_err("hash_32_generic(%#x, %d) = %#x > %#x\n",
 				h0, k, h1, m);
 			return false;
 		}
@@ -113,20 +113,21 @@ test_int_hash(unsigned long long h64, u32 hash_or[2][33])
 		/* Test hash_64 */
 		hash_or[1][k] |= h1 = hash_64(h64, k);
 		if (h1 > m) {
-			pr_err("hash_64(%#llx, %d) = %#x > %#x", h64, k, h1, m);
+			pr_err("hash_64(%#llx, %d) = %#x > %#x\n",
+				h64, k, h1, m);
 			return false;
 		}
 #ifdef HAVE_ARCH_HASH_64
 		h2 = hash_64_generic(h64, k);
 #if HAVE_ARCH_HASH_64 = 1
 		if (h1 != h2) {
-			pr_err("hash_64(%#llx, %d) = %#x != hash_64_generic() "
-				"= %#x", h64, k, h1, h2);
+			pr_err("hash_64(%#llx, %d) = %#x != hash_64_generic() = %#x\n",
+				h64, k, h1, h2);
 			return false;
 		}
 #else
 		if (h2 > m) {
-			pr_err("hash_64_generic(%#llx, %d) = %#x > %#x",
+			pr_err("hash_64_generic(%#llx, %d) = %#x > %#x\n",
 				h64, k, h1, m);
 			return false;
 		}
@@ -161,15 +162,13 @@ test_hash_init(void)
 
 			/* Check that hashlen_string gets the length right */
 			if (hashlen_len(hashlen) != j-i) {
-				pr_err("hashlen_string(%d..%d) returned length"
-					" %u, expected %d",
+				pr_err("hashlen_string(%d..%d) returned length %u, expected %d\n",
 					i, j, hashlen_len(hashlen), j-i);
 				return -EINVAL;
 			}
 			/* Check that the hashes match */
 			if (hashlen_hash(hashlen) != h0) {
-				pr_err("hashlen_string(%d..%d) = %08x != "
-					"full_name_hash() = %08x",
+				pr_err("hashlen_string(%d..%d) = %08x != full_name_hash() = %08x\n",
 					i, j, hashlen_hash(hashlen), h0);
 				return -EINVAL;
 			}
@@ -184,19 +183,19 @@ test_hash_init(void)
 
 	/* The OR of all the hash values should cover all the bits */
 	if (~string_or) {
-		pr_err("OR of all string hash results = %#x != %#x",
+		pr_err("OR of all string hash results = %#x != %#x\n",
 			string_or, -1u);
 		return -EINVAL;
 	}
 	if (~hash_or[0][0]) {
-		pr_err("OR of all __hash_32 results = %#x != %#x",
+		pr_err("OR of all __hash_32 results = %#x != %#x\n",
 			hash_or[0][0], -1u);
 		return -EINVAL;
 	}
 #ifdef HAVE_ARCH__HASH_32
 #if HAVE_ARCH__HASH_32 != 1	/* Test is pointless if results match */
 	if (~hash_or[1][0]) {
-		pr_err("OR of all __hash_32_generic results = %#x != %#x",
+		pr_err("OR of all __hash_32_generic results = %#x != %#x\n",
 			hash_or[1][0], -1u);
 		return -EINVAL;
 	}
@@ -208,13 +207,13 @@ test_hash_init(void)
 		u32 const m = ((u32)2 << (i-1)) - 1;	/* Low i bits set */
 
 		if (hash_or[0][i] != m) {
-			pr_err("OR of all hash_32(%d) results = %#x "
-				"(%#x expected)", i, hash_or[0][i], m);
+			pr_err("OR of all hash_32(%d) results = %#x (%#x expected)\n",
+				i, hash_or[0][i], m);
 			return -EINVAL;
 		}
 		if (hash_or[1][i] != m) {
-			pr_err("OR of all hash_64(%d) results = %#x "
-				"(%#x expected)", i, hash_or[1][i], m);
+			pr_err("OR of all hash_64(%d) results = %#x (%#x expected)\n",
+				i, hash_or[1][i], m);
 			return -EINVAL;
 		}
 	}
@@ -222,27 +221,27 @@ test_hash_init(void)
 	/* Issue notices about skipped tests. */
 #ifdef HAVE_ARCH__HASH_32
 #if HAVE_ARCH__HASH_32 != 1
-	pr_info("__hash_32() is arch-specific; not compared to generic.");
+	pr_info("__hash_32() is arch-specific; not compared to generic.\n");
 #endif
 #else
-	pr_info("__hash_32() has no arch implementation to test.");
+	pr_info("__hash_32() has no arch implementation to test.\n");
 #endif
 #ifdef HAVE_ARCH_HASH_32
 #if HAVE_ARCH_HASH_32 != 1
-	pr_info("hash_32() is arch-specific; not compared to generic.");
+	pr_info("hash_32() is arch-specific; not compared to generic.\n");
 #endif
 #else
-	pr_info("hash_32() has no arch implementation to test.");
+	pr_info("hash_32() has no arch implementation to test.\n");
 #endif
 #ifdef HAVE_ARCH_HASH_64
 #if HAVE_ARCH_HASH_64 != 1
-	pr_info("hash_64() is arch-specific; not compared to generic.");
+	pr_info("hash_64() is arch-specific; not compared to generic.\n");
 #endif
 #else
-	pr_info("hash_64() has no arch implementation to test.");
+	pr_info("hash_64() has no arch implementation to test.\n");
 #endif
 
-	pr_notice("%u tests passed.", tests);
+	pr_notice("%u tests passed.\n", tests);
 
 	return 0;
 }
-- 
2.20.1
