From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Dec 2015 10:11:28 +0000
Subject: [patch] mic_virtio: fix a timeout loop
Message-Id: <20151215101128.GE20848@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, Sudeep Dutt <sudeep.dutt@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

After the loop we test "if (!retry)" to see if we timedout.  The problem
is "retry--" is a post-op so retry will be -1 at the end of the loop.  I
have fixed this by changing it to a pre-op instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/mic/card/mic_virtio.c b/drivers/misc/mic/card/mic_virtio.c
index e486a0c..b3ad9c4 100644
--- a/drivers/misc/mic/card/mic_virtio.c
+++ b/drivers/misc/mic/card/mic_virtio.c
@@ -337,7 +337,7 @@ static int mic_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 	 * rings have been re-assigned.
 	 */
 	mic_send_intr(mvdev->mdev, mvdev->c2h_vdev_db);
-	for (retry = 100; retry--;) {
+	for (retry = 100; --retry;) {
 		if (!ioread8(&dc->used_address_updated))
 			break;
 		msleep(100);
