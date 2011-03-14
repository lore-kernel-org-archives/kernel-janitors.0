From: Dan Carpenter <error27@gmail.com>
Date: Mon, 14 Mar 2011 09:25:11 +0000
Subject: [patch] drbd: change int to unsigned int
Message-Id: <20110314092511.GK2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Ellenberg <drbd-dev@lists.linbit.com>
Cc: drbd-user@lists.linbit.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

These are changes to make my static checker happy.  I don't know the
code well enough to say if it makes a difference at run-time but it
doesn't hurt to fix these up.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index fe1564c..f33575c 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1383,7 +1383,7 @@ static int recv_dless_read(struct drbd_conf *mdev, struct drbd_request *req,
 	D_ASSERT(sector = bio->bi_sector);
 
 	bio_for_each_segment(bvec, bio, i) {
-		expect = min_t(int, data_size, bvec->bv_len);
+		expect = min_t(unsigned int, data_size, bvec->bv_len);
 		rr = drbd_recv(mdev,
 			     kmap(bvec->bv_page)+bvec->bv_offset,
 			     expect);
@@ -3996,7 +3996,7 @@ static int drbd_do_handshake(struct drbd_conf *mdev)
 	    PRO_VERSION_MIN > p->protocol_max)
 		goto incompat;
 
-	mdev->agreed_pro_version = min_t(int, PRO_VERSION_MAX, p->protocol_max);
+	mdev->agreed_pro_version = min_t(unsigned int, PRO_VERSION_MAX, p->protocol_max);
 
 	dev_info(DEV, "Handshake successful: "
 	     "Agreed network protocol version %d\n", mdev->agreed_pro_version);
@@ -4515,7 +4515,7 @@ struct asender_cmd {
 	int (*process)(struct drbd_conf *mdev, struct p_header80 *h);
 };
 
-static struct asender_cmd *get_asender_cmd(int cmd)
+static struct asender_cmd *get_asender_cmd(unsigned int cmd)
 {
 	static struct asender_cmd asender_tbl[] = {
 		/* anything missing from this table is in
