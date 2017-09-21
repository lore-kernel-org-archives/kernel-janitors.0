From: Colin King <colin.king@canonical.com>
Date: Thu, 21 Sep 2017 22:19:39 +0000
Subject: [PATCH] lib/lz4: make arrays static const, reduces object code size
Message-Id: <20170921221939.20820-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sven Schmidt <4sschmid@informatik.uni-hamburg.de>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the read-only arrays dec32table and dec64table on the
stack, instead make them both static const.  Makes the object code
smaller by over 10K bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  31500	      0	      0	  31500	   7b0c	lib/lz4/lz4_decompress.o

After:
   text	   data	    bss	    dec	    hex	filename
  20237	    176	      0	  20413	   4fbd	lib/lz4/lz4_decompress.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/lz4/lz4_decompress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/lz4/lz4_decompress.c b/lib/lz4/lz4_decompress.c
index bd3574312b82..141734d255e4 100644
--- a/lib/lz4/lz4_decompress.c
+++ b/lib/lz4/lz4_decompress.c
@@ -85,8 +85,8 @@ static FORCE_INLINE int LZ4_decompress_generic(
 	const BYTE * const lowLimit = lowPrefix - dictSize;
 
 	const BYTE * const dictEnd = (const BYTE *)dictStart + dictSize;
-	const unsigned int dec32table[] = { 0, 1, 2, 1, 4, 4, 4, 4 };
-	const int dec64table[] = { 0, 0, 0, -1, 0, 1, 2, 3 };
+	static const unsigned int dec32table[] = { 0, 1, 2, 1, 4, 4, 4, 4 };
+	static const int dec64table[] = { 0, 0, 0, -1, 0, 1, 2, 3 };
 
 	const int safeDecode = (endOnInput = endOnInputSize);
 	const int checkOffset = ((safeDecode) && (dictSize < (int)(64 * KB)));
-- 
2.14.1

