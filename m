From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Dec 2019 11:24:58 +0000
Subject: [PATCH v2] btrfs: Fix btrfs_find_create_tree_block() testing
Message-Id: <20191203112457.GF1787@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20191203110408.GA30629@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>
Cc: David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mike Rapoport <rppt@linux.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The btrfs_find_create_tree_block() uses alloc_test_extent_buffer() for
testing and alloc_extent_buffer() for production.  The problem is that
the test code returns NULL and the production code returns error
pointers.  The callers only check for error pointers.

I have changed alloc_test_extent_buffer() to return error pointers and
updated the two callers which use it directly.

Fixes: faa2dbf004e8 ("Btrfs: add sanity tests for new qgroup accounting code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Correct the commit message.  alloc_test_extent_buffer() instead of
alloc_dummy_extent_buffer().

 fs/btrfs/extent_io.c                   | 6 ++++--
 fs/btrfs/tests/free-space-tree-tests.c | 4 ++--
 fs/btrfs/tests/qgroup-tests.c          | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index eb8bd0258360..2f4802f405a2 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -5074,12 +5074,14 @@ struct extent_buffer *alloc_test_extent_buffer(struct btrfs_fs_info *fs_info,
 		return eb;
 	eb = alloc_dummy_extent_buffer(fs_info, start);
 	if (!eb)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	eb->fs_info = fs_info;
 again:
 	ret = radix_tree_preload(GFP_NOFS);
-	if (ret)
+	if (ret) {
+		exists = ERR_PTR(ret);
 		goto free_eb;
+	}
 	spin_lock(&fs_info->buffer_lock);
 	ret = radix_tree_insert(&fs_info->buffer_radix,
 				start >> PAGE_SHIFT, eb);
diff --git a/fs/btrfs/tests/free-space-tree-tests.c b/fs/btrfs/tests/free-space-tree-tests.c
index 1a846bf6e197..914eea5ba6a7 100644
--- a/fs/btrfs/tests/free-space-tree-tests.c
+++ b/fs/btrfs/tests/free-space-tree-tests.c
@@ -452,9 +452,9 @@ static int run_test(test_func_t test_func, int bitmaps, u32 sectorsize,
 	root->fs_info->tree_root = root;
 
 	root->node = alloc_test_extent_buffer(root->fs_info, nodesize);
-	if (!root->node) {
+	if (IS_ERR(root->node)) {
 		test_std_err(TEST_ALLOC_EXTENT_BUFFER);
-		ret = -ENOMEM;
+		ret = PTR_ERR(root->node);
 		goto out;
 	}
 	btrfs_set_header_level(root->node, 0);
diff --git a/fs/btrfs/tests/qgroup-tests.c b/fs/btrfs/tests/qgroup-tests.c
index 09aaca1efd62..ac035a6fa003 100644
--- a/fs/btrfs/tests/qgroup-tests.c
+++ b/fs/btrfs/tests/qgroup-tests.c
@@ -484,9 +484,9 @@ int btrfs_test_qgroups(u32 sectorsize, u32 nodesize)
 	 * *cough*backref walking code*cough*
 	 */
 	root->node = alloc_test_extent_buffer(root->fs_info, nodesize);
-	if (!root->node) {
+	if (IS_ERR(root->node)) {
 		test_err("couldn't allocate dummy buffer");
-		ret = -ENOMEM;
+		ret = PTR_ERR(root->node);
 		goto out;
 	}
 	btrfs_set_header_level(root->node, 0);
-- 
2.11.0
