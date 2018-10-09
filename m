From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 09 Oct 2018 01:45:59 +0000
Subject: [PATCH v2] mt76x0: pci: fix set external PA I/O current
Message-Id: <1539049559-178175-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539004909-195005-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539004909-195005-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Stanislaw Gruszka <sgruszka@redhat.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/mediatek/mt76/mt76x0/pci.c: In function 'mt76x0e_register_device':
drivers/net/wireless/mediatek/mt76/mt76x0/pci.c:107:8: warning:
 variable 'data' set but not used [-Wunused-but-set-variable]

It seems correct value to write is 'data'

Fixes: 2b2cb40bcd7d ("mt76x0: pci: add hw initialization at bootstrap")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
---
v2: remove 'net-next' from patch title
---
 drivers/net/wireless/mediatek/mt76/mt76x0/pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
index 87997cd..0426c68 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
@@ -106,12 +106,12 @@ static int mt76x0e_register_device(struct mt76x02_dev *dev)
 		if (val & MT_EE_NIC_CONF_0_PA_IO_CURRENT) {
 			u32 data;
 
-			/* set external external PA I/O
+			/* set external PA I/O
 			 * current to 16mA
 			 */
 			data = mt76_rr(dev, 0x11c);
-			val |= 0xc03;
-			mt76_wr(dev, 0x11c, val);
+			data |= 0xc03;
+			mt76_wr(dev, 0x11c, data);
 		}
 	}
