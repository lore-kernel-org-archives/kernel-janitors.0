From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 20:23:33 +0000
Subject: [PATCH 02/13] DRBD-receiver: Delete an error message for a failed kmalloc_array() call
Message-Id: <50817602-79d5-af47-8d97-6d6b01939e43@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
In-Reply-To: <3566e764-27b8-82e5-1f8e-c613e5a3a5b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 19:26:07 +0200

Omit an extra message for a memory allocation failure in this function.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/drbd/drbd_receiver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 3be9fbf..dab3f74 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -4187,10 +4187,8 @@ static int receive_uuids(struct drbd_connection *connection, struct packet_info
 	device = peer_device->device;
 
 	p_uuid = kmalloc_array(UI_EXTENDED_SIZE, sizeof(*p_uuid), GFP_NOIO);
-	if (!p_uuid) {
-		drbd_err(device, "kmalloc of p_uuid failed\n");
+	if (!p_uuid)
 		return false;
-	}
 
 	for (i = UI_CURRENT; i < UI_EXTENDED_SIZE; i++)
 		p_uuid[i] = be64_to_cpu(p->uuid[i]);
-- 
2.10.0

