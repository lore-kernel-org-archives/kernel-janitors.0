From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Tue, 29 Sep 2020 13:14:33 +0000
Subject: [PATCH 10/20] media: lmedm04: use semicolons rather than commas to separate statements
Message-Id: <1601385283-26144-11-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Malcolm Priestley <tvboxspy@gmail.com>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/dvb-usb-v2/lmedm04.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 5a7a9522d46d..9ddda8d68ee0 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -391,7 +391,7 @@ static int lme2510_int_read(struct dvb_usb_adapter *adap)
 	ep = usb_pipe_endpoint(d->udev, lme_int->lme_urb->pipe);
 
 	if (usb_endpoint_type(&ep->desc) = USB_ENDPOINT_XFER_BULK)
-		lme_int->lme_urb->pipe = usb_rcvbulkpipe(d->udev, 0xa),
+		lme_int->lme_urb->pipe = usb_rcvbulkpipe(d->udev, 0xa);
 
 	usb_submit_urb(lme_int->lme_urb, GFP_ATOMIC);
 	info("INT Interrupt Service Started");
