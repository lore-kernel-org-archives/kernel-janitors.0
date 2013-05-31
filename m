From: Emil Goode <emilgoode@gmail.com>
Date: Fri, 31 May 2013 20:49:49 +0000
Subject: [PATCH v2] usb: musb: Fix format specifier warning
Message-Id: <1370033389-27131-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: balbi@ti.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

This patch fixes a format specifier warning. dma_addr_t can be either
u32 or u64 so we should cast to the largest type and change the format
specifier to %llx.
The addition of urb->transfer_dma and urb->actual_length is also done a
few lines below. I have moved this code up and pass the variable buf to
dev_dbg.

Sparse output:
drivers/usb/musb/musb_host.c:1761:4: warning:
	format ‘%x’ expects argument of type ‘unsigned int’,
	but argument 6 has type ‘dma_addr_t’ [-Wformat]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
v2: Added missing braces according to Doc/CodingStyle

 drivers/usb/musb/musb_host.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 094cf80..45c4e8b 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -1756,11 +1756,11 @@ void musb_host_rx(struct musb *musb, u8 epnum)
 			dma_addr_t		buf;
 
 			rx_count = musb_readw(epio, MUSB_RXCOUNT);
+			buf = urb->transfer_dma + urb->actual_length;
 
-			dev_dbg(musb->controller, "RX%d count %d, buffer 0x%x len %d/%d\n",
+			dev_dbg(musb->controller, "RX%d count %d, buffer 0x%llx len %d/%d\n",
 					epnum, rx_count,
-					urb->transfer_dma
-						+ urb->actual_length,
+					(unsigned long long)buf,
 					qh->offset,
 					urb->transfer_buffer_length);
 
@@ -1785,14 +1785,13 @@ void musb_host_rx(struct musb *musb, u8 epnum)
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

