From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 07 Dec 2018 03:52:43 +0000
Subject: [PATCH -next] usb: mtu3: fix dbginfo in qmu_tx_zlp_error_handler
Message-Id: <1544154763-156094-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-arm-kernel@lists.infradead.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/usb/mtu3/mtu3_qmu.c: In function 'qmu_tx_zlp_error_handler':
drivers/usb/mtu3/mtu3_qmu.c:385:22: warning:
 variable 'req' set but not used [-Wunused-but-set-variable]

It seems dbginfo original intention is print 'req' other than 'mreq'

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/mtu3/mtu3_qmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
index 73ac042..09f19f7 100644
--- a/drivers/usb/mtu3/mtu3_qmu.c
+++ b/drivers/usb/mtu3/mtu3_qmu.c
@@ -402,7 +402,7 @@ static void qmu_tx_zlp_error_handler(struct mtu3 *mtu, u8 epnum)
 		return;
 	}
 
-	dev_dbg(mtu->dev, "%s send ZLP for req=%p\n", __func__, mreq);
+	dev_dbg(mtu->dev, "%s send ZLP for req=%p\n", __func__, req);
 
 	mtu3_clrbits(mbase, MU3D_EP_TXCR0(mep->epnum), TX_DMAREQEN);
