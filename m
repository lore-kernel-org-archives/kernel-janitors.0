From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 06 Sep 2012 15:23:48 +0000
Subject: [PATCH 13/14] drivers/media/usb/hdpvr/hdpvr-core.c: fix error return code
Message-Id: <1346945041-26676-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

Convert a nonnegative error return code to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/usb/hdpvr/hdpvr-core.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/hdpvr/hdpvr-core.c b/drivers/media/usb/hdpvr/hdpvr-core.c
index 304f43e..84dc26f 100644
--- a/drivers/media/usb/hdpvr/hdpvr-core.c
+++ b/drivers/media/usb/hdpvr/hdpvr-core.c
@@ -401,12 +401,14 @@ static int hdpvr_probe(struct usb_interface *interface,
 	client = hdpvr_register_ir_rx_i2c(dev);
 	if (!client) {
 		v4l2_err(&dev->v4l2_dev, "i2c IR RX device register failed\n");
+		retval = -ENODEV;
 		goto reg_fail;
 	}
 
 	client = hdpvr_register_ir_tx_i2c(dev);
 	if (!client) {
 		v4l2_err(&dev->v4l2_dev, "i2c IR TX device register failed\n");
+		retval = -ENODEV;
 		goto reg_fail;
 	}
 #endif

