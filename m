From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 May 2014 11:28:32 +0000
Subject: [patch] drbd: silence underflow warning in read_in_block()
Message-Id: <20140506112832.GA25561@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Ellenberg <drbd-dev@lists.linbit.com>
Cc: drbd-user@lists.linbit.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker warns that "data_size" could be negative and underflow
the limit check.  The code looks suspicious but I don't know if it is a
real bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index b6c8aaf..15daf86d 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1528,7 +1528,7 @@ read_in_block(struct drbd_peer_device *peer_device, u64 id, sector_t sector,
 	struct drbd_peer_request *peer_req;
 	struct page *page;
 	int dgs, ds, err;
-	int data_size = pi->size;
+	unsigned int data_size = pi->size;
 	void *dig_in = peer_device->connection->int_dig_in;
 	void *dig_vv = peer_device->connection->int_dig_vv;
 	unsigned long *data;
