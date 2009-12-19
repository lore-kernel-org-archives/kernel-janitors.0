From: Julia Lawall <julia@diku.dk>
Date: Sat, 19 Dec 2009 07:17:44 +0000
Subject: [PATCH 6/7] drivers/usb: Use kzalloc for allocating only one thing
Message-Id: <Pine.LNX.4.64.0912190817280.30546@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kzalloc rather than kcalloc(1,...)

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
@@

- kcalloc(1,
+ kzalloc(
          ...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/host/isp1362-hcd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp1362-hcd.c
--- a/drivers/usb/host/isp1362-hcd.c 2009-12-17 08:30:14.000000000 +0100
+++ b/drivers/usb/host/isp1362-hcd.c 2009-12-19 07:52:56.000000000 +0100
@@ -1257,7 +1257,7 @@ static int isp1362_urb_enqueue(struct us
 
 	/* avoid all allocations within spinlocks: request or endpoint */
 	if (!hep->hcpriv) {
-		ep = kcalloc(1, sizeof *ep, mem_flags);
+		ep = kzalloc(sizeof *ep, mem_flags);
 		if (!ep)
 			return -ENOMEM;
 	}
