From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 10 Jan 2020 05:51:27 +0000
Subject: [PATCH] btrfs: Fix error code in btrfs_sysfs_add_mounted()
Message-Id: <20200110055126.4rhhfsotll6puma7@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Dennis Zhou <dennis@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Anand Jain <anand.jain@oracle.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The error code wasn't set on this error path.

Fixes: e12ebce8a4a8 ("btrfs: sysfs: make UUID/debug have its own kobject")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/btrfs/sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/sysfs.c b/fs/btrfs/sysfs.c
index 58486229be95..55e4ed1af29c 100644
--- a/fs/btrfs/sysfs.c
+++ b/fs/btrfs/sysfs.c
@@ -1288,8 +1288,10 @@ int btrfs_sysfs_add_mounted(struct btrfs_fs_info *fs_info)
 
 #ifdef CONFIG_BTRFS_DEBUG
 	fs_info->debug_kobj = kobject_create_and_add("debug", fsid_kobj);
-	if (!fs_info->debug_kobj)
+	if (!fs_info->debug_kobj) {
+		error = -ENOMEM;
 		goto failure;
+	}
 
 	error = sysfs_create_files(fs_info->debug_kobj, btrfs_debug_mount_attrs);
 	if (error)
-- 
2.11.0
