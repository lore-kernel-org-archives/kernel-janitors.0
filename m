From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:19:17 +0000
Subject: [patch] powerpc/spufs: remove duplicate SPUFS_CNTL_MAP_SIZE define
Message-Id: <20140609151917.GM9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Kerr <jk@ozlabs.org>
Cc: cbe-oss-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

The SPUFS_CNTL_MAP_SIZE define is cut and pasted twice so we can delete
the second instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/powerpc/platforms/cell/spufs/spufs.h b/arch/powerpc/platforms/cell/spufs/spufs.h
index 0ba3c95..bcfd6f0 100644
--- a/arch/powerpc/platforms/cell/spufs/spufs.h
+++ b/arch/powerpc/platforms/cell/spufs/spufs.h
@@ -35,7 +35,6 @@
 #define SPUFS_PS_MAP_SIZE	0x20000
 #define SPUFS_MFC_MAP_SIZE	0x1000
 #define SPUFS_CNTL_MAP_SIZE	0x1000
-#define SPUFS_CNTL_MAP_SIZE	0x1000
 #define SPUFS_SIGNAL_MAP_SIZE	PAGE_SIZE
 #define SPUFS_MSS_MAP_SIZE	0x1000
 
