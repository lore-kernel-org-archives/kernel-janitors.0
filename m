From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 20:34:26 +0000
Subject: [PATCH 11/13] DRBD-receiver: Improve a size determination in receive_protocol()
Message-Id: <74df31e3-5fb9-a3fb-468e-49e5b60c957e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
In-Reply-To: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 22:02:11 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/drbd/drbd_receiver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 3e1315a..bbccdb8 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3697,7 +3697,7 @@ static int receive_protocol(struct drbd_connection *connection, struct packet_in
 		}
 	}
 
-	new_net_conf = kmalloc(sizeof(struct net_conf), GFP_KERNEL);
+	new_net_conf = kmalloc(sizeof(*new_net_conf), GFP_KERNEL);
 	if (!new_net_conf) {
 		drbd_err(connection, "Allocation of new net_conf failed\n");
 		goto disconnect;
-- 
2.10.0

