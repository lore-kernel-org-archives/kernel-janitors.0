From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 13:30:52 +0000
Subject: [PATCH 0/3] JFS: Adjustments for several function implementations
Message-Id: <3ce43084-11c3-6fc0-821b-7fa6e67c3e30@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jfs-discussion@lists.sourceforge.net, Dave Kleikamp <shaggy@kernel.org>, Fabian Frederick <fabf@skynet.be>, Jan Kara <jack@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 15:22:11 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in diMount()
  Improve size determinations in five functions
  Adjust 67 checks for null pointers

 fs/jfs/jfs_dmap.c     | 44 ++++++++++++++++++++++----------------------
 fs/jfs/jfs_dtree.c    |  6 +++---
 fs/jfs/jfs_imap.c     | 31 ++++++++++++++-----------------
 fs/jfs/jfs_logmgr.c   | 26 ++++++++++++++------------
 fs/jfs/jfs_metapage.c |  7 +++----
 fs/jfs/jfs_mount.c    |  6 +++---
 fs/jfs/jfs_txnmgr.c   |  6 +++---
 fs/jfs/jfs_unicode.c  |  3 +--
 fs/jfs/jfs_xtree.c    |  6 +++---
 fs/jfs/namei.c        |  3 +--
 fs/jfs/resize.c       |  2 +-
 fs/jfs/super.c        |  6 +++---
 fs/jfs/xattr.c        | 10 +++++-----
 13 files changed, 76 insertions(+), 80 deletions(-)

-- 
2.14.0

