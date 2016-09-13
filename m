From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 12:14:12 +0000
Subject: [PATCH 3/4] virtio_blk: Delete an unnecessary initialisation in init_vq()
Message-Id: <52a07fc8-21a0-8f98-fa9d-5751fbf95afa@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <02054675-8395-ac81-6863-e3a5cbfc9032@users.sourceforge.net>
In-Reply-To: <02054675-8395-ac81-6863-e3a5cbfc9032@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: virtualization@lists.linux-foundation.org, "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 13:43:50 +0200

The local variable "err" will be set to an appropriate value
by a following statement.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/virtio_blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index d28dbcf..696f452 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -376,7 +376,7 @@ static void virtblk_config_changed(struct virtio_device *vdev)
 
 static int init_vq(struct virtio_blk *vblk)
 {
-	int err = 0;
+	int err;
 	int i;
 	vq_callback_t **callbacks;
 	const char **names;
-- 
2.10.0

