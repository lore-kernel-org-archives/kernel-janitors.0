From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Dec 2015 15:51:42 +0000
Subject: [PATCH v2 1/2] USB-FHCI: Use a signed return type for fhci_create_ep()
Message-Id: <5679718E.9050104@users.sourceforge.net>
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
Date: Tue, 22 Dec 2015 16:10:14 +0100

The return type "u32" was used by the fhci_create_ep() function even though
it will eventually return a negative error code.
Improve this implementation detail by using the type "int" instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/host/fhci-tds.c | 2 +-
 drivers/usb/host/fhci.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/fhci-tds.c b/drivers/usb/host/fhci-tds.c
index f82ad5d..fc0b525 100644
--- a/drivers/usb/host/fhci-tds.c
+++ b/drivers/usb/host/fhci-tds.c
@@ -149,7 +149,7 @@ void fhci_ep0_free(struct fhci_usb *usb)
  * data_mem	The data memory partition(BUS)
  * ring_len	TD ring length
  */
-u32 fhci_create_ep(struct fhci_usb *usb, enum fhci_mem_alloc data_mem,
+int fhci_create_ep(struct fhci_usb *usb, enum fhci_mem_alloc data_mem,
 			   u32 ring_len)
 {
 	struct endpoint *ep;
diff --git a/drivers/usb/host/fhci.h b/drivers/usb/host/fhci.h
index 154e6a0..afa3cfc 100644
--- a/drivers/usb/host/fhci.h
+++ b/drivers/usb/host/fhci.h
@@ -547,7 +547,7 @@ u32 fhci_host_transaction(struct fhci_usb *usb, struct packet *pkt,
 void fhci_host_transmit_actual_frame(struct fhci_usb *usb);
 void fhci_tx_conf_interrupt(struct fhci_usb *usb);
 void fhci_push_dummy_bd(struct endpoint *ep);
-u32 fhci_create_ep(struct fhci_usb *usb, enum fhci_mem_alloc data_mem,
+int fhci_create_ep(struct fhci_usb *usb, enum fhci_mem_alloc data_mem,
 		   u32 ring_len);
 void fhci_init_ep_registers(struct fhci_usb *usb,
 			    struct endpoint *ep,
-- 
2.6.3

