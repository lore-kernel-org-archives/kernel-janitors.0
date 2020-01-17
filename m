From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Jan 2020 05:34:32 +0000
Subject: [PATCH] btrfs: tests: Fix an NULL vs IS_ERR() test
Message-Id: <20200117053432.k46ftoqf67dezauh@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Nikolay Borisov <nborisov@suse.com>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The btrfs_alloc_dummy_device() function never returns NULL, it returns
error pointers.

Fixes: 5d9a4f871168 ("btrfs: Add self-tests for btrfs_rmap_block")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/btrfs/tests/extent-map-tests.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/tests/extent-map-tests.c b/fs/btrfs/tests/extent-map-tests.c
index b7f2c4398e92..70a2f0dc9a78 100644
--- a/fs/btrfs/tests/extent-map-tests.c
+++ b/fs/btrfs/tests/extent-map-tests.c
@@ -490,9 +490,9 @@ static int test_rmap_block(struct btrfs_fs_info *fs_info,
 	for (i = 0; i < map->num_stripes; i++) {
 		struct btrfs_device *dev = btrfs_alloc_dummy_device(fs_info);
 
-		if (!dev) {
+		if (IS_ERR(dev)) {
 			test_err("cannot allocate device");
-			ret = -ENOMEM;
+			ret = PTR_ERR(dev);
 			goto out;
 		}
 		map->stripes[i].dev = dev;
-- 
2.11.0
