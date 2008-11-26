From: "Hannes Eder" <hannes@hanneseder.net>
Date: Wed, 26 Nov 2008 15:54:53 +0000
Subject: [PATCH] [XFS] fix sparse warning
Message-Id: <154e089b0811260754y191856bfl522f33febfc6e633@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>, David Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Impact: fix sparse warning

Fix the following sparse warning:

  fs/xfs/xfs_inode.h:326:2: warning: returning void-valued expression

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 fs/xfs/xfs_inode.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
index c6e295e..7a828cb 100644
--- a/fs/xfs/xfs_inode.h
+++ b/fs/xfs/xfs_inode.h
@@ -323,7 +323,7 @@ static inline struct inode *VFS_I(struct xfs_inode *ip)
 static inline void xfs_destroy_inode(struct xfs_inode *ip)
 {
 	make_bad_inode(VFS_I(ip));
-	return destroy_inode(VFS_I(ip));
+	destroy_inode(VFS_I(ip));
 }

 /*
