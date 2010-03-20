From: Dan Carpenter <error27@gmail.com>
Date: Sat, 20 Mar 2010 11:24:15 +0000
Subject: [patch 2/3] btrfs: handle kmalloc() failure
Message-Id: <20100320112415.GW5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>
Cc: Yan Zheng <zheng.yan@oracle.com>, Josef Bacik <josef@redhat.com>, Sage Weil <sage@newdream.net>, Al Viro <viro@zeniv.linux.org.uk>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Return -ENOMEM if kmalloc() fails.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 15f661d..be9b5df 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -1212,6 +1212,9 @@ static noinline int btrfs_ioctl_ino_lookup(struct file *file,
 		return -EPERM;
 
 	args = kmalloc(sizeof(*args), GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
+
 	if (copy_from_user(args, argp, sizeof(*args))) {
 		kfree(args);
 		return -EFAULT;
