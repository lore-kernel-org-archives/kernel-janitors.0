From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Mar 2014 08:06:00 +0000
Subject: [patch] Btrfs: kmalloc() doesn't return an ERR_PTR
Message-Id: <20140328080600.GD25192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Hugo Mills <hugo@carfax.org.uk>
Cc: Josef Bacik <jbacik@fb.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The error handling was copy and pasted from memdup_user().  It should be
checking for NULL obviously.

Fixes: abccd00f8af2 ('btrfs: Fix 32/64-bit problem with BTRFS_SET_RECEIVED_SUBVOL ioctl')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 0401397..27d551c 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -4531,9 +4531,8 @@ static long btrfs_ioctl_set_received_subvol_32(struct file *file,
 	}
 
 	args64 = kmalloc(sizeof(*args64), GFP_NOFS);
-	if (IS_ERR(args64)) {
-		ret = PTR_ERR(args64);
-		args64 = NULL;
+	if (!args64) {
+		ret = -ENOMEM;
 		goto out;
 	}
 
