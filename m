From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 May 2015 08:39:17 +0000
Subject: [patch] [media] rtl2832_sdr: cleanup some set_bit() calls
Message-Id: <20150514083917.GE1665@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <55536721.6070302@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti Palosaari <crope@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This code works fine but static checkers complain.  The test_bit()
function takes the bit number and not a mask.  Then the other issue is
that we were using USB_STATE_URB_BUF which is BIT(0) instead of URB_BUF.
Also we were open coding that instead of using the test/clear/set_bit()
functions.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 3ff8806..6362c6c 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -108,8 +108,8 @@ struct rtl2832_sdr_frame_buf {
 };
 
 struct rtl2832_sdr_dev {
-#define POWER_ON           (1 << 1)
-#define URB_BUF            (1 << 2)
+#define POWER_ON           0  /* BIT(0) */
+#define URB_BUF            1  /* BIT(1) */
 	unsigned long flags;
 
 	struct platform_device *pdev;
@@ -351,7 +351,7 @@ static int rtl2832_sdr_free_stream_bufs(struct rtl2832_sdr_dev *dev)
 {
 	struct platform_device *pdev = dev->pdev;
 
-	if (dev->flags & USB_STATE_URB_BUF) {
+	if (test_bit(URB_BUF, &dev->flags)) {
 		while (dev->buf_num) {
 			dev->buf_num--;
 			dev_dbg(&pdev->dev, "free buf=%d\n", dev->buf_num);
@@ -360,7 +360,7 @@ static int rtl2832_sdr_free_stream_bufs(struct rtl2832_sdr_dev *dev)
 					  dev->dma_addr[dev->buf_num]);
 		}
 	}
-	dev->flags &= ~USB_STATE_URB_BUF;
+	clear_bit(URB_BUF, &dev->flags);
 
 	return 0;
 }
@@ -389,7 +389,7 @@ static int rtl2832_sdr_alloc_stream_bufs(struct rtl2832_sdr_dev *dev)
 		dev_dbg(&pdev->dev, "alloc buf=%d %p (dma %llu)\n",
 			dev->buf_num, dev->buf_list[dev->buf_num],
 			(long long)dev->dma_addr[dev->buf_num]);
-		dev->flags |= USB_STATE_URB_BUF;
+		set_bit(URB_BUF, &dev->flags);
 	}
 
 	return 0;
