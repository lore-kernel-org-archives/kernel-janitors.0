From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jun 2014 19:20:10 +0000
Subject: [patch] Btrfs: fix error code in btrfs_init_test_fs()
Message-Id: <20140620192010.GB19824@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>
Cc: Josef Bacik <jbacik@fb.com>, Sasha Levin <sasha.levin@oracle.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

We had intended to return a negative error code here, but we use the
wrong variable so it returns success.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/tests/btrfs-tests.c b/fs/btrfs/tests/btrfs-tests.c
index 9626252..8e7225f 100644
--- a/fs/btrfs/tests/btrfs-tests.c
+++ b/fs/btrfs/tests/btrfs-tests.c
@@ -65,7 +65,7 @@ int btrfs_init_test_fs(void)
 	if (IS_ERR(test_mnt)) {
 		printk(KERN_ERR "btrfs: cannot mount test file system\n");
 		unregister_filesystem(&test_type);
-		return ret;
+		return PTR_ERR(test_mnt);
 	}
 	return 0;
 }
