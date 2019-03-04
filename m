From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 04 Mar 2019 00:57:11 +0000
Subject: [PATCH net-next] mt76: fix return value check in mt76_wmac_probe()
Message-Id: <20190304011000.62693-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-mediatek@lists.infradead.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: c8846e101502 ("mt76: add driver for MT7603E and MT7628/7688")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/soc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/soc.c b/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
index e13fea80d970..b920be1f5718 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
@@ -23,9 +23,9 @@ mt76_wmac_probe(struct platform_device *pdev)
 	}
 
 	mem_base = devm_ioremap_resource(&pdev->dev, res);
-	if (!mem_base) {
+	if (IS_ERR(mem_base)) {
 		dev_err(&pdev->dev, "Failed to get memory resource\n");
-		return -EINVAL;
+		return PTR_ERR(mem_base);
 	}
 
 	mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), &mt7603_ops,
