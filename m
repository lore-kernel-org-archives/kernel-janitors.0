From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 May 2017 15:53:55 +0000
Subject: [PATCH 3/3] s390: virtio: Adjust a null pointer check in two functions
Message-Id: <078ad841-544f-b989-4fdc-5f33acc220e7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d02fd34c-da59-0c33-d859-e49ecb4eb1c5@users.sourceforge.net>
In-Reply-To: <d02fd34c-da59-0c33-d859-e49ecb4eb1c5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org, virtualization@lists.linux-foundation.org, Cornelia Huck <cornelia.huck@de.ibm.com>, Halil Pasic <pasic@linux.vnet.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 May 2017 17:14:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/s390/virtio/virtio_ccw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index bfb845d7faa7..27ab0f0b59cd 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -513,7 +513,7 @@ static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
 	}
 	size = PAGE_ALIGN(vring_size(info->num, KVM_VIRTIO_CCW_RING_ALIGN));
 	info->queue = alloc_pages_exact(size, GFP_KERNEL | __GFP_ZERO);
-	if (info->queue = NULL) {
+	if (!info->queue) {
 		dev_warn(&vcdev->cdev->dev, "no queue\n");
 		err = -ENOMEM;
 		goto out_err;
@@ -1388,7 +1388,7 @@ static void __init no_auto_parse(void)
 				 &from_ssid, &from);
 		if (rc)
 			continue;
-		if (parm != NULL) {
+		if (parm) {
 			rc = parse_busid(parm, &to_cssid,
 					 &to_ssid, &to);
 			if ((from_ssid > to_ssid) ||
-- 
2.13.0

