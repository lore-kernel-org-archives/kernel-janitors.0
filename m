From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 20 Feb 2019 02:55:20 +0000
Subject: [PATCH -next] btrfs: Fix type conversion in btrfs_read_root_item
Message-Id: <20190220030840.188854-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

btrfs_item_size_nr return value is u32, convert it to int may result
in truncation.Also read_extent_buffer expect a unsigned param, so
min_t should use type u32 to compare.

Fixes: 8ea05e3a4262 ("Btrfs: introduce subvol uuids and times")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/btrfs/root-tree.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/root-tree.c b/fs/btrfs/root-tree.c
index 02d1a57af78b..893d12fbfda0 100644
--- a/fs/btrfs/root-tree.c
+++ b/fs/btrfs/root-tree.c
@@ -21,12 +21,12 @@ static void btrfs_read_root_item(struct extent_buffer *eb, int slot,
 				struct btrfs_root_item *item)
 {
 	uuid_le uuid;
-	int len;
+	u32 len;
 	int need_reset = 0;
 
 	len = btrfs_item_size_nr(eb, slot);
 	read_extent_buffer(eb, item, btrfs_item_ptr_offset(eb, slot),
-			min_t(int, len, (int)sizeof(*item)));
+			   min_t(u32, len, sizeof(*item)));
 	if (len < sizeof(*item))
 		need_reset = 1;
 	if (!need_reset && btrfs_root_generation(item)
