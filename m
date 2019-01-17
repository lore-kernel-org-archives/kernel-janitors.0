From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 17 Jan 2019 03:14:54 +0000
Subject: [PATCH -next] i2c: imx: Fix inconsistent IS_ERR and PTR_ERR in i2c_imx_dma_request()
Message-Id: <1547694894-69589-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, peda@axentia.se, wsa+renesas@sang-engineering.com, u.kleine-koenig@pengutronix.de, l.stach@pengutronix.de, eha@deif.com, linux@rempel-privat.de
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Change the call to PTR_ERR to access the value just tested by IS_ERR.

Fixes: 5b3a23a3cc94 ("i2c: imx: notify about real errors on dma i2c_imx_dma_request")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 09b1245..42fed40 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -287,7 +287,7 @@ static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
-		ret = PTR_ERR(dma->chan_rx);
+		ret = PTR_ERR(dma->chan_tx);
 		if (ret != -ENODEV && ret != -EPROBE_DEFER)
 			dev_err(dev, "can't request DMA tx channel (%d)\n", ret);
 		goto fail_al;
