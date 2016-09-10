From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 20:33:28 +0000
Subject: [PATCH 10/13] DRBD-receiver: Delete error messages for failed resource allocations in receive_SyncPa
Message-Id: <d5fb9e20-538f-b6d7-68a2-4b1b30207110@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
In-Reply-To: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 22:00:10 +0200

Omit three messages for memory allocation failures in this function.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/drbd/drbd_receiver.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 6fbd968..3e1315a 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3863,7 +3863,6 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 		if (!new_disk_conf) {
 			put_ldev(device);
 			mutex_unlock(&connection->resource->conf_update);
-			drbd_err(device, "Allocation of new disk_conf failed\n");
 			return -ENOMEM;
 		}
 
@@ -3938,7 +3937,6 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 			if (fifo_size != device->rs_plan_s->size) {
 				new_plan = fifo_alloc(fifo_size);
 				if (!new_plan) {
-					drbd_err(device, "kmalloc of fifo_buffer failed");
 					put_ldev(device);
 					goto disconnect;
 				}
@@ -3948,10 +3946,8 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 		if (verify_tfm || csums_tfm) {
 			new_net_conf = kzalloc(sizeof(*new_net_conf),
 					       GFP_KERNEL);
-			if (!new_net_conf) {
-				drbd_err(device, "Allocation of new net_conf failed\n");
+			if (!new_net_conf)
 				goto disconnect;
-			}
 
 			*new_net_conf = *old_net_conf;
 
-- 
2.10.0

