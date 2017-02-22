From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 22 Feb 2017 22:32:19 +0000
Subject: [PATCH] [media] tm6000: Fix resource freeing in 'tm6000_prepare_isoc()'
Message-Id: <20170222223219.13211-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@kernel.org, wsa-dev@sang-engineering.com, hans.verkuil@cisco.com, kumar.san1093@gmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'usb_free_urb(urb)' is a no-op, because urb is known to be NULL.

It is likelly that releasing resources allocated by
'tm6000_alloc_urb_buffers()' just a few lines above is expected here.


This has been spotted by the following coccinelle script:
@@
expression ret, x, e;
identifier f;
@@

*   if (x = NULL)
    {
     ... when != x = e;
(
*    f(<+...x...+>);
|
*    ret = f(<+...x...+>);
)
     ...
    }

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/usb/tm6000/tm6000-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/tm6000/tm6000-video.c b/drivers/media/usb/tm6000/tm6000-video.c
index c4fdc1fa32ef..7e960d0a5b92 100644
--- a/drivers/media/usb/tm6000/tm6000-video.c
+++ b/drivers/media/usb/tm6000/tm6000-video.c
@@ -631,7 +631,7 @@ static int tm6000_prepare_isoc(struct tm6000_core *dev)
 		urb = usb_alloc_urb(max_packets, GFP_KERNEL);
 		if (!urb) {
 			tm6000_uninit_isoc(dev);
-			usb_free_urb(urb);
+			tm6000_free_urb_buffers(dev);
 			return -ENOMEM;
 		}
 		dev->isoc_ctl.urb[i] = urb;
-- 
2.9.3

