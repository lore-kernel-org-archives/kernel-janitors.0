From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 28 Jul 2017 20:41:58 +0000
Subject: [PATCH 11/11] c67x00-hcd: constify hc_driver structures
Message-Id: <1501274518-25170-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501274518-25170-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501274518-25170-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

The hc_driver structure is only passed as the first argument to
usb_create_hcd, which is declared as const.  Thus the hc_driver structure
itself can be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/c67x00/c67x00-hcd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/c67x00/c67x00-hcd.c b/drivers/usb/c67x00/c67x00-hcd.c
index c2d1396..30d3f34 100644
--- a/drivers/usb/c67x00/c67x00-hcd.c
+++ b/drivers/usb/c67x00/c67x00-hcd.c
@@ -305,7 +305,7 @@ static int c67x00_hcd_get_frame(struct usb_hcd *hcd)
 	return temp_val ? (temp_val - 1) : HOST_FRAME_MASK;
 }
 
-static struct hc_driver c67x00_hc_driver = {
+static const struct hc_driver c67x00_hc_driver = {
 	.description	= "c67x00-hcd",
 	.product_desc	= "Cypress C67X00 Host Controller",
 	.hcd_priv_size	= sizeof(struct c67x00_hcd),

