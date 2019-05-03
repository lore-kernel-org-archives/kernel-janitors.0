From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 12:54:36 +0000
Subject: [PATCH] mt76: Fix a signedness bug in mt7615_add_interface()
Message-Id: <20190502212341.GA31847@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

The problem is that "mvif->omac_idx" is a u8 so it can't be negative
and the error handling won't work.  The get_omac_idx() function returns
-1 on error.

Fixes: 04b8e65922f6 ("mt76: add mac80211 driver for MT7615 PCIe-based chipsets")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 80e6b211f60b..8d7a47d1b205 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -77,11 +77,12 @@ static int mt7615_add_interface(struct ieee80211_hw *hw,
 		goto out;
 	}
 
-	mvif->omac_idx = get_omac_idx(vif->type, dev->omac_mask);
-	if (mvif->omac_idx < 0) {
+	idx = get_omac_idx(vif->type, dev->omac_mask);
+	if (idx < 0) {
 		ret = -ENOSPC;
 		goto out;
 	}
+	mvif->omac_idx = idx;
 
 	/* TODO: DBDC support. Use band 0 and wmm 0 for now */
 	mvif->band_idx = 0;
-- 
2.18.0
