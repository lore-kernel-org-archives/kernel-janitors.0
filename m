From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 01 Jun 2013 18:02:27 +0000
Subject: [PATCH] usb: musb: use the new %pa format specifier for dma_addr_t
Message-Id: <1370109747-18821-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: balbi@ti.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

This patch makes use of the new format specifier %pa that was introduced
by the following commit.

7d7992108d02aa92ad4c77e5d9ce14088c942e75
("lib/vsprintf.c: add %pa format specifier for phys_addr_t types")

The addition of urb->transfer_dma and urb->actual_length is also done a
few lines below. I have moved this code up and pass the variable buf to
dev_dbg.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
I also added braces to the else statement for consistency.
(Didn't want to send a separate patch for that)

 drivers/usb/musb/musb_host.c |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index a9695f5..701f668 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -1756,12 +1756,11 @@ void musb_host_rx(struct musb *musb, u8 epnum)
 			dma_addr_t		buf;
 
 			rx_count = musb_readw(epio, MUSB_RXCOUNT);
+			buf = urb->transfer_dma + urb->actual_length;
 
-			dev_dbg(musb->controller, "RX%d count %d, buffer 0x%llx len %d/%d\n",
+			dev_dbg(musb->controller, "RX%d count %d, buffer 0x%pa len %d/%d\n",
 					epnum, rx_count,
-					(unsigned long long) urb->transfer_dma
-					+ urb->actual_length,
-					qh->offset,
+					&buf, qh->offset,
 					urb->transfer_buffer_length);
 
 			c = musb->dma_controller;
@@ -1785,14 +1784,13 @@ void musb_host_rx(struct musb *musb, u8 epnum)
 					    rx_count, d->length);
 
 					length = d->length;
-				} else
+				} else {
 					length = rx_count;
+				}
 				d->status = d_status;
 				buf = urb->transfer_dma + d->offset;
 			} else {
 				length = rx_count;
-				buf = urb->transfer_dma +
-						urb->actual_length;
 			}
 
 			dma->desired_mode = 0;
-- 
1.7.10.4

