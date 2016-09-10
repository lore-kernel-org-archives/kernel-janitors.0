From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 20:36:51 +0000
Subject: [PATCH 13/13] DRBD-receiver: Improve determination of sizes in receive_Barrier()
Message-Id: <5dd280c1-27ac-4e83-97eb-3a4f7fec6cd9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
In-Reply-To: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 22:06:21 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/drbd/drbd_receiver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index e4da335..32ac4a9 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1747,7 +1747,7 @@ static int receive_Barrier(struct drbd_connection *connection, struct packet_inf
 
 		/* receiver context, in the writeout path of the other node.
 		 * avoid potential distributed deadlock */
-		epoch = kmalloc(sizeof(struct drbd_epoch), GFP_NOIO);
+		epoch = kmalloc(sizeof(*epoch), GFP_NOIO);
 		if (epoch)
 			break;
 		else
@@ -1760,7 +1760,7 @@ static int receive_Barrier(struct drbd_connection *connection, struct packet_inf
 		drbd_flush(connection);
 
 		if (atomic_read(&connection->current_epoch->epoch_size)) {
-			epoch = kmalloc(sizeof(struct drbd_epoch), GFP_NOIO);
+			epoch = kmalloc(sizeof(*epoch), GFP_NOIO);
 			if (epoch)
 				break;
 		}
-- 
2.10.0

