From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Mar 2017 10:24:55 +0000
Subject: [PATCH] block: make nr_iovecs unsigned in bio_alloc_bioset()
Message-Id: <20170323102455.GA20154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@fb.com>
Cc: Ming Lei <tom.leiming@gmail.com>, Mike Christie <mchristi@redhat.com>, Kent Overstreet <kent.overstreet@gmail.com>, Hannes Reinecke <hare@suse.com>, Chaitanya Kulkarni <chaitanya.kulkarni@hgst.com>, Mike Snitzer <snitzer@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

There isn't a bug here, but Smatch is not smart enough to know that
"nr_iovecs" can't be negative so it complains about underflows.
Really, it's slightly cleaner to make this parameter unsigned.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/linux/bio.h b/include/linux/bio.h
index 8e521194f6fc..4931756d86d9 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -383,7 +383,7 @@ extern struct bio_set *bioset_create_nobvec(unsigned int, unsigned int);
 extern void bioset_free(struct bio_set *);
 extern mempool_t *biovec_create_pool(int pool_entries);
 
-extern struct bio *bio_alloc_bioset(gfp_t, int, struct bio_set *);
+extern struct bio *bio_alloc_bioset(gfp_t, unsigned int, struct bio_set *);
 extern void bio_put(struct bio *);
 
 extern void __bio_clone_fast(struct bio *, struct bio *);
diff --git a/block/bio.c b/block/bio.c
index e75878f8b14a..6194a8cf2aab 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -427,7 +427,8 @@ static void punt_bios_to_rescuer(struct bio_set *bs)
  *   RETURNS:
  *   Pointer to new bio on success, NULL on failure.
  */
-struct bio *bio_alloc_bioset(gfp_t gfp_mask, int nr_iovecs, struct bio_set *bs)
+struct bio *bio_alloc_bioset(gfp_t gfp_mask, unsigned int nr_iovecs,
+			     struct bio_set *bs)
 {
 	gfp_t saved_gfp = gfp_mask;
 	unsigned front_pad;
