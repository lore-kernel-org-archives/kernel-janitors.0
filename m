From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Jun 2020 16:02:54 +0000
Subject: [PATCH][next] dm zoned: fix memory leak of newly allocated zone on xa_insert failure
Message-Id: <20200603160254.142222-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>, Hannes Reinecke <hare@suse.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if an xa_insert fails then there is a memory lead of the
recently allocated zone object. Fix this by kfree'ing zone before
returning on the error return path.

Addresses-Coverity: ("Resource leak")
Fixes: 1a311efa3916 ("dm zoned: convert to xarray")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/md/dm-zoned-metadata.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index b23ff090c056..130b5a6d9f12 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -313,8 +313,10 @@ static struct dm_zone *dmz_insert(struct dmz_metadata *zmd,
 	if (!zone)
 		return ERR_PTR(-ENOMEM);
 
-	if (xa_insert(&zmd->zones, zone_id, zone, GFP_KERNEL))
+	if (xa_insert(&zmd->zones, zone_id, zone, GFP_KERNEL)) {
+		kfree(zone);
 		return ERR_PTR(-EBUSY);
+	}
 
 	INIT_LIST_HEAD(&zone->link);
 	atomic_set(&zone->refcount, 0);
-- 
2.25.1
