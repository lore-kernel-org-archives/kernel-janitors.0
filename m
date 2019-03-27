From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 27 Mar 2019 03:20:24 +0000
Subject: [PATCH -next] btrfs: remove set but not used variable 'fs_devices'
Message-Id: <20190327032024.63906-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541643283-109411-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541643283-109411-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

fs/btrfs/volumes.c: In function 'btrfs_grow_device':
fs/btrfs/volumes.c:2824:27: warning:
 variable 'fs_devices' set but not used [-Wunused-but-set-variable]

It's not used after 6f32a50a232b ("btrfs: combine device update operations
during transaction commit")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/btrfs/volumes.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index afafc92e70e9..605230482009 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -2821,7 +2821,6 @@ int btrfs_grow_device(struct btrfs_trans_handle *trans,
 {
 	struct btrfs_fs_info *fs_info = device->fs_info;
 	struct btrfs_super_block *super_copy = fs_info->super_copy;
-	struct btrfs_fs_devices *fs_devices;
 	u64 old_total;
 	u64 diff;
 
@@ -2840,8 +2839,6 @@ int btrfs_grow_device(struct btrfs_trans_handle *trans,
 		return -EINVAL;
 	}
 
-	fs_devices = fs_info->fs_devices;
-
 	btrfs_set_super_total_bytes(super_copy,
 			round_down(old_total + diff, fs_info->sectorsize));
 	device->fs_devices->total_rw_bytes += diff;
