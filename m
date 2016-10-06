From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Oct 2016 09:51:05 +0000
Subject: [PATCH 51/54] md/raid10: Adjust 22 checks for null pointers
Message-Id: <34060cc2-82f8-942d-7b2a-ca20f2424b58@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <786843ef-4b6f-eb04-7326-2f6f5b408826@users.sourceforge.net>
In-Reply-To: <786843ef-4b6f-eb04-7326-2f6f5b408826@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-raid@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Guoqing Jiang <gqjiang@suse.com>, Jens Axboe <axboe@fb.com>, Mike Christie <mchristi@redhat.com>, Neil Brown <neilb@suse.com>, Shaohua Li <shli@kernel.org>, Tomasz Majchrzak <tomasz.majchrzak@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 5 Oct 2016 21:36:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written =E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/raid10.c | 43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 2181f53..82d79f5 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -734,10 +734,10 @@ static struct md_rdev *read_balance(struct r10conf *c=
onf,
 			continue;
 		disk =3D r10_bio->devs[slot].devnum;
 		rdev =3D rcu_dereference(conf->mirrors[disk].replacement);
-		if (rdev =3D NULL || test_bit(Faulty, &rdev->flags) ||
+		if (!rdev || test_bit(Faulty, &rdev->flags) ||
 		    r10_bio->devs[slot].addr + sectors > rdev->recovery_offset)
 			rdev =3D rcu_dereference(conf->mirrors[disk].rdev);
-		if (rdev =3D NULL ||
+		if (!rdev ||
 		    test_bit(Faulty, &rdev->flags))
 			continue;
 		if (!test_bit(In_sync, &rdev->flags) &&
@@ -1386,7 +1386,8 @@ static void __make_request(struct mddev *mddev, struc=
t bio *bio)
=20
 		if (r10_bio->devs[i].repl_bio) {
 			struct md_rdev *rdev =3D conf->mirrors[d].replacement;
-			if (rdev =3D NULL) {
+
+			if (!rdev) {
 				/* Replacement just got moved to main 'rdev' */
 				smp_mb();
 				rdev =3D conf->mirrors[d].rdev;
@@ -1701,7 +1702,7 @@ static int raid10_add_disk(struct mddev *mddev, struc=
t md_rdev *rdev)
 		first =3D last =3D rdev->raid_disk;
=20
 	if (rdev->saved_raid_disk >=3D first &&
-	    conf->mirrors[rdev->saved_raid_disk].rdev =3D NULL)
+	    !conf->mirrors[rdev->saved_raid_disk].rdev)
 		mirror =3D rdev->saved_raid_disk;
 	else
 		mirror =3D first;
@@ -1711,7 +1712,7 @@ static int raid10_add_disk(struct mddev *mddev, struc=
t md_rdev *rdev)
 			continue;
 		if (p->rdev) {
 			if (!test_bit(WantReplacement, &p->rdev->flags) ||
-			    p->replacement !=3D NULL)
+			    p->replacement)
 				continue;
 			clear_bit(In_sync, &rdev->flags);
 			set_bit(Replacement, &rdev->flags);
@@ -1849,7 +1850,7 @@ static void end_sync_request(struct r10bio *r10_bio)
 	struct mddev *mddev =3D r10_bio->mddev;
=20
 	while (atomic_dec_and_test(&r10_bio->remaining)) {
-		if (r10_bio->master_bio =3D NULL) {
+		if (!r10_bio->master_bio) {
 			/* the primary of several recovery bios */
 			sector_t s =3D r10_bio->sectors;
 			if (test_bit(R10BIO_MadeGood, &r10_bio->state) ||
@@ -2515,7 +2516,7 @@ static void handle_read_error(struct mddev *mddev, st=
ruct r10bio *r10_bio)
=20
 read_more:
 	rdev =3D read_balance(conf, r10_bio, &max_sectors);
-	if (rdev =3D NULL) {
+	if (!rdev) {
 		pr_alert("%s: %s: unrecoverable I/O read error for block %llu\n",
 			 mdname(mddev), b,
 			 (unsigned long long)r10_bio->sector);
@@ -2587,7 +2588,7 @@ static void handle_write_completed(struct r10conf *co=
nf, struct r10bio *r10_bio)
 		for (m =3D 0; m < conf->copies; m++) {
 			int dev =3D r10_bio->devs[m].devnum;
 			rdev =3D conf->mirrors[dev].rdev;
-			if (r10_bio->devs[m].bio =3D NULL)
+			if (!r10_bio->devs[m].bio)
 				continue;
 			if (!r10_bio->devs[m].bio->bi_error) {
 				rdev_clear_badblocks(
@@ -2602,7 +2603,7 @@ static void handle_write_completed(struct r10conf *co=
nf, struct r10bio *r10_bio)
 					md_error(conf->mddev, rdev);
 			}
 			rdev =3D conf->mirrors[dev].replacement;
-			if (r10_bio->devs[m].repl_bio =3D NULL)
+			if (!r10_bio->devs[m].repl_bio)
 				continue;
=20
 			if (!r10_bio->devs[m].repl_bio->bi_error) {
@@ -2631,7 +2632,7 @@ static void handle_write_completed(struct r10conf *co=
nf, struct r10bio *r10_bio)
 					r10_bio->devs[m].addr,
 					r10_bio->sectors, 0);
 				rdev_dec_pending(rdev, conf->mddev);
-			} else if (bio !=3D NULL && bio->bi_error) {
+			} else if (bio && bio->bi_error) {
 				fail =3D true;
 				if (!narrow_write_error(r10_bio, m)) {
 					md_error(conf->mddev, rdev);
@@ -2816,7 +2817,7 @@ static sector_t raid10_sync_request(struct mddev *mdd=
ev, sector_t sector_nr,
 	 * Allow skipping a full rebuild for incremental assembly
 	 * of a clean array, like RAID1 does.
 	 */
-	if (mddev->bitmap =3D NULL &&
+	if (!mddev->bitmap &&
 	    mddev->recovery_cp =3D MaxSector &&
 	    mddev->reshape_position =3D MaxSector &&
 	    !test_bit(MD_RECOVERY_SYNC, &mddev->recovery) &&
@@ -2945,10 +2946,10 @@ static sector_t raid10_sync_request(struct mddev *m=
ddev, sector_t sector_nr,
 			mrdev =3D rcu_dereference(mirror->rdev);
 			mreplace =3D rcu_dereference(mirror->replacement);
=20
-			if ((mrdev =3D NULL ||
+			if ((!mrdev ||
 			     test_bit(Faulty, &mrdev->flags) ||
 			     test_bit(In_sync, &mrdev->flags)) &&
-			    (mreplace =3D NULL ||
+			    (!mreplace ||
 			     test_bit(Faulty, &mreplace->flags))) {
 				rcu_read_unlock();
 				continue;
@@ -2976,7 +2977,7 @@ static sector_t raid10_sync_request(struct mddev *mdd=
ev, sector_t sector_nr,
 			if (sync_blocks < max_sync)
 				max_sync =3D sync_blocks;
 			if (!must_sync &&
-			    mreplace =3D NULL &&
+			    !mreplace &&
 			    !conf->fullsync) {
 				/* yep, skip the sync_blocks here, but don't assume
 				 * that there will never be anything to do here
@@ -3011,7 +3012,7 @@ static sector_t raid10_sync_request(struct mddev *mdd=
ev, sector_t sector_nr,
 			for (j =3D 0; j < conf->geo.raid_disks; j++) {
 				struct md_rdev *rdev =3D rcu_dereference(
 					conf->mirrors[j].rdev);
-				if (rdev =3D NULL || test_bit(Faulty, &rdev->flags)) {
+				if (!rdev || test_bit(Faulty, &rdev->flags)) {
 					still_degraded =3D 1;
 					break;
 				}
@@ -3099,7 +3100,7 @@ static sector_t raid10_sync_request(struct mddev *mdd=
ev, sector_t sector_nr,
 				 * this comment keeps human reviewers
 				 * happy.
 				 */
-				if (mreplace =3D NULL || bio =3D NULL ||
+				if (!mreplace || !bio ||
 				    test_bit(Faulty, &mreplace->flags))
 					break;
 				bio_reset(bio);
@@ -3161,7 +3162,7 @@ static sector_t raid10_sync_request(struct mddev *mdd=
ev, sector_t sector_nr,
 			if (mreplace)
 				rdev_dec_pending(mreplace, mddev);
 		}
-		if (biolist =3D NULL) {
+		if (!biolist) {
 			while (r10_bio) {
 				struct r10bio *rb2 =3D r10_bio;
 				r10_bio =3D (struct r10bio*) rb2->master_bio;
@@ -3214,7 +3215,7 @@ static sector_t raid10_sync_request(struct mddev *mdd=
ev, sector_t sector_nr,
 			bio->bi_error =3D -EIO;
 			rcu_read_lock();
 			rdev =3D rcu_dereference(conf->mirrors[d].rdev);
-			if (rdev =3D NULL || test_bit(Faulty, &rdev->flags)) {
+			if (!rdev || test_bit(Faulty, &rdev->flags)) {
 				rcu_read_unlock();
 				continue;
 			}
@@ -3243,7 +3244,7 @@ static sector_t raid10_sync_request(struct mddev *mdd=
ev, sector_t sector_nr,
 			count++;
=20
 			rdev =3D rcu_dereference(conf->mirrors[d].replacement);
-			if (rdev =3D NULL || test_bit(Faulty, &rdev->flags)) {
+			if (!rdev || test_bit(Faulty, &rdev->flags)) {
 				rcu_read_unlock();
 				continue;
 			}
@@ -3565,7 +3566,7 @@ static int raid10_run(struct mddev *mddev)
 	int first =3D 1;
 	bool discard_supported =3D false;
=20
-	if (mddev->private =3D NULL) {
+	if (!mddev->private) {
 		conf =3D setup_conf(mddev);
 		if (IS_ERR(conf))
 			return PTR_ERR(conf);
@@ -4542,7 +4543,7 @@ static int handle_reshape_read_error(struct mddev *md=
dev,
 			int d =3D r10b->devs[slot].devnum;
 			struct md_rdev *rdev =3D rcu_dereference(conf->mirrors[d].rdev);
 			sector_t addr;
-			if (rdev =3D NULL ||
+			if (!rdev ||
 			    test_bit(Faulty, &rdev->flags) ||
 			    !test_bit(In_sync, &rdev->flags))
 				goto failed;
--=20
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
