From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 20:28:09 +0000
Subject: [PATCH 06/13] DRBD-receiver: Improve a size determination in receive_sizes()
Message-Id: <0d722998-966d-9133-48e5-69e32ae2d8b9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
In-Reply-To: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 21:45:13 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/drbd/drbd_receiver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 7666212..64bc316 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -4085,7 +4085,8 @@ static int receive_sizes(struct drbd_connection *connection, struct packet_info
 		if (my_usize != p_usize) {
 			struct disk_conf *old_disk_conf, *new_disk_conf;
 
-			new_disk_conf = kzalloc(sizeof(struct disk_conf), GFP_KERNEL);
+			new_disk_conf = kzalloc(sizeof(*new_disk_conf),
+						GFP_KERNEL);
 			if (!new_disk_conf) {
 				drbd_err(device, "Allocation of new disk_conf failed\n");
 				put_ldev(device);
-- 
2.10.0

