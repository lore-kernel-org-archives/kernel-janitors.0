From: "Claudio Fontana" <claudio.fontana@gmail.com>
Date: Wed, 21 May 2008 22:09:26 +0000
Subject: [PATCH 1/1] lib: fix some obvious whitespace errors in lib/crc32.c
Message-Id: <2c04dc350805211509p6bb409eenac9b72b369c20dcb@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Claudio Fontana <claudio.fontana@gmail.com>

Fix some obvious whitespace errors in lib/crc32.c .

Signed-off-by: Claudio Fontana <claudio.fontana@gmail.com>

---

--- linux-2.6.25.4/lib/crc32.c	2008-05-15 17:00:12.000000000 +0200
+++ linux-2.6.25.4-claudio/lib/crc32.c	2008-05-19 22:07:32.000000000 +0200
@@ -72,25 +72,25 @@ u32 __pure crc32_le(u32 crc, unsigned ch
 u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
 {
 # if CRC_LE_BITS = 8
-	const u32      *b =(u32 *)p;
+	const u32      *b = (u32 *)p;
 	const u32      *tab = crc32table_le;

 # ifdef __LITTLE_ENDIAN
-#  define DO_CRC(x) crc = tab[ (crc ^ (x)) & 255 ] ^ (crc>>8)
+#  define DO_CRC(x) crc = tab[(crc ^ (x)) & 255] ^ (crc >> 8)
 # else
-#  define DO_CRC(x) crc = tab[ ((crc >> 24) ^ (x)) & 255] ^ (crc<<8)
+#  define DO_CRC(x) crc = tab[((crc >> 24) ^ (x)) & 255] ^ (crc << 8)
 # endif

 	crc = __cpu_to_le32(crc);
 	/* Align it */
-	if(unlikely(((long)b)&3 && len)){
+	if (unlikely(((long)b) & 3 && len)) {
 		do {
 			u8 *p = (u8 *)b;
 			DO_CRC(*p++);
 			b = (void *)p;
-		} while ((--len) && ((long)b)&3 );
+		} while ((--len) && ((long)b) & 3);
 	}
-	if(likely(len >= 4)){
+	if (likely(len >= 4)) {
 		/* load data 32 bits wide, xor data 32 bits wide. */
 		size_t save_len = len & 3;
 	        len = len >> 2;
@@ -106,7 +106,7 @@ u32 __pure crc32_le(u32 crc, unsigned ch
 		len = save_len;
 	}
 	/* And the last few bytes */
-	if(len){
+	if (len) {
 		do {
 			u8 *p = (u8 *)b;
 			DO_CRC(*p++);
@@ -170,25 +170,25 @@ u32 __pure crc32_be(u32 crc, unsigned ch
 u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
 {
 # if CRC_BE_BITS = 8
-	const u32      *b =(u32 *)p;
+	const u32      *b = (u32 *)p;
 	const u32      *tab = crc32table_be;

 # ifdef __LITTLE_ENDIAN
-#  define DO_CRC(x) crc = tab[ (crc ^ (x)) & 255 ] ^ (crc>>8)
+#  define DO_CRC(x) crc = tab[(crc ^ (x)) & 255] ^ (crc >> 8)
 # else
-#  define DO_CRC(x) crc = tab[ ((crc >> 24) ^ (x)) & 255] ^ (crc<<8)
+#  define DO_CRC(x) crc = tab[((crc >> 24) ^ (x)) & 255] ^ (crc << 8)
 # endif

 	crc = __cpu_to_be32(crc);
 	/* Align it */
-	if(unlikely(((long)b)&3 && len)){
+	if (unlikely(((long)b) & 3 && len)) {
 		do {
 			u8 *p = (u8 *)b;
 			DO_CRC(*p++);
 			b = (u32 *)p;
 		} while ((--len) && ((long)b)&3 );
 	}
-	if(likely(len >= 4)){
+	if (likely(len >= 4)) {
 		/* load data 32 bits wide, xor data 32 bits wide. */
 		size_t save_len = len & 3;
 	        len = len >> 2;
@@ -204,7 +204,7 @@ u32 __pure crc32_be(u32 crc, unsigned ch
 		len = save_len;
 	}
 	/* And the last few bytes */
-	if(len){
+	if (len) {
 		do {
 			u8 *p = (u8 *)b;
 			DO_CRC(*p++);
@@ -370,7 +370,7 @@ EXPORT_SYMBOL(crc32_be);
 #include <stdlib.h>
 #include <stdio.h>

-#if 0				/*Not used at present */
+#if 0				/* Not used at present */
 static void
 buf_dump(char const *prefix, unsigned char const *buf, size_t len)
 {
