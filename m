From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 25 Aug 2012 19:57:06 +0000
Subject: [PATCH 3/6] drivers/usb/gadget/lpc32xx_udc.c: adjust inconsistent IS_ERR and PTR_ERR
Message-Id: <1345924629-16584-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345924629-16584-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345924629-16584-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Felipe Balbi <balbi@ti.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Change the call to PTR_ERR to access the value just tested by IS_ERR.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e,e1;
@@

(
if (IS_ERR(e)) { ... PTR_ERR(e) ... }
|
if (IS_ERR(e=E1)) { ... PTR_ERR(e) ... }
|
*if (IS_ERR(e))
 { ...
*  PTR_ERR(e1)
   ... }
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/gadget/lpc32xx_udc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/lpc32xx_udc.c b/drivers/usb/gadget/lpc32xx_=
udc.c
index f1ec99e..3a6cdd0 100644
--- a/drivers/usb/gadget/lpc32xx_udc.c
+++ b/drivers/usb/gadget/lpc32xx_udc.c
@@ -3208,7 +3208,7 @@ static int __init lpc32xx_udc_probe(struct platform_d=
evice *pdev)
 	udc->usb_otg_clk =3D clk_get(&pdev->dev, "ck_usb_otg");
 	if (IS_ERR(udc->usb_otg_clk)) {
 		dev_err(udc->dev, "failed to acquire USB otg clock\n");
-		retval =3D PTR_ERR(udc->usb_slv_clk);
+		retval =3D PTR_ERR(udc->usb_otg_clk);
 		goto usb_otg_clk_get_fail;
 	}
=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
