From: Ji-Hun Kim <ji_hun.kim@samsung.com>
Date: Fri, 30 Mar 2018 05:51:55 +0000
Subject: [PATCH v4 2/2] staging: vt6655: add handling memory leak on vnt_start()
Message-Id: <1522389115-1124-2-git-send-email-ji_hun.kim@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522389115-1124-1-git-send-email-ji_hun.kim@samsung.com>
 <CGME20180330055211epcas2p1a75c707cdf600cfd5027e253ef440861@epcas2p1.samsung.com>
In-Reply-To: <1522389115-1124-1-git-send-email-ji_hun.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, baijiaju1990@gmail.com, forest@alittletooquiet.net
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, ji_hun.kim@samsung.com, santhameena13@gmail.com

There was no code for handling memory leaks of device_init_rings() and
request_irq(). It needs to free allocated memory in the device_init_rings()
, when request_irq() is failed. Add freeing sequences of irq and device
init rings.

Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>
---
It's additional memory leak handling patch from
[PATCH v4 1/2] staging: vt6655: check for memory allocation failures

 drivers/staging/vt6655/device_main.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index c9752df..3604f2d 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1194,14 +1194,17 @@ static int vnt_start(struct ieee80211_hw *hw)
 	int ret;
 
 	priv->rx_buf_sz = PKT_BUF_SZ;
-	if (!device_init_rings(priv))
-		return -ENOMEM;
+	ret = (int)device_init_rings(priv);
+	if (!ret) {
+		ret = -ENOMEM;
+		goto err_init_rings;
+	}
 
 	ret = request_irq(priv->pcid->irq, vnt_interrupt,
 			  IRQF_SHARED, "vt6655", priv);
 	if (ret) {
 		dev_dbg(&priv->pcid->dev, "failed to start irq\n");
-		return ret;
+		goto err_irq;
 	}
 
 	dev_dbg(&priv->pcid->dev, "call device init rd0 ring\n");
@@ -1234,6 +1237,10 @@ static int vnt_start(struct ieee80211_hw *hw)
 err_init_rd1_ring:
 	device_free_rd0_ring(priv);
 err_init_rd0_ring:
+	free_irq(priv->pcid->irq, priv);
+err_irq:
+	device_free_rings(priv);
+err_init_rings:
 	return ret;
 }
 
-- 
1.9.1

