From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Nov 2015 09:10:03 +0000
Subject: [patch] Btrfs: tests: checking for NULL instead of IS_ERR()
Message-Id: <20151110091003.GC2934@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>
Cc: Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

btrfs_alloc_dummy_root() return an error pointer on failure, it never
returns NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/tests/free-space-tests.c b/fs/btrfs/tests/free-space-tests.c
index c8c3d70..8b72b00 100644
--- a/fs/btrfs/tests/free-space-tests.c
+++ b/fs/btrfs/tests/free-space-tests.c
@@ -898,8 +898,10 @@ int btrfs_test_free_space_cache(void)
 	}
 
 	root = btrfs_alloc_dummy_root();
-	if (!root)
+	if (IS_ERR(root)) {
+		ret = PTR_ERR(root);
 		goto out;
+	}
 
 	root->fs_info = btrfs_alloc_dummy_fs_info();
 	if (!root->fs_info)
