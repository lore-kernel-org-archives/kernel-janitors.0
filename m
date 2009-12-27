From: Julia Lawall <julia@diku.dk>
Date: Sun, 27 Dec 2009 21:28:00 +0000
Subject: [PATCH 5/5] drivers/staging/tm6000: Correct NULL test
Message-Id: <Pine.LNX.4.64.0912272227450.20548@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Test the just-allocated value for NULL rather than some other value.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,y;
statement S;
@@

x = \(kmalloc\|kcalloc\|kzalloc\)(...);
(
if ((x) = NULL) S
|
if (
-   y
+   x
       = NULL)
 S
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/tm6000/tm6000-video.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/staging/tm6000/tm6000-video.c b/drivers/staging/tm6000/tm6000-video.c
--- a/drivers/staging/tm6000/tm6000-video.c
+++ b/drivers/staging/tm6000/tm6000-video.c
@@ -642,7 +642,7 @@ static int tm6000_prepare_isoc(struct tm
 
 	dev->isoc_ctl.transfer_buffer = kmalloc(sizeof(void *)*num_bufs,
 				   GFP_KERNEL);
-	if (!dev->isoc_ctl.urb) {
+	if (!dev->isoc_ctl.transfer_buffer) {
 		tm6000_err("cannot allocate memory for usbtransfer\n");
 		kfree(dev->isoc_ctl.urb);
 		return -ENOMEM;
