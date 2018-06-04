From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Jun 2018 12:19:03 +0000
Subject: [PATCH] afs: Fix proc_symlink() error check
Message-Id: <20180604121903.6oqwz4hrxbpf6ddm@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The proc_symlink() returns NULL on error.  It never returns error
pointers.

Fixes: 5b86d4ff5dce ("afs: Implement network namespacing")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/afs/main.c b/fs/afs/main.c
index 7d2c1354e2ca..724e3a9d4d57 100644
--- a/fs/afs/main.c
+++ b/fs/afs/main.c
@@ -200,8 +200,8 @@ static int __init afs_init(void)
 		goto error_fs;
 
 	afs_proc_symlink = proc_symlink("fs/afs", NULL, "../self/net/afs");
-	if (IS_ERR(afs_proc_symlink)) {
-		ret = PTR_ERR(afs_proc_symlink);
+	if (!afs_proc_symlink) {
+		ret = -ENOMEM;
 		goto error_proc;
 	}
 
