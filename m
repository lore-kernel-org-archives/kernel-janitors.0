From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jan 2012 07:18:00 +0000
Subject: [patch] fsnotify: remove unused parameter from send_to_group()
Message-Id: <20120104071800.GA30978@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Piggin <npiggin@kernel.dk>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We don't use "mnt" anymore in send_to_group() after 1968f5eed5
"fanotify: use both marks when possible" was applied.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/notify/fsnotify.c b/fs/notify/fsnotify.c
index ccb14d3..b39c5c1 100644
--- a/fs/notify/fsnotify.c
+++ b/fs/notify/fsnotify.c
@@ -123,7 +123,7 @@ int __fsnotify_parent(struct path *path, struct dentry *dentry, __u32 mask)
 }
 EXPORT_SYMBOL_GPL(__fsnotify_parent);
 
-static int send_to_group(struct inode *to_tell, struct vfsmount *mnt,
+static int send_to_group(struct inode *to_tell,
 			 struct fsnotify_mark *inode_mark,
 			 struct fsnotify_mark *vfsmount_mark,
 			 __u32 mask, void *data,
@@ -168,10 +168,10 @@ static int send_to_group(struct inode *to_tell, struct vfsmount *mnt,
 			vfsmount_test_mask &= ~inode_mark->ignored_mask;
 	}
 
-	pr_debug("%s: group=%p to_tell=%p mnt=%p mask=%x inode_mark=%p"
+	pr_debug("%s: group=%p to_tell=%p mask=%x inode_mark=%p"
 		 " inode_test_mask=%x vfsmount_mark=%p vfsmount_test_mask=%x"
 		 " data=%p data_is=%d cookie=%d event=%p\n",
-		 __func__, group, to_tell, mnt, mask, inode_mark,
+		 __func__, group, to_tell, mask, inode_mark,
 		 inode_test_mask, vfsmount_mark, vfsmount_test_mask, data,
 		 data_is, cookie, *event);
 
@@ -258,16 +258,16 @@ int fsnotify(struct inode *to_tell, __u32 mask, void *data, int data_is,
 
 		if (inode_group > vfsmount_group) {
 			/* handle inode */
-			ret = send_to_group(to_tell, NULL, inode_mark, NULL, mask, data,
+			ret = send_to_group(to_tell, inode_mark, NULL, mask, data,
 					    data_is, cookie, file_name, &event);
 			/* we didn't use the vfsmount_mark */
 			vfsmount_group = NULL;
 		} else if (vfsmount_group > inode_group) {
-			ret = send_to_group(to_tell, &mnt->mnt, NULL, vfsmount_mark, mask, data,
+			ret = send_to_group(to_tell, NULL, vfsmount_mark, mask, data,
 					    data_is, cookie, file_name, &event);
 			inode_group = NULL;
 		} else {
-			ret = send_to_group(to_tell, &mnt->mnt, inode_mark, vfsmount_mark,
+			ret = send_to_group(to_tell, inode_mark, vfsmount_mark,
 					    mask, data, data_is, cookie, file_name,
 					    &event);
 		}
