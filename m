From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Sep 2014 10:36:39 +0000
Subject: [patch] [media] hackrf: harmless off by one in debug code
Message-Id: <20140924103639.GB15107@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti Palosaari <crope@iki.fi>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that "i" could be one element beyond the end
of the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index 328b5ba..fd1fa41 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -932,7 +932,7 @@ static int hackrf_set_bandwidth(struct hackrf_dev *dev)
 	dev->bandwidth->val = bandwidth;
 	dev->bandwidth->cur.val = bandwidth;
 
-	dev_dbg(dev->dev, "bandwidth selected=%d\n", bandwidth_lut[i].freq);
+	dev_dbg(dev->dev, "bandwidth selected=%d\n", bandwidth);
 
 	u16tmp = 0;
 	u16tmp |= ((bandwidth >> 0) & 0xff) << 0;
