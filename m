From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 11 Dec 2009 21:35:37 +0000
Subject: [PATCH 05/10] Fix a grammar error (redundant "be").
Message-Id: <1260567342-8327-6-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 drivers/net/wireless/zd1211rw/zd_mac.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/zd1211rw/zd_mac.c b/drivers/net/wireless/zd1211rw/zd_mac.c
index 2b7f965..7aad980 100644
--- a/drivers/net/wireless/zd1211rw/zd_mac.c
+++ b/drivers/net/wireless/zd1211rw/zd_mac.c
@@ -312,7 +312,7 @@ static void tx_status(struct ieee80211_hw *hw, struct sk_buff *skb,
  * zd_mac_tx_failed - callback for failed frames
  * @dev: the mac80211 wireless device
  *
- * This function is called if a frame couldn't be successfully be
+ * This function is called if a frame couldn't be successfully
  * transferred. The first frame from the tx queue, will be selected and
  * reported as error to the upper layers.
  */
-- 
1.6.3.3

