From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 20:26:53 +0000
Subject: [PATCH 05/13] DRBD-receiver: Delete an unnecessary initialisation in receive_sizes()
Message-Id: <2baa8e08-1bc5-2497-9d86-391a347df56d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
In-Reply-To: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 20:04:02 +0200

A local variable was assigned a null pointer despite of the detail
that it was immediately reassigned by the following statement.
Thus remove such an unnecessary initialisation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/drbd/drbd_receiver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index b5a3cf0..7666212 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -4083,7 +4083,7 @@ static int receive_sizes(struct drbd_connection *connection, struct packet_info
 		}
 
 		if (my_usize != p_usize) {
-			struct disk_conf *old_disk_conf, *new_disk_conf = NULL;
+			struct disk_conf *old_disk_conf, *new_disk_conf;
 
 			new_disk_conf = kzalloc(sizeof(struct disk_conf), GFP_KERNEL);
 			if (!new_disk_conf) {
-- 
2.10.0

