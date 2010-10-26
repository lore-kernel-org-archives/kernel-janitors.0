From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Oct 2010 10:25:31 +0000
Subject: [PATCH 2/14] drivers/usb/gadget/amd5536udc.c: delete double assignment
Message-Id: <1288088743-3725-3-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Dahlmann <dahlmann.thomas@arcor.de>
Cc: kernel-janitors@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-geode@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Delete successive assignments to the same location.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression i;
@@

*i = ...;
 i = ...;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/gadget/amd5536udc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/amd5536udc.c b/drivers/usb/gadget/amd5536udc.c
index 9034e03..f8dd726 100644
--- a/drivers/usb/gadget/amd5536udc.c
+++ b/drivers/usb/gadget/amd5536udc.c
@@ -3359,7 +3359,6 @@ static int udc_probe(struct udc *dev)
 	dev_set_name(&dev->gadget.dev, "gadget");
 	dev->gadget.dev.release = gadget_release;
 	dev->gadget.name = name;
-	dev->gadget.name = name;
 	dev->gadget.is_dualspeed = 1;
 
 	/* init registers, interrupts, ... */

