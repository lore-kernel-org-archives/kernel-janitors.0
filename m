From: Ji-Hun Kim <ji_hun.kim@samsung.com>
Date: Thu, 05 Apr 2018 07:09:20 +0000
Subject: [PATCH v5 2/2] staging: vt6655: add handling memory leak on vnt_start()
Message-Id: <1522912160-21009-2-git-send-email-ji_hun.kim@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522912160-21009-1-git-send-email-ji_hun.kim@samsung.com>
 <CGME20180405071036epcas2p1d676b4a75f9644aac86c5d4a7792ffdf@epcas2p1.samsung.com>
In-Reply-To: <1522912160-21009-1-git-send-email-ji_hun.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com, gregkh@linuxfoundation.org, baijiaju1990@gmail.com, forest@alittletooquiet.net
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, ji_hun.kim@samsung.com, santhameena13@gmail.com

There was no code for handling memory leaks of device_init_rings() and
request_irq(). It needs to free allocated memory in the device_init_rings()
, when request_irq() would be failed. Add freeing sequences of irq and
device init rings.

Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>
---
It's additional memory leak handling patch from the
[PATCH v5 1/2] staging: vt6655: check for memory allocation failures

Changes v2:
- Change label names following coding-style conventions.
- Remove uneccessary goto, just return error number like original code.

 drivers/staging/vt6655/device_main.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 700c03c..1ab0e85 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1237,13 +1237,13 @@ static int vnt_start(struct ieee80211_hw *hw)
 			  IRQF_SHARED, "vt6655", priv);
 	if (ret) {
 		dev_dbg(&priv->pcid->dev, "failed to start irq\n");
-		return ret;
+		goto err_free_rings;
 	}
 
 	dev_dbg(&priv->pcid->dev, "call device init rd0 ring\n");
 	ret = device_init_rd0_ring(priv);
 	if (ret)
-		return ret;
+		goto err_free_irq;
 	ret = device_init_rd1_ring(priv);
 	if (ret)
 		goto err_free_rd0_ring;
@@ -1269,6 +1269,10 @@ static int vnt_start(struct ieee80211_hw *hw)
 	device_free_rd1_ring(priv);
 err_free_rd0_ring:
 	device_free_rd0_ring(priv);
+err_free_irq:
+	free_irq(priv->pcid->irq, priv);
+err_free_rings:
+	device_free_rings(priv);
 	return ret;
 }
 
-- 
1.9.1

