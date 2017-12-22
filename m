From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Dec 2017 16:38:24 +0000
Subject: [PATCH] btrfs: fix trivial indentation issues
Message-Id: <20171222163824.28976-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

remove extraneous white space in indentation, fix misaligned
indentation.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/btrfs/ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index ca605ca32eec..e1dff4a3af79 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -2297,8 +2297,8 @@ static noinline int btrfs_search_path_in_tree(struct btrfs_fs_info *info,
 static noinline int btrfs_ioctl_ino_lookup(struct file *file,
 					   void __user *argp)
 {
-	 struct btrfs_ioctl_ino_lookup_args *args;
-	 struct inode *inode;
+	struct btrfs_ioctl_ino_lookup_args *args;
+	struct inode *inode;
 	int ret = 0;
 
 	args = memdup_user(argp, sizeof(*args));
-- 
2.14.1

