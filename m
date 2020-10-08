From: Colin King <colin.king@canonical.com>
Date: Thu, 08 Oct 2020 21:12:23 +0000
Subject: [PATCH] media: tm6000: Fix sizeof() mismatches
Message-Id: <20201008211223.202670-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Julian Scheel <julian@jusst.de>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The are two instances of sizeof() being used incorrectly. The
sizeof(void *) is incorrect because urb_buffer is a char ** pointer,
fix this by using sizeof(*dev->urb_buffer).  The sizeof(dma_addr_t *)
is incorrect, it should be sizeof(*dev->urb_dma), which is a dma_addr_t
and not a dma_addr_t *.  This errors did not cause any issues because
it just so happens the sizes are the same.

Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Fixes: 16427faf2867 ("[media] tm6000: Add parameter to keep urb bufs allocated")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/tm6000/tm6000-video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/tm6000/tm6000-video.c b/drivers/media/usb/tm6000/tm6000-video.c
index bfba06ea60e9..d6400c17e34f 100644
--- a/drivers/media/usb/tm6000/tm6000-video.c
+++ b/drivers/media/usb/tm6000/tm6000-video.c
@@ -461,11 +461,12 @@ static int tm6000_alloc_urb_buffers(struct tm6000_core *dev)
 	if (dev->urb_buffer)
 		return 0;
 
-	dev->urb_buffer = kmalloc_array(num_bufs, sizeof(void *), GFP_KERNEL);
+	dev->urb_buffer = kmalloc_array(num_bufs, sizeof(*dev->urb_buffer),
+					GFP_KERNEL);
 	if (!dev->urb_buffer)
 		return -ENOMEM;
 
-	dev->urb_dma = kmalloc_array(num_bufs, sizeof(dma_addr_t *),
+	dev->urb_dma = kmalloc_array(num_bufs, sizeof(*dev->urb_dma),
 				     GFP_KERNEL);
 	if (!dev->urb_dma)
 		return -ENOMEM;
-- 
2.27.0
