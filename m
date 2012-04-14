From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Apr 2012 09:24:33 +0000
Subject: [PATCH] fs/btrfs/volumes.c: add missing free_fs_devices
Message-Id: <1334395473-16667-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Free fs_devices as done in the error-handling code just below.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/btrfs/volumes.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index a872b48..5d246c3 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -4334,8 +4334,10 @@ static int open_seed_devices(struct btrfs_root *root, u8 *fsid)
 
 	ret = __btrfs_open_devices(fs_devices, FMODE_READ,
 				   root->fs_info->bdev_holder);
-	if (ret)
+	if (ret) {
+		free_fs_devices(fs_devices);
 		goto out;
+	}
 
 	if (!fs_devices->seeding) {
 		__btrfs_close_devices(fs_devices);

