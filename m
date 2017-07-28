From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 28 Jul 2017 20:41:50 +0000
Subject: [PATCH 03/11] usb: r8a66597-hcd: constify hc_driver structures
Message-Id: <1501274518-25170-4-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/usb/host/r8a66597-hcd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index 7bf78be..5e5fc9d 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -2312,7 +2312,7 @@ static int r8a66597_bus_resume(struct usb_hcd *hcd)
 #define	r8a66597_bus_resume	NULL
 #endif
 
-static struct hc_driver r8a66597_hc_driver = {
+static const struct hc_driver r8a66597_hc_driver = {
 	.description =		hcd_name,
 	.hcd_priv_size =	sizeof(struct r8a66597),
 	.irq =			r8a66597_irq,

