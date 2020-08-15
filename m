From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 15 Aug 2020 06:12:37 +0000
Subject: [PATCH] media: mceusb: Avoid GFP_ATOMIC where it is not needed
Message-Id: <20200815061237.765171-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sean@mess.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no point in using GFP_ATOMIC here.
It is a probe function, and GFP_KERNEL is already used the line before
and the line after.

Use GFP_KERNEL instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/rc/mceusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index f9616158bcf4..98681ba10428 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1726,7 +1726,7 @@ static int mceusb_dev_probe(struct usb_interface *intf,
 		goto mem_alloc_fail;
 
 	ir->pipe_in = pipe;
-	ir->buf_in = usb_alloc_coherent(dev, maxp, GFP_ATOMIC, &ir->dma_in);
+	ir->buf_in = usb_alloc_coherent(dev, maxp, GFP_KERNEL, &ir->dma_in);
 	if (!ir->buf_in)
 		goto buf_in_alloc_fail;
 
-- 
2.25.1
