From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Nov 2014 09:43:40 +0000
Subject: [patch] brcmsmac: NULL dereferences in brcms_c_detach_mfree()
Message-Id: <20141128094340.GA10364@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Rudley <brudley@broadcom.com>
Cc: Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, Markus Elfring <elfring@users.sourceforge.net>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

The brcms_c_attach_malloc() function can call this with a NULL
"wlc->corestate" or "wlc->hw".

Also I threw in a bonus cleanup by deleting an obvious comment and a
no-op NULL assignment.  :)

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/brcm80211/brcmsmac/main.c b/drivers/net/wireless/brcm80211/brcmsmac/main.c
index 738cfac..a104d7a 100644
--- a/drivers/net/wireless/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/brcm80211/brcmsmac/main.c
@@ -445,18 +445,18 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc->protection);
 	kfree(wlc->stf);
 	kfree(wlc->bandstate[0]);
-	kfree(wlc->corestate->macstat_snapshot);
+	if (wlc->corestate)
+		kfree(wlc->corestate->macstat_snapshot);
 	kfree(wlc->corestate);
-	kfree(wlc->hw->bandstate[0]);
+	if (wlc->hw)
+		kfree(wlc->hw->bandstate[0]);
 	kfree(wlc->hw);
 	if (wlc->beacon)
 		dev_kfree_skb_any(wlc->beacon);
 	if (wlc->probe_resp)
 		dev_kfree_skb_any(wlc->probe_resp);
 
-	/* free the wlc */
 	kfree(wlc);
-	wlc = NULL;
 }
 
 static struct brcms_bss_cfg *brcms_c_bsscfg_malloc(uint unit)
