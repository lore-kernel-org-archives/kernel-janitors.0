From: =?UTF-8?q?Adeodato=20Sim=C3=B3?= <dato@net.com.org.es>
Date: Thu, 15 Nov 2018 00:27:19 +0000
Subject: [PATCH 2/2] lib/zstd: mark some internal functions as static with ZSTD_STATIC
Message-Id: <7e1778db6a6f586f3c7662c4878a349fde92084d.1542240915.git.dato@net.com.org.es>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0ba48478013532f20856dca7d90c343d93901d54.1542240915.git.dato@net.com.org.es>
In-Reply-To: <0ba48478013532f20856dca7d90c343d93901d54.1542240915.git.dato@net.com.org.es>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Nick Terrell <terrelln@fb.com>
Cc: Chris Mason <clm@fb.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Use ZSTD_STATIC instead of vanilla static because the functions are
actually unused, and the macro adds the unused attribute.

This silences -Wmissing-prototypes when defining.

Signed-off-by: Adeodato Sim=C3=B3 <dato@net.com.org.es>
---
I separated these two functions into a separate patch because they
are actually unused.

If you'd rather have them removed, we may do that as well.

Note that the ZSTD_STATIC macro adds the unused attribute in addition
to static, but it adds __inline as well.

 lib/zstd/compress.c     | 2 +-
 lib/zstd/fse_compress.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/zstd/compress.c b/lib/zstd/compress.c
index 3eee699e1fd6..c572d064775f 100644
--- a/lib/zstd/compress.c
+++ b/lib/zstd/compress.c
@@ -431,7 +431,7 @@ static void ZSTD_reduceIndex(ZSTD_CCtx *zc, const U32 r=
educerValue)
=20
 /* See doc/zstd_compression_format.md for detailed format description */
=20
-size_t ZSTD_noCompressBlock(void *dst, size_t dstCapacity, const void *src=
, size_t srcSize)
+ZSTD_STATIC size_t ZSTD_noCompressBlock(void *dst, size_t dstCapacity, con=
st void *src, size_t srcSize)
 {
 	if (srcSize + ZSTD_blockHeaderSize > dstCapacity)
 		return ERROR(dstSize_tooSmall);
diff --git a/lib/zstd/fse_compress.c b/lib/zstd/fse_compress.c
index ef3d1741d532..05a148eabd09 100644
--- a/lib/zstd/fse_compress.c
+++ b/lib/zstd/fse_compress.c
@@ -474,7 +474,7 @@ size_t FSE_count_wksp(unsigned *count, unsigned *maxSym=
bolValuePtr, const void *
 	`FSE_symbolCompressionTransform symbolTT[maxSymbolValue+1];`  // This siz=
e is variable
 Allocation is manual (C standard does not support variable-size structures=
).
 */
-size_t FSE_sizeof_CTable(unsigned maxSymbolValue, unsigned tableLog)
+ZSTD_STATIC size_t FSE_sizeof_CTable(unsigned maxSymbolValue, unsigned tab=
leLog)
 {
 	if (tableLog > FSE_MAX_TABLELOG)
 		return ERROR(tableLog_tooLarge);
--=20
2.19.1
