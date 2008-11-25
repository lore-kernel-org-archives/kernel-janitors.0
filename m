From: Julia Lawall <julia@diku.dk>
Date: Tue, 25 Nov 2008 13:15:19 +0000
Subject: [PATCH 5/5] drivers/usb/gadget: change simple_strtol to simple_strtoul
Message-Id: <Pine.LNX.4.64.0811251414550.11897@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dbrownell@users.sourceforge.net, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Since num is unsigned, it would seem better to use simple_strtoul that
simple_strtol.

A simplified version of the semantic patch that makes this change is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r2@
long e;
position p;
@@

e = simple_strtol@p(...)

@@
position p != r2.p;
type T;
T e;
@@

e = 
- simple_strtol@p
+ simple_strtoul
  (...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

 drivers/usb/gadget/epautoconf.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
--- a/drivers/usb/gadget/epautoconf.c
+++ b/drivers/usb/gadget/epautoconf.c
@@ -161,7 +161,7 @@ ep_matches (
 	/* report address */
 	desc->bEndpointAddress &= USB_DIR_IN;
 	if (isdigit (ep->name [2])) {
-		u8	num = simple_strtol (&ep->name [2], NULL, 10);
+		u8	num = simple_strtoul (&ep->name [2], NULL, 10);
 		desc->bEndpointAddress |= num;
 #ifdef	MANY_ENDPOINTS
 	} else if (desc->bEndpointAddress & USB_DIR_IN) {
