From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Dec 2015 20:15:28 +0000
Subject: [PATCH] USB-FHCI: Use a signed return type for fhci_create_ep()
Message-Id: <5675BAE0.2010304@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Dec 2015 21:10:20 +0100

The return type "u32" was used by the fhci_create_ep() function even though
it will eventually return a negative error code.
Improve this implementation detail by using the type "s32" instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/host/fhci-tds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/fhci-tds.c b/drivers/usb/host/fhci-tds.c
index f82ad5d..c1ae172 100644
--- a/drivers/usb/host/fhci-tds.c
+++ b/drivers/usb/host/fhci-tds.c
@@ -149,7 +149,7 @@ void fhci_ep0_free(struct fhci_usb *usb)
  * data_mem	The data memory partition(BUS)
  * ring_len	TD ring length
  */
-u32 fhci_create_ep(struct fhci_usb *usb, enum fhci_mem_alloc data_mem,
+s32 fhci_create_ep(struct fhci_usb *usb, enum fhci_mem_alloc data_mem,
 			   u32 ring_len)
 {
 	struct endpoint *ep;
-- 
2.6.3

