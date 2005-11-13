From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 13 Nov 2005 21:54:44 +0000
Subject: [KJ] [PATCH] fs/udf/balloc.c: fix preprocessor abuse
Message-Id: <20051113215444.GA11242@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97396913462820511=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97396913462820511==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 fs/udf/balloc.c |   23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

--- a/fs/udf/balloc.c
+++ b/fs/udf/balloc.c
@@ -39,16 +39,19 @@
 #define udf_find_first_one_bit(addr, size) find_first_one_bit(addr, size)
 #define udf_find_next_one_bit(addr, size, offset) find_next_one_bit(addr, size, offset)
 
-#define leBPL_to_cpup(x) leNUM_to_cpup(BITS_PER_LONG, x)
-#define leNUM_to_cpup(x,y) xleNUM_to_cpup(x,y)
-#define xleNUM_to_cpup(x,y) (le ## x ## _to_cpup(y))
-#define uintBPL_t uint(BITS_PER_LONG)
-#define uint(x) xuint(x)
-#define xuint(x) __le ## x
+#if BITS_PER_LONG == 32
+#define lelong_to_cpup(x) le32_to_cpup(x)
+#define __lelong __le32
+#elif BITS_PER_LONG == 64
+#define lelong_to_cpup(x) le64_to_cpup(x)
+#define __lelong __le64
+#else
+#error BITS_PER_LONG
+#endif
 
 extern inline int find_next_one_bit (void * addr, int size, int offset)
 {
-	uintBPL_t * p = ((uintBPL_t *) addr) + (offset / BITS_PER_LONG);
+	__lelong * p = ((__lelong *) addr) + (offset / BITS_PER_LONG);
 	int result = offset & ~(BITS_PER_LONG-1);
 	unsigned long tmp;
 
@@ -58,7 +61,7 @@ extern inline int find_next_one_bit (voi
 	offset &= (BITS_PER_LONG-1);
 	if (offset)
 	{
-		tmp = leBPL_to_cpup(p++);
+		tmp = lelong_to_cpup(p++);
 		tmp &= ~0UL << offset;
 		if (size < BITS_PER_LONG)
 			goto found_first;
@@ -69,14 +72,14 @@ extern inline int find_next_one_bit (voi
 	}
 	while (size & ~(BITS_PER_LONG-1))
 	{
-		if ((tmp = leBPL_to_cpup(p++)))
+		if ((tmp = lelong_to_cpup(p++)))
 			goto found_middle;
 		result += BITS_PER_LONG;
 		size -= BITS_PER_LONG;
 	}
 	if (!size)
 		return result;
-	tmp = leBPL_to_cpup(p);
+	tmp = lelong_to_cpup(p);
 found_first:
 	tmp &= ~0UL >> (BITS_PER_LONG-size);
 found_middle:


--===============97396913462820511==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97396913462820511==--
