From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Nov 2017 15:53:25 +0000
Subject: [PATCH] usb: gadget: udc: renesas_usb3: make const array max_packet_array static
Message-Id: <20171102155325.24137-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array max_packet_array on the stack, instead make
it static. Makes the object code smaller by over 90 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  34337	   5612	    128	  40077	   9c8d	renesas_usb3.o

After:
   text	   data	    bss	    dec	    hex	filename
  34149	   5708	    128	  39985	   9c31	renesas_usb3.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index ed84f5158a38..cb461b8f4509 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2058,7 +2058,7 @@ static u32 usb3_calc_rammap_val(struct renesas_usb3_ep *usb3_ep,
 				const struct usb_endpoint_descriptor *desc)
 {
 	int i;
-	const u32 max_packet_array[] = {8, 16, 32, 64, 512};
+	static const u32 max_packet_array[] = {8, 16, 32, 64, 512};
 	u32 mpkt = PN_RAMMAP_MPKT(1024);
 
 	for (i = 0; i < ARRAY_SIZE(max_packet_array); i++) {
-- 
2.14.1

