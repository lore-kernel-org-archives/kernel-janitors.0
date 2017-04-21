From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Apr 2017 10:52:20 +0000
Subject: [PATCH] fsnotify: remove a stray unlock
Message-Id: <20170421105220.tha7fa73smi7vowv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Miklos Szeredi <mszeredi@redhat.com>, Amir Goldstein <amir73il@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently shifted this code around, so we're no longer holding the
lock on this path.

Fixes: 755b5bc681eb ("fsnotify: Remove indirection from mark list addition")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/notify/mark.c b/fs/notify/mark.c
index 55955ded338d..9991f8826734 100644
--- a/fs/notify/mark.c
+++ b/fs/notify/mark.c
@@ -603,7 +603,6 @@ int fsnotify_add_mark_locked(struct fsnotify_mark *mark, struct inode *inode,
 			 FSNOTIFY_MARK_FLAG_ATTACHED);
 	list_del_init(&mark->g_list);
 	atomic_dec(&group->num_marks);
-	spin_unlock(&mark->lock);
 
 	fsnotify_put_mark(mark);
 	return ret;
