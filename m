From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 10 Sep 2017 11:19:38 +0000
Subject: [PATCH] btrfs: tests: Fix a memory leak in error handling path in 'run_test()'
Message-Id: <20170910111938.15201-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: clm@fb.com, jbacik@fb.com, dsterba@suse.com, nborisov@suse.com, jeffm@suse.com, osandov@fb.com
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'btrfs_alloc_path()' fails, we must free the resourses already
allocated, as done in the other error handling paths in this function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/btrfs/tests/free-space-tree-tests.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/tests/free-space-tree-tests.c b/fs/btrfs/tests/free-space-tree-tests.c
index 1458bb0ea124..8444a018cca2 100644
--- a/fs/btrfs/tests/free-space-tree-tests.c
+++ b/fs/btrfs/tests/free-space-tree-tests.c
@@ -500,7 +500,8 @@ static int run_test(test_func_t test_func, int bitmaps, u32 sectorsize,
 	path = btrfs_alloc_path();
 	if (!path) {
 		test_msg("Couldn't allocate path\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out;
 	}
 
 	ret = add_block_group_free_space(&trans, root->fs_info, cache);
-- 
2.11.0

