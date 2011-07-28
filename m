From: Julia Lawall <julia@diku.dk>
Date: Thu, 28 Jul 2011 12:46:02 +0000
Subject: [PATCH 2/6] drivers/media/dvb/dvb-usb/usb-urb.c: adjust array index
Message-Id: <1311857165-14780-3-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1311857165-14780-1-git-send-email-julia@diku.dk>
In-Reply-To: <1311857165-14780-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Convert array index from the loop bound to the loop index.

A simplified version of the semantic patch that fixes this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2,ar;
@@

for(e1 = 0; e1 < e2; e1++) { <...
  ar[
- e2
+ e1
  ]
  ...> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
Not tested.

 drivers/media/dvb/dvb-usb/usb-urb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/media/dvb/dvb-usb/usb-urb.c b/drivers/media/dvb/dvb-usb/usb-urb.c
--- a/drivers/media/dvb/dvb-usb/usb-urb.c
+++ b/drivers/media/dvb/dvb-usb/usb-urb.c
@@ -148,7 +148,7 @@ static int usb_bulk_urb_init(struct usb_
 		if (!stream->urb_list[i]) {
 			deb_mem("not enough memory for urb_alloc_urb!.\n");
 			for (j = 0; j < i; j++)
-				usb_free_urb(stream->urb_list[i]);
+				usb_free_urb(stream->urb_list[j]);
 			return -ENOMEM;
 		}
 		usb_fill_bulk_urb( stream->urb_list[i], stream->udev,
@@ -181,7 +181,7 @@ static int usb_isoc_urb_init(struct usb_
 		if (!stream->urb_list[i]) {
 			deb_mem("not enough memory for urb_alloc_urb!\n");
 			for (j = 0; j < i; j++)
-				usb_free_urb(stream->urb_list[i]);
+				usb_free_urb(stream->urb_list[j]);
 			return -ENOMEM;
 		}
 

