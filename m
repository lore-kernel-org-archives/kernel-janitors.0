From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 20:35:49 +0000
Subject: [PATCH 12/13] DRBD-receiver: Delete error messages for failed resource allocations in receive_protoc
Message-Id: <c0785561-c7ea-0b0e-b144-3b8f3eba46e0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
In-Reply-To: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 22:04:08 +0200

Omit two messages for memory allocation failures in this function.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/drbd/drbd_receiver.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index bbccdb8..e4da335 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3691,17 +3691,13 @@ static int receive_protocol(struct drbd_connection *connection, struct packet_in
 		hash_size = crypto_ahash_digestsize(peer_integrity_tfm);
 		int_dig_in = kmalloc(hash_size, GFP_KERNEL);
 		int_dig_vv = kmalloc(hash_size, GFP_KERNEL);
-		if (!(int_dig_in && int_dig_vv)) {
-			drbd_err(connection, "Allocation of buffers for data integrity checking failed\n");
+		if (!(int_dig_in && int_dig_vv))
 			goto disconnect;
-		}
 	}
 
 	new_net_conf = kmalloc(sizeof(*new_net_conf), GFP_KERNEL);
-	if (!new_net_conf) {
-		drbd_err(connection, "Allocation of new net_conf failed\n");
+	if (!new_net_conf)
 		goto disconnect;
-	}
 
 	mutex_lock(&connection->data.mutex);
 	mutex_lock(&connection->resource->conf_update);
-- 
2.10.0

