From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Thu, 22 Apr 2010 12:47:41 +0000
Subject: [PATCH 1/1] drbd: Terminate a connection early if sending the protocol fails
Message-Id: <1271940461-15012-2-git-send-email-philipp.reisner@linbit.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
---
 drivers/block/drbd/drbd_receiver.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index ed9f1de..3f096e7 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -899,7 +899,8 @@ retry:
 
 	drbd_thread_start(&mdev->asender);
 
-	drbd_send_protocol(mdev);
+	if (!drbd_send_protocol(mdev))
+		return -1;
 	drbd_send_sync_param(mdev, &mdev->sync_conf);
 	drbd_send_sizes(mdev, 0);
 	drbd_send_uuids(mdev);
-- 
1.6.3.3

