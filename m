From: Julia Lawall <julia@diku.dk>
Date: Thu, 25 Dec 2008 14:35:27 +0000
Subject: [PATCH 7/7] fs/gfs2: Use DEFINE_SPINLOCK
Message-Id: <Pine.LNX.4.64.0812251535080.22039@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: swhiteho@redhat.com, cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

SPIN_LOCK_UNLOCKED is deprecated.  The following makes the change suggested
in Documentation/spinlocks.txt

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
declarer name DEFINE_SPINLOCK;
identifier xxx_lock;
@@

- spinlock_t xxx_lock = SPIN_LOCK_UNLOCKED;
+ DEFINE_SPINLOCK(xxx_lock);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
diff -u -p a/fs/gfs2/glock.c b/fs/gfs2/glock.c
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -65,7 +65,7 @@ static struct dentry *gfs2_root;
 static struct workqueue_struct *glock_workqueue;
 static LIST_HEAD(lru_list);
 static atomic_t lru_count = ATOMIC_INIT(0);
-static spinlock_t lru_lock = SPIN_LOCK_UNLOCKED;
+static DEFINE_SPINLOCK(lru_lock);
 
 #define GFS2_GL_HASH_SHIFT      15
 #define GFS2_GL_HASH_SIZE       (1 << GFS2_GL_HASH_SHIFT)
