From: Zachary Richey <zr.public@gmail.com>
Date: Tue, 11 May 2010 18:13:48 +0000
Subject: [PATCH 1/2] Staging: wlan-ng: fix coding style issues in p80211_conv.c
Message-Id: <6d7f8e8ef8e4df0727d235d7e4650fb3ea9db5e0.1273600945.git.zr.public@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch fixes a simple coding style issue reported by checkpatch.pl in p80211_conv.c

Signed-off-by: Zachary Richey <zr.public@gmail.com>
---
 drivers/staging/wlan-ng/p80211conv.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211conv.c b/drivers/staging/wlan-ng/p80211conv.c
index a1605fb..71c3595 100644
--- a/drivers/staging/wlan-ng/p80211conv.c
+++ b/drivers/staging/wlan-ng/p80211conv.c
@@ -208,7 +208,7 @@ int skb_ether_to_p80211(wlandevice_t *wlandev, u32 ethconv,
 		p80211_wep->data = kmalloc(skb->len, GFP_ATOMIC);
 		foo = wep_encrypt(wlandev, skb->data, p80211_wep->data,
 				  skb->len,
-				  (wlandev->hostwep &HOSTWEP_DEFAULTKEY_MASK),
+				  (wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK),
 				  p80211_wep->iv, p80211_wep->icv);
 		if (foo) {
 			printk(KERN_WARNING
-- 
1.6.3.3

