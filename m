From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:14:53 +0000
Subject: [PATCH 6/37] drivers/media/video/gspca: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152314370.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leandro Costantino <lcostantino@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/media/video/gspca/t613.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/drivers/media/video/gspca/t613.c b/drivers/media/video/gspca/t613.c
--- a/drivers/media/video/gspca/t613.c
+++ b/drivers/media/video/gspca/t613.c
@@ -577,12 +577,11 @@ static void reg_w_buf(struct gspca_dev *
 	} else {
 		u8 *tmpbuf;
 
-		tmpbuf = kmalloc(len, GFP_KERNEL);
+		tmpbuf = kmemdup(buffer, len, GFP_KERNEL);
 		if (!tmpbuf) {
 			err("Out of memory");
 			return;
 		}
-		memcpy(tmpbuf, buffer, len);
 		usb_control_msg(gspca_dev->dev,
 				usb_sndctrlpipe(gspca_dev->dev, 0),
 				0,
