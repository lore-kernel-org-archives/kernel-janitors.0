From: =?UTF-8?q?Adeodato=20Sim=C3=B3?= <dato@net.com.org.es>
Date: Thu, 15 Nov 2018 00:27:18 +0000
Subject: [PATCH 1/2] lib/zstd: mark several internal functions as static
Message-Id: <0ba48478013532f20856dca7d90c343d93901d54.1542240915.git.dato@net.com.org.es>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Nick Terrell <terrelln@fb.com>
Cc: Chris Mason <clm@fb.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This silences -Wmissing-prototypes.

Signed-off-by: Adeodato Sim=C3=B3 <dato@net.com.org.es>
---
It was suggested in the kernel-janitors mailing list that silencing
-Wmissing-prototypes would make for a worthy cause.

    https://www.spinics.net/lists/linux-kernel-janitors/msg43981.html

I know the original commit for zstd says (73f3d1b48f50):

> We would like to avoid as much further manual modification to the
> source code as possible, so it will be easier to keep the kernel
> zstd up to date.

so you may have to help me figure out if this is worth doing at this
stage. (I hope it is!)

Thanks for considering.

 lib/zstd/compress.c     |  7 +++++--
 lib/zstd/decompress.c   | 10 +++++-----
 lib/zstd/huf_compress.c |  2 +-
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/lib/zstd/compress.c b/lib/zstd/compress.c
index f9166cf4f7a9..3eee699e1fd6 100644
--- a/lib/zstd/compress.c
+++ b/lib/zstd/compress.c
@@ -2249,7 +2249,10 @@ void ZSTD_compressBlock_lazy_extDict_generic(ZSTD_CC=
tx *ctx, const void *src, si
 	}
 }
=20
-void ZSTD_compressBlock_greedy_extDict(ZSTD_CCtx *ctx, const void *src, si=
ze_t srcSize) { ZSTD_compressBlock_lazy_extDict_generic(ctx, src, srcSize, =
0, 0); }
+static void ZSTD_compressBlock_greedy_extDict(ZSTD_CCtx *ctx, const void *=
src, size_t srcSize)
+{
+	ZSTD_compressBlock_lazy_extDict_generic(ctx, src, srcSize, 0, 0);
+}
=20
 static void ZSTD_compressBlock_lazy_extDict(ZSTD_CCtx *ctx, const void *sr=
c, size_t srcSize)
 {
@@ -2979,7 +2982,7 @@ size_t ZSTD_CStreamWorkspaceBound(ZSTD_compressionPar=
ameters cParams)
 	return ZSTD_CCtxWorkspaceBound(cParams) + ZSTD_ALIGN(sizeof(ZSTD_CStream)=
) + ZSTD_ALIGN(inBuffSize) + ZSTD_ALIGN(outBuffSize);
 }
=20
-ZSTD_CStream *ZSTD_createCStream_advanced(ZSTD_customMem customMem)
+static ZSTD_CStream *ZSTD_createCStream_advanced(ZSTD_customMem customMem)
 {
 	ZSTD_CStream *zcs;
=20
diff --git a/lib/zstd/decompress.c b/lib/zstd/decompress.c
index b17846725ca0..ead0292be308 100644
--- a/lib/zstd/decompress.c
+++ b/lib/zstd/decompress.c
@@ -123,7 +123,7 @@ size_t ZSTD_decompressBegin(ZSTD_DCtx *dctx)
 	return 0;
 }
=20
-ZSTD_DCtx *ZSTD_createDCtx_advanced(ZSTD_customMem customMem)
+static ZSTD_DCtx *ZSTD_createDCtx_advanced(ZSTD_customMem customMem)
 {
 	ZSTD_DCtx *dctx;
=20
@@ -391,7 +391,7 @@ typedef struct {
=20
 /*! ZSTD_getcBlockSize() :
 *   Provides the size of compressed block from block header `src` */
-size_t ZSTD_getcBlockSize(const void *src, size_t srcSize, blockProperties=
_t *bpPtr)
+static size_t ZSTD_getcBlockSize(const void *src, size_t srcSize, blockPro=
perties_t *bpPtr)
 {
 	if (srcSize < ZSTD_blockHeaderSize)
 		return ERROR(srcSize_wrong);
@@ -429,7 +429,7 @@ static size_t ZSTD_setRleBlock(void *dst, size_t dstCap=
acity, const void *src, s
=20
 /*! ZSTD_decodeLiteralsBlock() :
 	@return : nb of bytes read from src (< srcSize ) */
-size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx *dctx, const void *src, size_t s=
rcSize) /* note : srcSize < BLOCKSIZE */
+static size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx *dctx, const void *src, s=
ize_t srcSize) /* note : srcSize < BLOCKSIZE */
 {
 	if (srcSize < MIN_CBLOCK_SIZE)
 		return ERROR(corruption_detected);
@@ -791,7 +791,7 @@ static size_t ZSTD_buildSeqTable(FSE_DTable *DTableSpac=
e, const FSE_DTable **DTa
 	}
 }
=20
-size_t ZSTD_decodeSeqHeaders(ZSTD_DCtx *dctx, int *nbSeqPtr, const void *s=
rc, size_t srcSize)
+static size_t ZSTD_decodeSeqHeaders(ZSTD_DCtx *dctx, int *nbSeqPtr, const =
void *src, size_t srcSize)
 {
 	const BYTE *const istart =3D (const BYTE *const)src;
 	const BYTE *const iend =3D istart + srcSize;
@@ -1494,7 +1494,7 @@ size_t ZSTD_insertBlock(ZSTD_DCtx *dctx, const void *=
blockStart, size_t blockSiz
 	return blockSize;
 }
=20
-size_t ZSTD_generateNxBytes(void *dst, size_t dstCapacity, BYTE byte, size=
_t length)
+static size_t ZSTD_generateNxBytes(void *dst, size_t dstCapacity, BYTE byt=
e, size_t length)
 {
 	if (length > dstCapacity)
 		return ERROR(dstSize_tooSmall);
diff --git a/lib/zstd/huf_compress.c b/lib/zstd/huf_compress.c
index 40055a7016e6..1f4bc4b010c6 100644
--- a/lib/zstd/huf_compress.c
+++ b/lib/zstd/huf_compress.c
@@ -79,7 +79,7 @@ unsigned HUF_optimalTableLog(unsigned maxTableLog, size_t=
 srcSize, unsigned maxS
  * Note : all elements within weightTable are supposed to be <=3D HUF_TABL=
ELOG_MAX.
  */
 #define MAX_FSE_TABLELOG_FOR_HUFF_HEADER 6
-size_t HUF_compressWeights_wksp(void *dst, size_t dstSize, const void *wei=
ghtTable, size_t wtSize, void *workspace, size_t workspaceSize)
+static size_t HUF_compressWeights_wksp(void *dst, size_t dstSize, const vo=
id *weightTable, size_t wtSize, void *workspace, size_t workspaceSize)
 {
 	BYTE *const ostart =3D (BYTE *)dst;
 	BYTE *op =3D ostart;
--=20
2.19.1
