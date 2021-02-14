From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Sun, 14 Feb 2021 03:02:37 +0000
Subject: [PATCH] mt76: mt7921: remove unnecessary variable
Message-Id: <YCiSzfUQi2YtC+l4@fedora>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org

In mt7921_pm_set() the variable "ret" is initialized to zero
and then returned. Remove it and return zero.

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
index 0dc8e25e18e4..4bc3dd99bd14 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -164,7 +164,6 @@ mt7921_pm_set(void *data, u64 val)
 {
 	struct mt7921_dev *dev = data;
 	struct mt76_phy *mphy = dev->phy.mt76;
-	int ret = 0;
 
 	mt7921_mutex_acquire(dev);
 
@@ -175,7 +174,7 @@ mt7921_pm_set(void *data, u64 val)
 					    mt7921_pm_interface_iter, mphy->priv);
 	mt7921_mutex_release(dev);
 
-	return ret;
+	return 0;
 }
 
 static int
-- 
2.29.2
