From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Oct 2016 09:15:51 +0000
Subject: [PATCH 18/54] md/raid1: Adjust 12 checks for null pointers
Message-Id: <125fd683-dab1-6e28-3955-20953d06fff4@users.sourceforge.net>
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
Date: Tue, 4 Oct 2016 18:55:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written =E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/raid1.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 958bf41..3a1194e 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -474,7 +474,7 @@ static void raid1_end_write_request(struct bio *bio)
 			}
 		}
 	}
-	if (r1_bio->bios[mirror] =3D NULL)
+	if (!r1_bio->bios[mirror])
 		rdev_dec_pending(rdev, conf->mddev);
=20
 	/*
@@ -549,7 +549,7 @@ static int read_balance(struct r1conf *conf, struct r1b=
io *r1_bio, int *max_sect
=20
 		rdev =3D rcu_dereference(conf->mirrors[disk].rdev);
 		if (r1_bio->bios[disk] =3D IO_BLOCKED
-		    || rdev =3D NULL
+		    || !rdev
 		    || test_bit(Faulty, &rdev->flags))
 			continue;
 		if (!test_bit(In_sync, &rdev->flags) &&
@@ -1582,7 +1582,7 @@ static int raid1_add_disk(struct mddev *mddev, struct=
 md_rdev *rdev)
 	 */
 	if (rdev->saved_raid_disk >=3D 0 &&
 	    rdev->saved_raid_disk >=3D first &&
-	    conf->mirrors[rdev->saved_raid_disk].rdev =3D NULL)
+	    !conf->mirrors[rdev->saved_raid_disk].rdev)
 		first =3D last =3D rdev->saved_raid_disk;
=20
 	for (mirror =3D first; mirror <=3D last; mirror++) {
@@ -1605,7 +1605,7 @@ static int raid1_add_disk(struct mddev *mddev, struct=
 md_rdev *rdev)
 			break;
 		}
 		if (test_bit(WantReplacement, &p->rdev->flags) &&
-		    p[conf->raid_disks].rdev =3D NULL) {
+		    !p[conf->raid_disks].rdev) {
 			/* Add this device as a replacement */
 			clear_bit(In_sync, &rdev->flags);
 			set_bit(Replacement, &rdev->flags);
@@ -2002,7 +2002,7 @@ static void sync_request_write(struct mddev *mddev, s=
truct r1bio *r1_bio)
 	atomic_set(&r1_bio->remaining, 1);
 	for (i =3D 0; i < disks ; i++) {
 		wbio =3D r1_bio->bios[i];
-		if (wbio->bi_end_io =3D NULL ||
+		if (!wbio->bi_end_io ||
 		    (wbio->bi_end_io =3D end_sync_read &&
 		     (i =3D r1_bio->read_disk ||
 		      !test_bit(MD_RECOVERY_SYNC, &mddev->recovery))))
@@ -2220,7 +2220,7 @@ static void handle_sync_write_finished(struct r1conf =
*conf, struct r1bio *r1_bio
 	for (m =3D 0; m < conf->raid_disks * 2 ; m++) {
 		struct md_rdev *rdev =3D conf->mirrors[m].rdev;
 		struct bio *bio =3D r1_bio->bios[m];
-		if (bio->bi_end_io =3D NULL)
+		if (!bio->bi_end_io)
 			continue;
 		if (!bio->bi_error &&
 		    test_bit(R1BIO_MadeGood, &r1_bio->state)) {
@@ -2247,7 +2247,7 @@ static void handle_write_finished(struct r1conf *conf=
, struct r1bio *r1_bio)
 					     r1_bio->sector,
 					     r1_bio->sectors, 0);
 			rdev_dec_pending(rdev, conf->mddev);
-		} else if (r1_bio->bios[m] !=3D NULL) {
+		} else if (r1_bio->bios[m]) {
 			/* This drive got a write error.  We need to
 			 * narrow down and record precise write
 			 * errors.
@@ -2509,7 +2509,7 @@ static sector_t raid1_sync_request(struct mddev *mdde=
v, sector_t sector_nr,
 		return 0;
 	}
=20
-	if (mddev->bitmap =3D NULL &&
+	if (!mddev->bitmap &&
 	    mddev->recovery_cp =3D MaxSector &&
 	    !test_bit(MD_RECOVERY_REQUESTED, &mddev->recovery) &&
 	    conf->fullsync =3D 0) {
@@ -2564,7 +2564,7 @@ static sector_t raid1_sync_request(struct mddev *mdde=
v, sector_t sector_nr,
 		bio_reset(bio);
=20
 		rdev =3D rcu_dereference(conf->mirrors[i].rdev);
-		if (rdev =3D NULL ||
+		if (!rdev ||
 		    test_bit(Faulty, &rdev->flags)) {
 			if (i < conf->raid_disks)
 				still_degraded =3D 1;
@@ -2710,7 +2710,7 @@ static sector_t raid1_sync_request(struct mddev *mdde=
v, sector_t sector_nr,
 					while (i > 0) {
 						i--;
 						bio =3D r1_bio->bios[i];
-						if (bio->bi_end_io=3DNULL)
+						if (!bio->bi_end_io)
 							continue;
 						/* remove last page from this bio */
 						bio->bi_vcnt--;
@@ -2924,7 +2924,7 @@ static int raid1_run(struct mddev *mddev)
 	 * bookkeeping area. [whatever we allocate in run(),
 	 * should be freed in raid1_free()]
 	 */
-	if (mddev->private =3D NULL)
+	if (!mddev->private)
 		conf =3D setup_conf(mddev);
 	else
 		conf =3D mddev->private;
@@ -2946,7 +2946,7 @@ static int raid1_run(struct mddev *mddev)
=20
 	mddev->degraded =3D 0;
 	for (i=3D0; i < conf->raid_disks; i++)
-		if (conf->mirrors[i].rdev =3D NULL ||
+		if (!conf->mirrors[i].rdev ||
 		    !test_bit(In_sync, &conf->mirrors[i].rdev->flags) ||
 		    test_bit(Faulty, &conf->mirrors[i].rdev->flags))
 			mddev->degraded++;
--=20
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
