From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Sep 2016 17:00:45 +0000
Subject: [PATCH 13/16] md/bitmap: Adjust checks for null pointers in 11 functions
Message-Id: <f379e7a5-e380-2fe5-8ee3-b74db4aba86f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <30938c84-20a7-0f13-bdda-a2d2109a6dac@users.sourceforge.net>
In-Reply-To: <30938c84-20a7-0f13-bdda-a2d2109a6dac@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-raid@vger.kernel.org, Shaohua Li <shli@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Sep 2016 17:40:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" can point information out like the following.

Comparison to NULL could be written !=85

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/bitmap.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
index e7a7fc8..f8900cc 100644
--- a/drivers/md/bitmap.c
+++ b/drivers/md/bitmap.c
@@ -88,7 +88,7 @@ __acquires(bitmap->lock)
 	mappage =3D kzalloc(PAGE_SIZE, GFP_NOIO);
 	spin_lock_irq(&bitmap->lock);
=20
-	if (mappage =3D NULL) {
+	if (!mappage) {
 		pr_debug("md/bitmap: map page allocation failed, hijacking\n");
 		/* We don't support hijack for cluster raid */
 		if (no_hijack)
@@ -186,7 +186,7 @@ static struct md_rdev *next_active_rdev(struct md_rdev =
*rdev, struct mddev *mdde
 	 * list_for_each_entry_continue_rcu() to find the first entry.
 	 */
 	rcu_read_lock();
-	if (rdev =3D NULL)
+	if (!rdev)
 		/* start at the beginning */
 		rdev =3D list_entry(&mddev->disks, struct md_rdev, same_set);
 	else {
@@ -284,7 +284,7 @@ static void write_page(struct bitmap *bitmap, struct pa=
ge *page, int wait)
 {
 	struct buffer_head *bh;
=20
-	if (bitmap->storage.file =3D NULL) {
+	if (!bitmap->storage.file) {
 		switch (write_sb_page(bitmap, page, wait)) {
 		case -EINVAL:
 			set_bit(BITMAP_WRITE_ERROR, &bitmap->flags);
@@ -493,7 +493,7 @@ static int bitmap_new_disk_sb(struct bitmap *bitmap)
 	unsigned long chunksize, daemon_sleep, write_behind;
=20
 	bitmap->storage.sb_page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
-	if (bitmap->storage.sb_page =3D NULL)
+	if (!bitmap->storage.sb_page)
 		return -ENOMEM;
 	bitmap->storage.sb_page->index =3D 0;
=20
@@ -767,7 +767,7 @@ static int bitmap_storage_alloc(struct bitmap_storage *=
store,
=20
 	if (with_super && !store->sb_page) {
 		store->sb_page =3D alloc_page(GFP_KERNEL|__GFP_ZERO);
-		if (store->sb_page =3D NULL)
+		if (!store->sb_page)
 			return -ENOMEM;
 	}
=20
@@ -1209,7 +1209,7 @@ void bitmap_daemon_work(struct mddev *mddev)
 	 */
 	mutex_lock(&mddev->bitmap_info.mutex);
 	bitmap =3D mddev->bitmap;
-	if (bitmap =3D NULL) {
+	if (!bitmap) {
 		mutex_unlock(&mddev->bitmap_info.mutex);
 		return;
 	}
@@ -1336,7 +1336,7 @@ __acquires(bitmap->lock)
 	err =3D bitmap_checkpage(bitmap, page, create, 0);
=20
 	if (bitmap->bp[page].hijacked ||
-	    bitmap->bp[page].map =3D NULL)
+	    !bitmap->bp[page].map)
 		csize =3D ((sector_t)1) << (bitmap->chunkshift +
 					  PAGE_COUNTER_SHIFT - 1);
 	else
@@ -1481,7 +1481,7 @@ static int __bitmap_start_sync(struct bitmap *bitmap,=
 sector_t offset, sector_t
 {
 	bitmap_counter_t *bmc;
 	int rv;
-	if (bitmap =3D NULL) {/* FIXME or bitmap set as 'failed' */
+	if (!bitmap) {/* FIXME or bitmap set as 'failed' */
 		*blocks =3D 1024;
 		return 1; /* always resync if no bitmap */
 	}
@@ -1533,13 +1533,13 @@ void bitmap_end_sync(struct bitmap *bitmap, sector_=
t offset, sector_t *blocks, i
 	bitmap_counter_t *bmc;
 	unsigned long flags;
=20
-	if (bitmap =3D NULL) {
+	if (!bitmap) {
 		*blocks =3D 1024;
 		return;
 	}
 	spin_lock_irqsave(&bitmap->counts.lock, flags);
 	bmc =3D bitmap_get_counter(&bitmap->counts, offset, blocks, 0);
-	if (bmc =3D NULL)
+	if (!bmc)
 		goto unlock;
 	/* locked */
 	if (RESYNC(*bmc)) {
@@ -2455,7 +2455,7 @@ static ssize_t can_clear_show(struct mddev *mddev, ch=
ar *page)
=20
 static ssize_t can_clear_store(struct mddev *mddev, const char *buf, size_=
t len)
 {
-	if (mddev->bitmap =3D NULL)
+	if (!mddev->bitmap)
 		return -ENOENT;
 	if (strncmp(buf, "false", 5) =3D 0)
 		mddev->bitmap->need_sync =3D 1;
@@ -2476,7 +2476,7 @@ behind_writes_used_show(struct mddev *mddev, char *pa=
ge)
 {
 	ssize_t ret;
 	spin_lock(&mddev->lock);
-	if (mddev->bitmap =3D NULL)
+	if (!mddev->bitmap)
 		ret =3D sprintf(page, "0\n");
 	else
 		ret =3D sprintf(page, "%lu\n",
--=20
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
