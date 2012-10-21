From: Anna Leuschner <anna.m.leuschner@gmail.com>
Date: Sun, 21 Oct 2012 20:33:29 +0000
Subject: [PATCH] vfs: fix: don't increase bio_slab_max if krealloc() fails
Message-Id: <1350851609-10541-1-git-send-email-anna.m.leuschner@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, Anna Leuschner <anna.m.leuschner@gmail.com>

bio.c: fix: don't increase bio_slab_max if krealloc() of bio_slabs fails

Signed-off-by: Anna Leuschner <anna.m.leuschner@gmail.com>
---
 fs/bio.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/bio.c b/fs/bio.c
index 9298c65..b96fc6c 100644
--- a/fs/bio.c
+++ b/fs/bio.c
@@ -75,6 +75,7 @@ static struct kmem_cache *bio_find_or_create_slab(unsigned int extra_size)
 	unsigned int sz = sizeof(struct bio) + extra_size;
 	struct kmem_cache *slab = NULL;
 	struct bio_slab *bslab, *new_bio_slabs;
+	unsigned int new_bio_slab_max;
 	unsigned int i, entry = -1;
 
 	mutex_lock(&bio_slab_lock);
@@ -97,12 +98,13 @@ static struct kmem_cache *bio_find_or_create_slab(unsigned int extra_size)
 		goto out_unlock;
 
 	if (bio_slab_nr = bio_slab_max && entry = -1) {
-		bio_slab_max <<= 1;
+		new_bio_slab_max = bio_slab_max << 1;
 		new_bio_slabs = krealloc(bio_slabs,
-					 bio_slab_max * sizeof(struct bio_slab),
+					 new_bio_slab_max * sizeof(struct bio_slab),
 					 GFP_KERNEL);
 		if (!new_bio_slabs)
 			goto out_unlock;
+		bio_slab_max = new_bio_slab_max;
 		bio_slabs = new_bio_slabs;
 	}
 	if (entry = -1)
-- 
1.7.10.4

