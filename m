From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Sep 2017 14:59:46 +0000
Subject: [PATCH] lib: zstd: make const array rtbTable static, reduces object code size
Message-Id: <20170922145946.14316-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Terrell <terrelln@fb.com>, Chris Mason <clm@fb.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate const array rtbTable on the stack, instead make it
static. Also split overly long line to clean a chechkpach warning.
Makes the object code smaller by nearly 500 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  13297	    104	      0	  13401	   3459	lib/zstd/fse_compress.o

After:
   text	   data	    bss	    dec	    hex	filename
  12742	    160	      0	  12902	   3266	lib/zstd/fse_compress.o

(gcc 6.3.0, x86-64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/zstd/fse_compress.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/zstd/fse_compress.c b/lib/zstd/fse_compress.c
index ef3d1741d532..f41c13128ed2 100644
--- a/lib/zstd/fse_compress.c
+++ b/lib/zstd/fse_compress.c
@@ -618,7 +618,10 @@ size_t FSE_normalizeCount(short *normalizedCounter, unsigned tableLog, const uns
 		return ERROR(GENERIC); /* Too small tableLog, compression potentially impossible */
 
 	{
-		U32 const rtbTable[] = {0, 473195, 504333, 520860, 550000, 700000, 750000, 830000};
+		U32 static const rtbTable[] = {
+			0, 473195, 504333, 520860,
+			550000, 700000, 750000, 830000
+		};
 		U64 const scale = 62 - tableLog;
 		U64 const step = div_u64((U64)1 << 62, (U32)total); /* <= here, one division ! */
 		U64 const vStep = 1ULL << (scale - 20);
-- 
2.14.1

