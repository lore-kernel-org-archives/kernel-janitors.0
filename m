From: Julia Lawall <julia@diku.dk>
Date: Sat, 16 Jan 2010 15:59:22 +0000
Subject: [PATCH 6/9] drivers/staging/go7007: Eliminate useless code
Message-Id: <Pine.LNX.4.64.1001161659000.28745@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The variable s is initialized twice to the same (side effect-free)
expression.  Drop one initialization.

A simplified version of the semantic match that finds this problem is:
(http://coccinelle.lip6.fr/)

// <smpl>
@forall@
idexpression *x;
identifier f!=ERR_PTR;
@@

x = f(...)
... when != x
(
x = f(...,<+...x...+>,...)
|
* x = f(...)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/go7007/s2250-loader.c          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/go7007/s2250-loader.c b/drivers/staging/go7007/s2250-loader.c
index c152ab9..d9a3278 100644
--- a/drivers/staging/go7007/s2250-loader.c
+++ b/drivers/staging/go7007/s2250-loader.c
@@ -139,9 +139,9 @@ failed2:
 
 static void s2250loader_disconnect(struct usb_interface *interface)
 {
-	pdevice_extension_t s = usb_get_intfdata(interface);
+	pdevice_extension_t s;
 	printk(KERN_INFO "s2250: disconnect\n");
 	lock_kernel();
 	s = usb_get_intfdata(interface);
