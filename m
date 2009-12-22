From: Julia Lawall <julia@diku.dk>
Date: Tue, 22 Dec 2009 21:00:07 +0000
Subject: [PATCH] drivers/media/dvb: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0912222159480.28669@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@infradead.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/dvb/dvb-usb/dw2102.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -u -p a/drivers/media/dvb/dvb-usb/dw2102.c b/drivers/media/dvb/dvb-usb/dw2102.c
--- a/drivers/media/dvb/dvb-usb/dw2102.c
+++ b/drivers/media/dvb/dvb-usb/dw2102.c
@@ -470,12 +470,13 @@ static int s6x0_i2c_transfer(struct i2c_
 								int num)
 {
 	struct dvb_usb_device *d = i2c_get_adapdata(adap);
-	struct usb_device *udev = d->udev;
+	struct usb_device *udev;
 	int ret = 0;
 	int len, i, j;
 
 	if (!d)
 		return -ENODEV;
+	udev = d->udev;
 	if (mutex_lock_interruptible(&d->i2c_mutex) < 0)
 		return -EAGAIN;
 
