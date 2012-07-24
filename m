From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 24 Jul 2012 15:06:09 +0000
Subject: [PATCH 1/2] drivers/staging/media/easycap/easycap_main.c: add missing usb_free_urb
Message-Id: <1343142370-27876-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

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
 drivers/staging/media/easycap/easycap_main.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/easycap/easycap_main.c b/drivers/staging/media/easycap/easycap_main.c
index a1c45e4..8269c77 100644
--- a/drivers/staging/media/easycap/easycap_main.c
+++ b/drivers/staging/media/easycap/easycap_main.c
@@ -3083,6 +3083,7 @@ static int create_video_urbs(struct easycap *peasycap)
 		peasycap->allocation_video_urb += 1;
 		pdata_urb = kzalloc(sizeof(struct data_urb), GFP_KERNEL);
 		if (!pdata_urb) {
+			usb_free_urb(purb);
 			SAM("ERROR: Could not allocate struct data_urb.\n");
 			return -ENOMEM;
 		}

