From: Dan Carpenter <error27@gmail.com>
Date: Sat, 20 Mar 2010 11:24:48 +0000
Subject: [patch 3/3] btrfs: dereferencing freed memory
Message-Id: <20100320112448.GX5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>
Cc: Yan Zheng <zheng.yan@oracle.com>, Josef Bacik <josef@redhat.com>, Sage Weil <sage@newdream.net>, Al Viro <viro@zeniv.linux.org.uk>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code dereferenced range on the next line.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index be9b5df..d7ab56c 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -1378,6 +1378,7 @@ static int btrfs_ioctl_defrag(struct file *file, void __user *argp)
 					   sizeof(*range))) {
 				ret = -EFAULT;
 				kfree(range);
+				goto out;
 			}
 			/* compression requires us to start the IO */
 			if ((range->flags & BTRFS_DEFRAG_RANGE_COMPRESS)) {
