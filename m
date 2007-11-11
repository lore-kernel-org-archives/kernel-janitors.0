From: Nicolas Kaiser <nikai@nikai.net>
Date: Sun, 11 Nov 2007 12:43:51 +0000
Subject: [PATCH] fs/xfs: remove duplicated defines
Message-Id: <20071111134351.106efb98@lucky.kitzblitz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove duplicated defines.

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---

 fs/xfs/linux-2.6/xfs_linux.h |    4 ----
 1 file changed, 4 deletions(-)

--- a/fs/xfs/linux-2.6/xfs_linux.h	2007-11-07 11:26:20.000000000 +0100
+++ b/fs/xfs/linux-2.6/xfs_linux.h	2007-11-11 13:07:11.000000000 +0100
@@ -167,12 +167,8 @@
 
 /* clicks to bytes */
 #define	ctob(x)		((__psunsigned_t)(x)<<BPCSHIFT)
-#define btoct(x)        ((__psunsigned_t)(x)>>BPCSHIFT)
 #define	ctob64(x)	((__uint64_t)(x)<<BPCSHIFT)
 
-/* bytes to clicks */
-#define btoc(x)         (((__psunsigned_t)(x)+(NBPC-1))>>BPCSHIFT)
-
 #define ENOATTR		ENODATA		/* Attribute not found */
 #define EWRONGFS	EINVAL		/* Mount with wrong filesystem type */
 #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
