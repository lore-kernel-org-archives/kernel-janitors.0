From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Dec 2015 15:54:26 +0000
Subject: [PATCH v2 2/2] USB-FHCI: Use a signed return type for endpoint_zero_init()
Message-Id: <56797232.1020501@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5675BAE0.2010304@users.sourceforge.net>
 <20151219202706.GT5284@mwanda> <567970D1.3030503@users.sourceforge.net>
In-Reply-To: <567970D1.3030503@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Dec 2015 16:24:46 +0100

The return type "u32" was used by the endpoint_zero_init() function
even though it can return a value which corresponds to a negative
error code from a call of the fhci_create_ep() function.
Improve this implementation detail by using the type "int" instead.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/host/fhci-hcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index c6cebb9..b2889f0 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -64,11 +64,11 @@ u16 fhci_get_sof_timer_count(struct fhci_usb *usb)
 }
 
 /* initialize the endpoint zero */
-static u32 endpoint_zero_init(struct fhci_usb *usb,
+static int endpoint_zero_init(struct fhci_usb *usb,
 			      enum fhci_mem_alloc data_mem,
 			      u32 ring_len)
 {
-	u32 rc;
+	int rc;
 
 	rc = fhci_create_ep(usb, data_mem, ring_len);
 	if (rc)
-- 
2.6.3

