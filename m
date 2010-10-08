From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:44 +0000
Subject: [PATCH 24/33] Staging: smbfs: Makefile: Makefile clean up
Message-Id: <1286496113-11897-24-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.
Also Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/smbfs/Makefile |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/smbfs/Makefile b/drivers/staging/smbfs/Makefile
index 4faf8c4..d2a92c5 100644
--- a/drivers/staging/smbfs/Makefile
+++ b/drivers/staging/smbfs/Makefile
@@ -4,15 +4,15 @@
 
 obj-$(CONFIG_SMB_FS) += smbfs.o
 
-smbfs-objs := proc.o dir.o cache.o sock.o inode.o file.o ioctl.o getopt.o \
+smbfs-y := proc.o dir.o cache.o sock.o inode.o file.o ioctl.o getopt.o \
 		symlink.o smbiod.o request.o
 
 # If you want debugging output, you may add these flags to the EXTRA_CFLAGS
 # SMBFS_PARANOIA should normally be enabled.
 
-EXTRA_CFLAGS += -DSMBFS_PARANOIA
-#EXTRA_CFLAGS += -DSMBFS_DEBUG
-#EXTRA_CFLAGS += -DSMBFS_DEBUG_VERBOSE
-#EXTRA_CFLAGS += -DDEBUG_SMB_TIMESTAMP
-#EXTRA_CFLAGS += -Werror
+ccflags-y := -DSMBFS_PARANOIA
+#ccflags-y += -DSMBFS_DEBUG
+#ccflags-y += -DSMBFS_DEBUG_VERBOSE
+#ccflags-y += -DDEBUG_SMB_TIMESTAMP
+#ccflags-y += -Werror
 
-- 
1.7.3.1.50.g1e633

