From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 14 Aug 2012 06:47:36 +0000
Subject: [PATCH 3/5] drivers/usb/wusbcore/wa-hc.c: fix error return code
Message-Id: <1344926858-1162-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344926858-1162-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344926858-1162-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert a 0 error return code to a negative one, as returned elsewhere in the
function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret;
expression e,e1,e2,e3,e4,x;
@@

(
if (\(ret != 0\|ret < 0\) || ...) { ... return ...; }
|
ret = 0
)
... when != ret = e1
*x = \(kmalloc\|kzalloc\|kcalloc\|devm_kzalloc\|ioremap\|ioremap_nocache\|devm_ioremap\|devm_ioremap_nocache\)(...);
... when != x = e2
    when != ret = e3
*if (x = NULL || ...)
{
  ... when != ret = e4
*  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/wusbcore/wa-hc.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/wusbcore/wa-hc.c b/drivers/usb/wusbcore/wa-hc.c
index 9e4a924..a09b65e 100644
--- a/drivers/usb/wusbcore/wa-hc.c
+++ b/drivers/usb/wusbcore/wa-hc.c
@@ -46,8 +46,10 @@ int wa_create(struct wahc *wa, struct usb_interface *iface)
 	wa->dto_epd = &iface->cur_altsetting->endpoint[2].desc;
 	wa->xfer_result_size = usb_endpoint_maxp(wa->dti_epd);
 	wa->xfer_result = kmalloc(wa->xfer_result_size, GFP_KERNEL);
-	if (wa->xfer_result = NULL)
+	if (wa->xfer_result = NULL) {
+		result = -ENOMEM;
 		goto error_xfer_result_alloc;
+	}
 	result = wa_nep_create(wa, iface);
 	if (result < 0) {
 		dev_err(dev, "WA-CDS: can't initialize notif endpoint: %d\n",

