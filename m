From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 19 Aug 2013 16:00:08 +0000
Subject: [PATCH] usb: musb: dsps: fix devm_ioremap_resource error detection code
Message-Id: <1376928009-25637-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

devm_ioremap_resource returns an ERR_PTR value, not NULL, on failure.
Furthermore, the value returned by devm_ioremap_resource should be tested.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e,e1;
statement S;
@@

*e = devm_ioremap_resource(...);
if (!e1) S

// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/musb/musb_dsps.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index 4ffbaac..4ad52e7 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -361,8 +361,8 @@ static int dsps_musb_init(struct musb *musb)
 		return -EINVAL;
 
 	reg_base = devm_ioremap_resource(dev, r);
-	if (!musb->ctrl_base)
-		return -EINVAL;
+	if (IS_ERR(reg_base))
+		return PTR_ERR(reg_base);
 	musb->ctrl_base = reg_base;
 
 	/* NOP driver needs change if supporting dual instance */

