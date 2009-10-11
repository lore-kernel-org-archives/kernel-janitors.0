From: javier martinez canillas <martinez.javier@gmail.com>
Date: Sun, 11 Oct 2009 21:38:57 +0000
Subject: [PATCH 1/1] virtio: adding __devexit to virtballoon_remove
Message-Id: <1255297137.7037.10.camel@laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rusty@rustcorp.com.au, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/virtio/virtio_balloon.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 3978923..9dd5880 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -247,7 +247,7 @@ out:
 	return err;
 }
 
-static void virtballoon_remove(struct virtio_device *vdev)
+static void __devexit virtballoon_remove(struct virtio_device *vdev)
 {
 	struct virtio_balloon *vb = vdev->priv;
 
-- 
1.6.0.4




