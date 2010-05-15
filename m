From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:18:40 +0000
Subject: [PATCH 18/37] drivers/media/video/tlg2300: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152318160.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Huang Shijie <shijie8@gmail.com>, Kang Yong <kangyong@telegent.com>, Zhang Xiaobing <xbzhang@telegent.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/media/video/tlg2300/pd-main.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/drivers/media/video/tlg2300/pd-main.c b/drivers/media/video/tlg2300/pd-main.c
--- a/drivers/media/video/tlg2300/pd-main.c
+++ b/drivers/media/video/tlg2300/pd-main.c
@@ -227,12 +227,11 @@ static int firmware_download(struct usb_
 
 	fwlength = fw->size;
 
-	fwbuf = kzalloc(fwlength, GFP_KERNEL);
+	fwbuf = kmemdup(fw->data, fwlength, GFP_KERNEL);
 	if (!fwbuf) {
 		ret = -ENOMEM;
 		goto out;
 	}
-	memcpy(fwbuf, fw->data, fwlength);
 
 	max_packet_size = udev->ep_out[0x1]->desc.wMaxPacketSize;
 	log("\t\t download size : %d", (int)max_packet_size);
