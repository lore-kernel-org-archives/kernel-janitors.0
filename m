From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 04 Mar 2009 18:34:29 +0000
Subject: [PATCH 3/3] xfs: include header files for prototypes
Message-Id: <20090304183418.525.22262.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090304183136.525.13769.stgit@f10box.hanneseder.net>
In-Reply-To: <20090304183136.525.13769.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Blyakher <felixb@sgi.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Fix this sparse warnings:
  fs/xfs/linux-2.6/xfs_ioctl.c:72:1: warning: symbol 'xfs_find_handle' was not declared. Should it be static?
  fs/xfs/linux-2.6/xfs_ioctl.c:249:1: warning: symbol 'xfs_open_by_handle' was not declared. Should it be static?
  fs/xfs/linux-2.6/xfs_ioctl.c:361:1: warning: symbol 'xfs_readlink_by_handle' was not declared. Should it be static?
  fs/xfs/linux-2.6/xfs_ioctl.c:496:1: warning: symbol 'xfs_attrmulti_attr_get' was not declared. Should it be static?
  fs/xfs/linux-2.6/xfs_ioctl.c:525:1: warning: symbol 'xfs_attrmulti_attr_set' was not declared. Should it be static?
  fs/xfs/linux-2.6/xfs_ioctl.c:555:1: warning: symbol 'xfs_attrmulti_attr_remove' was not declared. Should it be static?
  fs/xfs/linux-2.6/xfs_ioctl.c:657:1: warning: symbol 'xfs_ioc_space' was not declared. Should it be static?
  fs/xfs/linux-2.6/xfs_ioctl.c:1340:1: warning: symbol 'xfs_file_ioctl' was not declared. Should it be static?
  fs/xfs/support/debug.c:65:1: warning: symbol 'xfs_fs_vcmn_err' was not declared. Should it be static?
  fs/xfs/support/debug.c:112:1: warning: symbol 'xfs_hex_dump' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 fs/xfs/linux-2.6/xfs_ioctl.c |    1 +
 fs/xfs/support/debug.c       |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/xfs/linux-2.6/xfs_ioctl.c b/fs/xfs/linux-2.6/xfs_ioctl.c
index 6f04493..d0b4994 100644
--- a/fs/xfs/linux-2.6/xfs_ioctl.c
+++ b/fs/xfs/linux-2.6/xfs_ioctl.c
@@ -34,6 +34,7 @@
 #include "xfs_dir2_sf.h"
 #include "xfs_dinode.h"
 #include "xfs_inode.h"
+#include "xfs_ioctl.h"
 #include "xfs_btree.h"
 #include "xfs_ialloc.h"
 #include "xfs_rtalloc.h"
diff --git a/fs/xfs/support/debug.c b/fs/xfs/support/debug.c
index ae54829..f49cbc1 100644
--- a/fs/xfs/support/debug.c
+++ b/fs/xfs/support/debug.c
@@ -19,6 +19,7 @@
 #include "debug.h"
 
 /* xfs_mount.h drags a lot of crap in, sorry.. */
+#include "xfs_error.h"
 #include "xfs_sb.h"
 #include "xfs_inum.h"
 #include "xfs_ag.h"

