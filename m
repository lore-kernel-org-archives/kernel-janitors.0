From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 15:01:07 +0000
Subject: [PATCH] staging: brcm80211: Remove redundant unlikely()
Message-Id: <1291906867-1485-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Rudley <brudley@broadcom.com>, Henry Ptasinski <henryp@broadcom.com>, Nohee Ko <noheek@broadcom.com>, Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c b/drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c
index 0d7aa4a..edf300d 100644
--- a/drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c
+++ b/drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c
@@ -3196,7 +3196,7 @@ s32 wl_cfg80211_attach(struct net_device *ndev, void *data)
 	}
 	WL_DBG(("func %p\n", wl_cfg80211_get_sdio_func()));
 	wdev = wl_alloc_wdev(sizeof(struct wl_iface), &wl_cfg80211_get_sdio_func()->dev);
-	if (unlikely(IS_ERR(wdev)))
+	if (IS_ERR(wdev))
 		return -ENOMEM;
 
 	wdev->iftype = wl_mode_to_nl80211_iftype(WL_MODE_BSS);
-- 
1.7.0.4

