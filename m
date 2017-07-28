From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 28 Jul 2017 20:41:56 +0000
Subject: [PATCH 09/11] USB: whci-hcd: constify hc_driver structures
Message-Id: <1501274518-25170-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501274518-25170-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501274518-25170-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

The hc_driver structure is only passed as the first argument to
usb_create_hcd, which is declared as const.  Thus the hc_driver structure
itself can be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/host/whci/hcd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/whci/hcd.c b/drivers/usb/host/whci/hcd.c
index 5b3603c..cf84269 100644
--- a/drivers/usb/host/whci/hcd.c
+++ b/drivers/usb/host/whci/hcd.c
@@ -213,7 +213,7 @@ static void whc_endpoint_reset(struct usb_hcd *usb_hcd,
 }
 
 
-static struct hc_driver whc_hc_driver = {
+static const struct hc_driver whc_hc_driver = {
 	.description = "whci-hcd",
 	.product_desc = "Wireless host controller",
 	.hcd_priv_size = sizeof(struct whc) - sizeof(struct usb_hcd),

