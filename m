From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 24 Jul 2012 15:06:10 +0000
Subject: [PATCH 2/2] drivers/mmc/host/vub300.c: add missing usb_free_urb
Message-Id: <1343142370-27876-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Olech <tony.olech-ze5PQcJzaeOs0fm86SgGizGjJy/sRE9J@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Add missing usb_free_urb on failure path after usb_alloc_urb.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@km exists@
local idexpression e;
expression e1,e2,e3;
type T,T1;
identifier f;
@@

* e = usb_alloc_urb(...)
... when any
    when != e = e1
    when != e1 = (T)e
    when != e1(...,(T)e,...)
    when != &e->f
if(...) { ... when != e2(...,(T1)e,...)
                 when != e3 = e
                 when forall
(
             return <+...e...+>;
|
*             return ...;
) }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mmc/host/vub300.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index 3135a1a..6c39bf1 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -2358,9 +2358,9 @@ error5:
 	 * which is contained at the end of struct mmc
 	 */
 error4:
-	usb_free_urb(command_out_urb);
-error1:
 	usb_free_urb(command_res_urb);
+error1:
+	usb_free_urb(command_out_urb);
 error0:
 	return retval;
 }

