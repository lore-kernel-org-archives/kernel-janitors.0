From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Aug 2019 09:58:14 +0000
Subject: [PATCH] dm zoned: Potential NULL dereference in dmz_do_reclaim()
Message-Id: <20190819095814.GA19905@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair Kergon <agk@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>
Cc: dm-devel@redhat.com, kernel-janitors@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>

This function is supposed to return error pointers so it matches the
dmz_get_rnd_zone_for_reclaim() function.  The current code could lead to
a NULL dereference in dmz_do_reclaim()

Fixes: b234c6d7a703 ("dm zoned: improve error handling in reclaim")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/md/dm-zoned-metadata.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 2a5bc51fd6d5..595a73110e17 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1588,7 +1588,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
 	struct dm_zone *zone;
 
 	if (list_empty(&zmd->map_seq_list))
-		return NULL;
+		return ERR_PTR(-EBUSY);
 
 	list_for_each_entry(zone, &zmd->map_seq_list, link) {
 		if (!zone->bzone)
@@ -1597,7 +1597,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
 			return zone;
 	}
 
-	return NULL;
+	return ERR_PTR(-EBUSY);
 }
 
 /*
-- 
2.20.1
