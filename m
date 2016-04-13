From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Apr 2016 06:40:59 +0000
Subject: [patch] btrfs: send: silence an integer overflow warning
Message-Id: <20160413064059.GB8092@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>
Cc: Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The "sizeof(*arg->clone_sources) * arg->clone_sources_count" expression
can overflow.  It causes several static checker warnings.  It's all
under CAP_SYS_ADMIN so it's not that serious but lets silence the
warnings.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/send.c b/fs/btrfs/send.c
index 73dd5d6..6a8c860 100644
--- a/fs/btrfs/send.c
+++ b/fs/btrfs/send.c
@@ -5979,6 +5979,12 @@ long btrfs_ioctl_send(struct file *mnt_file, void __user *arg_)
 		goto out;
 	}
 
+	if (arg->clone_sources_count >
+	    ULLONG_MAX / sizeof(*arg->clone_sources)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (!access_ok(VERIFY_READ, arg->clone_sources,
 			sizeof(*arg->clone_sources) *
 			arg->clone_sources_count)) {
