From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 20:24:42 +0000
Subject: [PATCH 03/13] DRBD-receiver: Move an assignment in receive_uuids()
Message-Id: <ac87a521-0dd3-b30c-caf4-ec0722b05a4f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
In-Reply-To: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 19:37:42 +0200

Move one assignment for the local variable "updated_uuids" so that
its setting will only be performed after corresponding memory
allocations succeeded by this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/drbd/drbd_receiver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index dab3f74..5526f6b 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -4179,7 +4179,7 @@ static int receive_uuids(struct drbd_connection *connection, struct packet_info
 	struct drbd_device *device;
 	struct p_uuids *p = pi->data;
 	u64 *p_uuid;
-	int i, updated_uuids = 0;
+	int i, updated_uuids;
 
 	peer_device = conn_peer_device(connection, pi->vnr);
 	if (!peer_device)
@@ -4206,6 +4206,7 @@ static int receive_uuids(struct drbd_connection *connection, struct packet_info
 		return -EIO;
 	}
 
+	updated_uuids = 0;
 	if (get_ldev(device)) {
 		int skip_initial_sync  			device->state.conn = C_CONNECTED &&
-- 
2.10.0

