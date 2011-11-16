From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Nov 2011 08:28:01 +0000
Subject: [patch] btrfs scrub: handle -ENOMEM from init_ipath()
Message-Id: <20111116082801.GE10264@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

init_ipath() can return an ERR_PTR(-ENOMEM).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
index ed11d38..b72ee47 100644
--- a/fs/btrfs/scrub.c
+++ b/fs/btrfs/scrub.c
@@ -256,6 +256,11 @@ static int scrub_print_warning_inode(u64 inum, u64 offset, u64 root, void *ctx)
 	btrfs_release_path(swarn->path);
 
 	ipath = init_ipath(4096, local_root, swarn->path);
+	if (IS_ERR(ipath)) {
+		ret = PTR_ERR(ipath);
+		ipath = NULL;
+		goto err;
+	}
 	ret = paths_from_inode(inum, ipath);
 
 	if (ret < 0)
