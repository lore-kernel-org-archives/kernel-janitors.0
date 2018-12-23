From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Dec 2018 08:57:06 +0000
Subject: [PATCH 11/20] Btrfs: drop useless LIST_HEAD
Message-Id: <1545555435-24576-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>
Cc: kernel-janitors@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org

Drop LIST_HEAD where the variable it declares is never used.

The uses were removed in 3fd0a5585eb9 ("Btrfs: Metadata ENOSPC
handling for balance"), but not the declaration.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
@@
- LIST_HEAD(x);
  ... when != x
// </smpl>

Fixes: 3fd0a5585eb9 ("Btrfs: Metadata ENOSPC handling for balance")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Successfully 0-day tested on 151 configurations.

 fs/btrfs/relocation.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/btrfs/relocation.c b/fs/btrfs/relocation.c
index 272b287f8cf0..de802ba35a34 100644
--- a/fs/btrfs/relocation.c
+++ b/fs/btrfs/relocation.c
@@ -2128,7 +2128,6 @@ static noinline_for_stack int merge_reloc_root(struct reloc_control *rc,
 					       struct btrfs_root *root)
 {
 	struct btrfs_fs_info *fs_info = rc->extent_root->fs_info;
-	LIST_HEAD(inode_list);
 	struct btrfs_key key;
 	struct btrfs_key next_key;
 	struct btrfs_trans_handle *trans = NULL;
