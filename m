From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 14:50:22 +0000
Subject: [PATCH] stmmac: Remove redundant unlikely()
Message-Id: <1291906222-575-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/net/stmmac/stmmac_main.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/stmmac/stmmac_main.c b/drivers/net/stmmac/stmmac_main.c
index c0dc785..20f803d 100644
--- a/drivers/net/stmmac/stmmac_main.c
+++ b/drivers/net/stmmac/stmmac_main.c
@@ -949,7 +949,7 @@ static int stmmac_sw_tso(struct stmmac_priv *priv, struct sk_buff *skb)
 	       skb, skb->len);
 
 	segs = skb_gso_segment(skb, priv->dev->features & ~NETIF_F_TSO);
-	if (unlikely(IS_ERR(segs)))
+	if (IS_ERR(segs))
 		goto sw_tso_end;
 
 	do {
-- 
1.7.0.4

