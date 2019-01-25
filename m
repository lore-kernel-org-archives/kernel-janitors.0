From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 25 Jan 2019 01:50:09 +0000
Subject: [PATCH -next] btrfs: qgroup: Fix inconsistent IS_ERR and PTR_ERR
Message-Id: <1548381009-80383-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Change the call to PTR_ERR to access the value just tested by IS_ERR.

Fixes: 2b35a512e9cf ("btrfs: qgroup: Use delayed subtree rescan for balance")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/btrfs/qgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
index 8559ed9..16d7ec8 100644
--- a/fs/btrfs/qgroup.c
+++ b/fs/btrfs/qgroup.c
@@ -3931,7 +3931,7 @@ int btrfs_qgroup_trace_subtree_after_cow(struct btrfs_trans_handle *trans,
 				   block->reloc_generation, block->level,
 				   &block->first_key);
 	if (IS_ERR(reloc_eb)) {
-		ret = PTR_ERR(subv_eb);
+		ret = PTR_ERR(reloc_eb);
 		reloc_eb = NULL;
 		goto free_out;
 	}
