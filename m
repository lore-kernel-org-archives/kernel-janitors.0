From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 13 Apr 2013 09:32:15 +0000
Subject: [patch] [media] media: info leak in __media_device_enum_links()
Message-Id: <20130413093215.GB11215@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

These structs have holes and reserved struct members which aren't
cleared.  I've added a memset() so we don't leak stack information.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/media-device.c b/drivers/media/media-device.c
index 99b80b6..450c0d1 100644
--- a/drivers/media/media-device.c
+++ b/drivers/media/media-device.c
@@ -139,6 +139,8 @@ static long __media_device_enum_links(struct media_device *mdev,
 
 		for (p = 0; p < entity->num_pads; p++) {
 			struct media_pad_desc pad;
+
+			memset(&pad, 0, sizeof(pad));
 			media_device_kpad_to_upad(&entity->pads[p], &pad);
 			if (copy_to_user(&links->pads[p], &pad, sizeof(pad)))
 				return -EFAULT;
@@ -156,6 +158,7 @@ static long __media_device_enum_links(struct media_device *mdev,
 			if (entity->links[l].source->entity != entity)
 				continue;
 
+			memset(&link, 0, sizeof(link));
 			media_device_kpad_to_upad(entity->links[l].source,
 						  &link.source);
 			media_device_kpad_to_upad(entity->links[l].sink,
