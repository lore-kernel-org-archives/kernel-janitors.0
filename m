From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 20:31:08 +0000
Subject: [PATCH 08/13] DRBD-receiver: Move an assignment in receive_sizes()
Message-Id: <59238c49-0c8a-fa28-4a4b-2d3924968acb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
In-Reply-To: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 21:50:18 +0200

Move one assignment for the local variable "ldsc" so that its setting
will only be performed after corresponding data processing succeeded
by this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/drbd/drbd_receiver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 6a9c16e..2fe58d1 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -4036,7 +4036,7 @@ static int receive_sizes(struct drbd_connection *connection, struct packet_info
 	struct o_qlim *o = (connection->agreed_features & DRBD_FF_WSAME) ? p->qlim : NULL;
 	enum determine_dev_size dd = DS_UNCHANGED;
 	sector_t p_size, p_usize, p_csize, my_usize;
-	int ldsc = 0; /* local disk size changed */
+	int ldsc; /* local disk size changed */
 	enum dds_flags ddsf;
 
 	peer_device = conn_peer_device(connection, pi->vnr);
@@ -4141,6 +4141,7 @@ static int receive_sizes(struct drbd_connection *connection, struct packet_info
 		drbd_set_my_capacity(device, p_csize ?: p_usize ?: p_size);
 	}
 
+	ldsc = 0;
 	if (get_ldev(device)) {
 		if (device->ldev->known_size != drbd_get_capacity(device->ldev->backing_bdev)) {
 			device->ldev->known_size = drbd_get_capacity(device->ldev->backing_bdev);
-- 
2.10.0

