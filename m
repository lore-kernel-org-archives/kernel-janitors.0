From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 04 Mar 2009 18:33:23 +0000
Subject: [PATCH 0/3] xfs: fix sparse warnings
Message-Id: <20090304183136.525.13769.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Blyakher <felixb@sgi.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

The following series fixes a fair amount of the remaining sparse
warnings in fs/xfs with !CONFIG_XFS_DEBUG.

With CONFIG_XFS_DEBUG we still got alot of "Should it be static?"
warnings, but that's a different issue.

---
Hannes Eder (3):
      xfs: include header files for prototypes
      xfs: make symbols static
      xfs: move declaration to header file

 fs/xfs/linux-2.6/xfs_ioctl.c |    1 +
 fs/xfs/linux-2.6/xfs_super.c |    6 +++---
 fs/xfs/support/debug.c       |    1 +
 fs/xfs/xfs_bmap.c            |    2 +-
 fs/xfs/xfs_da_btree.h        |    1 +
 fs/xfs/xfs_dir2.c            |    2 --
 fs/xfs/xfs_dir2_leaf.c       |    2 +-
 7 files changed, 8 insertions(+), 7 deletions(-)
