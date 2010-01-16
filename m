From: Julia Lawall <julia@diku.dk>
Date: Sat, 16 Jan 2010 16:00:10 +0000
Subject: [PATCH 8/9] fs/ceph: Eliminate useless code
Message-Id: <Pine.LNX.4.64.1001161659520.28745@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sage Weil <sage@newdream.net>, ceph-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The variable client is initialized twice to the same (side effect-free)
expression.  Drop one initialization.

A simplified version of the semantic match that finds this problem is:
(http://coccinelle.lip6.fr/)

// <smpl>
@forall@
idexpression *x;
identifier f!=ERR_PTR;
@@

x = f(...)
... when != x
(
x = f(...,<+...x...+>,...)
|
* x = f(...)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/ceph/addr.c  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index eab46b0..8686018 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -567,9 +567,9 @@ static int ceph_writepages_start(struct address_space *mapping,
 	struct inode *inode = mapping->host;
 	struct backing_dev_info *bdi = mapping->backing_dev_info;
 	struct ceph_inode_info *ci = ceph_inode(inode);
-	struct ceph_client *client = ceph_inode_to_client(inode);
+	struct ceph_client *client;
 	pgoff_t index, start, end;
 	int range_whole = 0;
 	int should_loop = 1;
