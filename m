From: Julia Lawall <julia@diku.dk>
Date: Mon, 13 Jul 2009 10:10:05 +0000
Subject: [PATCH 1/2] fs/xfs: Drop unnecessary NULL test
Message-Id: <Pine.LNX.4.64.0907131209250.6808@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: felixb@sgi.com, xfs-masters@oss.sgi.com, xfs@oss.sgi.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The result of container_of should not be NULL.  In particular, in this case
the argument to the enclosing function has passed though INIT_DELAYED_WORK,
which dereferences it, implying that its container cannot be NULL.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression x,e;
@@
x = container_of(...)
... when != x = e
* x = NULL
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/xfs/xfs_mru_cache.c              |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_mru_cache.c b/fs/xfs/xfs_mru_cache.c
index 4b0613d..0651ce7 100644
--- a/fs/xfs/xfs_mru_cache.c
+++ b/fs/xfs/xfs_mru_cache.c
@@ -280,8 +280,8 @@ _xfs_mru_cache_reap(
 	xfs_mru_cache_t		*mru = container_of(work, xfs_mru_cache_t, work.work);
 	unsigned long		now, next;
 
-	ASSERT(mru && mru->lists);
-	if (!mru || !mru->lists)
+	ASSERT(mru->lists);
+	if (!mru->lists)
 		return;
 
 	spin_lock(&mru->lock);
