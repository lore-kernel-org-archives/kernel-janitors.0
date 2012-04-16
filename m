From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 16 Apr 2012 15:03:10 +0000
Subject: [PATCH] drivers/usb/musb/davinci.c: add missing unregister
Message-Id: <1334588590-23891-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

usb_nop_xceiv_unregister is needed on failure of usb_get_transceiver, as
done in other error-handling code in the same function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/musb/davinci.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/davinci.c b/drivers/usb/musb/davinci.c
index 97ab975..768b4b5 100644
--- a/drivers/usb/musb/davinci.c
+++ b/drivers/usb/musb/davinci.c
@@ -386,7 +386,7 @@ static int davinci_musb_init(struct musb *musb)
 	usb_nop_xceiv_register();
 	musb->xceiv = usb_get_transceiver();
 	if (!musb->xceiv)
-		return -ENODEV;
+		goto unregister;
 
 	musb->mregs += DAVINCI_BASE_OFFSET;
 
@@ -444,6 +444,7 @@ static int davinci_musb_init(struct musb *musb)
 
 fail:
 	usb_put_transceiver(musb->xceiv);
+unregister:
 	usb_nop_xceiv_unregister();
 	return -ENODEV;
 }

