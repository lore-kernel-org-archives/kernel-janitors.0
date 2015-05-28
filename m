From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 28 May 2015 21:02:20 +0000
Subject: [PATCH 5/9] wl1251: drop unneeded goto
Message-Id: <1432846944-7122-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432846944-7122-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1432846944-7122-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete jump to a label on the next line, when that label is not
used elsewhere.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier l;
@@

-if (...) goto l;
-l:
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/wireless/ti/wl1251/acx.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ti/wl1251/acx.c b/drivers/net/wireless/ti/wl1251/acx.c
index 5695628..d6fbdda 100644
--- a/drivers/net/wireless/ti/wl1251/acx.c
+++ b/drivers/net/wireless/ti/wl1251/acx.c
@@ -53,10 +53,7 @@ int wl1251_acx_station_id(struct wl1251 *wl)
 		mac->mac[i] = wl->mac_addr[ETH_ALEN - 1 - i];
 
 	ret = wl1251_cmd_configure(wl, DOT11_STATION_ID, mac, sizeof(*mac));
-	if (ret < 0)
-		goto out;
 
-out:
 	kfree(mac);
 	return ret;
 }

