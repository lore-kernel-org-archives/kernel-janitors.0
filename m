From: Thiago Rafael Becker <trbecker@trbecker.org>
Date: Wed, 09 May 2012 01:36:54 +0000
Subject: [PATCH] crc32.c: cleanup unused variables warning
Message-Id: <1336527414-18413-1-git-send-email-trbecker@trbecker.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Variables t4, t5, t6 and t7 are only used when CRC_LE_BITS != 32.
---
 lib/crc32.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/crc32.c b/lib/crc32.c
index b0d278f..61774b8 100644
--- a/lib/crc32.c
+++ b/lib/crc32.c
@@ -74,7 +74,9 @@ crc32_body(u32 crc, unsigned char const *buf, size_t len, const u32 (*tab)[256])
 	size_t i;
 # endif
 	const u32 *t0=tab[0], *t1=tab[1], *t2=tab[2], *t3=tab[3];
+# if CRC_LE_BITS != 32
 	const u32 *t4 = tab[4], *t5 = tab[5], *t6 = tab[6], *t7 = tab[7];
+# endif
 	u32 q;
 
 	/* Align it */
-- 
1.7.10.1

