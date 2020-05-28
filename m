From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 28 May 2020 07:48:56 +0000
Subject: [PATCH] mt76: mt7615: Use kmemdup in mt7615_queue_key_update()
Message-Id: <20200528074856.118279-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Kalle
 Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Use kmemdup rather than duplicating its implementation

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 2e9e9d3519d7..c32f06c85f0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -289,12 +289,11 @@ mt7615_queue_key_update(struct mt7615_dev *dev, enum set_key_cmd cmd,
 	wd->type = MT7615_WTBL_KEY_DESC;
 	wd->sta = msta;
 
-	wd->key.key = kzalloc(key->keylen, GFP_KERNEL);
+	wd->key.key = kmemdup(key->key, key->keylen, GFP_KERNEL);
 	if (!wd->key.key) {
 		kfree(wd);
 		return -ENOMEM;
 	}
-	memcpy(wd->key.key, key->key, key->keylen);
 	wd->key.cipher = key->cipher;
 	wd->key.keyidx = key->keyidx;
 	wd->key.keylen = key->keylen;
