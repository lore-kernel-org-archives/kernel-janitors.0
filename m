From: Julia Lawall <julia@diku.dk>
Date: Mon, 13 Jul 2009 12:22:30 +0000
Subject: [PATCH] drivers/media/video: remove null dereference and unnecessary
Message-Id: <Pine.LNX.4.64.0907131422000.6808@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mmcclell@bigfoot.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In the first part of the patch, if ov is NULL, the previous call to
mutex_lock would have failed.

In the second part of the patch, a non-NULL test is removed, since if the
value is NULL, the line before would have failed.

Near the end of this function there is an initialization of ov to NULL
after a kfree, even though no further reference to this variable is
possible.  Perhaps this is considered good style, and thus I have left it
as is.

The first problem was detected using the following semantic match
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E, E1;
identifier f;
statement S1,S2,S3;
@@

* if (E = NULL)
{
  ... when != if (E = NULL) S1 else S2
      when != E = E1
* E->f
  ... when any
  return ...;
}
else S3
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/video/ov511.c         |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/video/ov511.c b/drivers/media/video/ov511.c
index 0bc2cf5..7c1f186 100644
--- a/drivers/media/video/ov511.c
+++ b/drivers/media/video/ov511.c
@@ -5914,14 +5914,12 @@ ov51x_disconnect(struct usb_interface *intf)
 
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
 
@@ -5946,7 +5944,7 @@ ov51x_disconnect(struct usb_interface *intf)
 	ov->dev = NULL;
 
 	/* Free the memory */
-	if (ov && !ov->user) {
+	if (!ov->user) {
 		mutex_lock(&ov->cbuf_lock);
 		kfree(ov->cbuf);
 		ov->cbuf = NULL;
