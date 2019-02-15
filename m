From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 15 Feb 2019 03:17:09 +0000
Subject: [PATCH -next] usb: host: oxu210hp-hcd: remove set but not used variables 'uframes, transfer_buffer_l
Message-Id: <20190215031709.86920-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Colin Ian King <colin.king@canonical.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/usb/host/oxu210hp-hcd.c: In function 'scan_periodic':
drivers/usb/host/oxu210hp-hcd.c:2256:13: warning:
 variable 'uframes' set but not used [-Wunused-but-set-variable]

drivers/usb/host/oxu210hp-hcd.c: In function 'oxu_urb_enqueue':
drivers/usb/host/oxu210hp-hcd.c:2835:6: warning:
 variable 'transfer_buffer_length' set but not used [-Wunused-but-set-variable]

It never used since introduction.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/host/oxu210hp-hcd.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index f06a291f05f8..47c5515a9ce4 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -2253,16 +2253,12 @@ static void scan_periodic(struct oxu_hcd *oxu)
 	for (;;) {
 		union ehci_shadow	q, *q_p;
 		__le32			type, *hw_p;
-		unsigned		uframes;
 
 		/* don't scan past the live uframe */
 		frame = now_uframe >> 3;
-		if (frame = (clock >> 3))
-			uframes = now_uframe & 0x07;
-		else {
+		if (frame != (clock >> 3)) {
 			/* safe to scan the whole frame at once */
 			now_uframe |= 0x07;
-			uframes = 8;
 		}
 
 restart:
@@ -2832,7 +2828,6 @@ static int oxu_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 {
 	struct oxu_hcd *oxu = hcd_to_oxu(hcd);
 	int num, rem;
-	int transfer_buffer_length;
 	void *transfer_buffer;
 	struct urb *murb;
 	int i, ret;
@@ -2843,7 +2838,6 @@ static int oxu_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 
 	/* Otherwise we should verify the USB transfer buffer size! */
 	transfer_buffer = urb->transfer_buffer;
-	transfer_buffer_length = urb->transfer_buffer_length;
 
 	num = urb->transfer_buffer_length / 4096;
 	rem = urb->transfer_buffer_length % 4096;
