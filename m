From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 08 Jul 2015 20:22:46 +0000
Subject: [PATCH v2] brcmsmac: Use kstrdup to simplify code
Message-Id: <1436386966-16148-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1436383927-14010-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1436383927-14010-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvalo@codeaurora.org, brudley@broadcom.com, arend@broadcom.com, frankyl@broadcom.com, meuleman@broadcom.com
Cc: linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Replace a kmalloc+strcpy by an equivalent kstrdup in order to improve
readability.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: fix the subject

 drivers/net/wireless/brcm80211/brcmsmac/mac80211_if.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/brcm80211/brcmsmac/mac80211_if.c
index 4813506..8a6c077 100644
--- a/drivers/net/wireless/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/brcm80211/brcmsmac/mac80211_if.c
@@ -1476,9 +1476,7 @@ struct brcms_timer *brcms_init_timer(struct brcms_info *wl,
 	wl->timers = t;
 
 #ifdef DEBUG
-	t->name = kmalloc(strlen(name) + 1, GFP_ATOMIC);
-	if (t->name)
-		strcpy(t->name, name);
+	t->name = kstrdup(name, GFP_ATOMIC);
 #endif
 
 	return t;
-- 
2.1.4

