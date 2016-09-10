From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 20:32:17 +0000
Subject: [PATCH 09/13] DRBD-receiver: Improve determination of sizes in receive_SyncParam()
Message-Id: <334ae3df-8fff-025b-5311-af4522d9611f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
In-Reply-To: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 21:54:55 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/drbd/drbd_receiver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 2fe58d1..6fbd968 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3859,7 +3859,7 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 	mutex_lock(&connection->resource->conf_update);
 	old_net_conf = peer_device->connection->net_conf;
 	if (get_ldev(device)) {
-		new_disk_conf = kzalloc(sizeof(struct disk_conf), GFP_KERNEL);
+		new_disk_conf = kzalloc(sizeof(*new_disk_conf), GFP_KERNEL);
 		if (!new_disk_conf) {
 			put_ldev(device);
 			mutex_unlock(&connection->resource->conf_update);
@@ -3946,7 +3946,8 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 		}
 
 		if (verify_tfm || csums_tfm) {
-			new_net_conf = kzalloc(sizeof(struct net_conf), GFP_KERNEL);
+			new_net_conf = kzalloc(sizeof(*new_net_conf),
+					       GFP_KERNEL);
 			if (!new_net_conf) {
 				drbd_err(device, "Allocation of new net_conf failed\n");
 				goto disconnect;
-- 
2.10.0

