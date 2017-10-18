From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Oct 2017 07:36:35 +0000
Subject: [PATCH] Btrfs: ref-verify: Fix NULL vs IS_ERR() check in walk_down_tree()
Message-Id: <20171018073635.cajusx7hzkg4ghgc@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

read_tree_block() returns error pointers, and never NULL and so I have
updated the error handling.

Fixes: 74739121b4c7 ("Btrfs: add a extent ref verify tool")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/ref-verify.c b/fs/btrfs/ref-verify.c
index f65d78cf3c7e..34878699d363 100644
--- a/fs/btrfs/ref-verify.c
+++ b/fs/btrfs/ref-verify.c
@@ -584,7 +584,9 @@ static int walk_down_tree(struct btrfs_root *root, struct btrfs_path *path,
 			gen = btrfs_node_ptr_generation(path->nodes[level],
 							path->slots[level]);
 			eb = read_tree_block(fs_info, block_bytenr, gen);
-			if (!eb || !extent_buffer_uptodate(eb)) {
+			if (IS_ERR(eb))
+				return PTR_ERR(eb);
+			if (!extent_buffer_uptodate(eb)) {
 				free_extent_buffer(eb);
 				return -EIO;
 			}
