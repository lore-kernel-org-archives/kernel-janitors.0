From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Dec 2015 18:09:18 +0000
Subject: [PATCH 2/5] block-LDM: Delete extra log messages for memory allocation failures
Message-Id: <567AE34E.9000008@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567A6CDB.4030703@users.sourceforge.net>
 <alpine.DEB.2.10.1512231140090.4367@hadrien>
 <567AE1C6.9020108@users.sourceforge.net>
In-Reply-To: <567AE1C6.9020108@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ntfs-dev@lists.sourceforge.net, linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Richard Russon <ldm@flatcap.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Dec 2015 13:21:01 +0100

A failed call of the kmalloc() function can generate appropriate
information about insufficient memory already.
Thus remove unnecessary log messages for such failures.

Suggested-by: Julia Lawall <julia.lawall@lip6.fr>
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 block/partitions/ldm.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/block/partitions/ldm.c b/block/partitions/ldm.c
index a50385c..856658a 100644
--- a/block/partitions/ldm.c
+++ b/block/partitions/ldm.c
@@ -343,10 +343,8 @@ static bool ldm_validate_privheads(struct parsed_partitions *state,
 
 	ph[1] = kmalloc (sizeof (*ph[1]), GFP_KERNEL);
 	ph[2] = kmalloc (sizeof (*ph[2]), GFP_KERNEL);
-	if (!ph[1] || !ph[2]) {
-		ldm_crit ("Out of memory.");
+	if (!ph[1] || !ph[2])
 		goto out;
-	}
 
 	/* off[1 & 2] are relative to ph[0]->config_start */
 	ph[0]->config_start = 0;
@@ -431,10 +429,8 @@ static bool ldm_validate_tocblocks(struct parsed_partitions *state,
 	ph = &ldb->ph;
 	tb[0] = &ldb->toc;
 	tb[1] = kmalloc(sizeof(*tb[1]) * 3, GFP_KERNEL);
-	if (!tb[1]) {
-		ldm_crit("Out of memory.");
+	if (!tb[1])
 		return false;
-	}
 	tb[2] = (struct tocblock*)((u8*)tb[1] + sizeof(*tb[1]));
 	tb[3] = (struct tocblock*)((u8*)tb[2] + sizeof(*tb[2]));
 	/*
@@ -1239,10 +1235,8 @@ static bool ldm_ldmdb_add (u8 *data, int len, struct ldmdb *ldb)
 	BUG_ON (!data || !ldb);
 
 	vb = kmalloc (sizeof (*vb), GFP_KERNEL);
-	if (!vb) {
-		ldm_crit ("Out of memory.");
+	if (!vb)
 		return false;
-	}
 
 	if (!ldm_parse_vblk (data, len, vb)) {
 		kfree(vb);
@@ -1325,10 +1319,8 @@ static bool ldm_frag_add (const u8 *data, int size, struct list_head *frags)
 	}
 
 	f = kmalloc (sizeof (*f) + size*num, GFP_KERNEL);
-	if (!f) {
-		ldm_crit ("Out of memory.");
+	if (!f)
 		return false;
-	}
 
 	f->group = group;
 	f->num   = num;
@@ -1519,10 +1511,8 @@ int ldm_partition(struct parsed_partitions *state)
 		return 0;
 
 	ldb = kmalloc (sizeof (*ldb), GFP_KERNEL);
-	if (!ldb) {
-		ldm_crit ("Out of memory.");
+	if (!ldb)
 		goto out;
-	}
 
 	/* Parse and check privheads. */
 	if (!ldm_validate_privheads(state, &ldb->ph))
-- 
2.6.3

