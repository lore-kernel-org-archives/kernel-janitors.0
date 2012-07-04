From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2012 07:39:45 +0000
Subject: [patch] VFS: copy_tree() returns an error pointer now
Message-Id: <20120704073945.GA30520@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently changed copy_tree() to return an error pointer in
d196d8d327 ('VFS: Make clone_mnt()/copy_tree()/collect_mounts() return
errors').  This call needs to be updated as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/namespace.c b/fs/namespace.c
index 8583bfe..c53d338 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1314,7 +1314,9 @@ struct vfsmount *collect_mounts(struct path *path)
 	tree = copy_tree(real_mount(path->mnt), path->dentry,
 			 CL_COPY_ALL | CL_PRIVATE);
 	up_write(&namespace_sem);
-	return tree ? &tree->mnt : NULL;
+	if (IS_ERR(tree))
+		return NULL;
+	return &tree->mnt;
 }
 
 void drop_collected_mounts(struct vfsmount *mnt)
