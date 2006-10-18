From: David KOENIG <karhudever@gmail.com>
Date: Wed, 18 Oct 2006 03:11:12 +0000
Subject: [KJ] [PATCH] Remove XFS 2.4 specific code
Message-Id: <45359b68.7c3a0aa0.68e2.6bed@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I'm kind of new to the game, so is this the type of thing I should be doing to 
remove old code?
---
 fs/xfs/xfs_dmapi.h |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/fs/xfs/xfs_dmapi.h b/fs/xfs/xfs_dmapi.h
index 4e7865a..8d370e9 100644
--- a/fs/xfs/xfs_dmapi.h
+++ b/fs/xfs/xfs_dmapi.h
@@ -172,13 +172,6 @@ #define DM_SEM_FLAG_RD(ioflags) (((iofla
 #define DM_SEM_FLAG_WR	(DM_FLAGS_IALLOCSEM_WR | DM_FLAGS_IMUX)
 #endif
 
-#if LINUX_VERSION_CODE <= KERNEL_VERSION(2,4,21)
-#define DM_SEM_FLAG_RD(ioflags) (((ioflags) & IO_ISDIRECT) ? \
-			      0 : DM_FLAGS_IMUX)
-#define DM_SEM_FLAG_WR	(DM_FLAGS_IMUX)
-#endif
-
-
 /*
  *	Macros to turn caller specified delay/block flags into
  *	dm_send_xxxx_event flag DM_FLAGS_NDELAY.
-- 
1.4.1

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
