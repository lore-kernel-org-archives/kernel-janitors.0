From: Julia Lawall <julia@diku.dk>
Date: Sun, 21 Mar 2010 21:31:06 +0000
Subject: [PATCH] drivers/media/video: avoid NULL dereference
Message-Id: <Pine.LNX.4.64.1003212230380.12371@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark McClelland <mmcclell@bigfoot.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-usb@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If ov is NULL, it will not be possible to take the lock in the first place,
so move the test up earlier.

The semantic match that finds the problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression E, E1;
identifier f;
statement S1,S3;
iterator iter;
@@

if ((E = NULL && ...) || ...)
{
  ... when != false ((E = NULL && ...) || ...)
      when != true  ((E != NULL && ...) || ...)
      when != iter(E,...) S1
      when != E = E1
(
  sizeof(E->f)
|
* E->f
)
  ... when any
  return ...;
}
else S3
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/video/ov511.c         |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/video/ov511.c b/drivers/media/video/ov511.c
index e0bce8d..2357218 100644
--- a/drivers/media/video/ov511.c
+++ b/drivers/media/video/ov511.c
@@ -5913,14 +5913,12 @@ ov51x_disconnect(struct usb_interface *intf)
 
 	PDEBUG(3, "");
 
+	if (!ov)
+		return;
+
 	mutex_lock(&ov->lock);
 	usb_set_intfdata (intf, NULL);
 
-	if (!ov) {
-		mutex_unlock(&ov->lock);
-		return;
-	}
-
 	/* Free device number */
 	ov511_devused &= ~(1 << ov->nr);
 
