From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:23:15 +0000
Subject: [PATCH 33/37] drivers/net/usb: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152322560.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Korsgaard <jacmet@sunsite.dk>, Greg Kroah-Hartman <gregkh@suse.de>, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kmemdup when some other buffer is immediately copied into the
allocated region.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
statement S;
@@

-  to = \(kmalloc\|kzalloc\)(size,flag);
+  to = kmemdup(from,size,flag);
   if (to=NULL || ...) S
-  memcpy(to, from, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/usb/dm9601.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/drivers/net/usb/dm9601.c b/drivers/net/usb/dm9601.c
--- a/drivers/net/usb/dm9601.c
+++ b/drivers/net/usb/dm9601.c
@@ -93,10 +93,9 @@ static int dm_write(struct usbnet *dev, 
 	netdev_dbg(dev->net, "dm_write() reg=0x%02x, length=%d\n", reg, length);
 
 	if (data) {
-		buf = kmalloc(length, GFP_KERNEL);
+		buf = kmemdup(data, length, GFP_KERNEL);
 		if (!buf)
 			goto out;
-		memcpy(buf, data, length);
 	}
 
 	err = usb_control_msg(dev->udev,
