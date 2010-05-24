From: Dan Carpenter <error27@gmail.com>
Date: Mon, 24 May 2010 16:29:34 +0000
Subject: [patch v2] caif: cleanup: remove duplicate checks
Message-Id: <20100524162815.GA22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100522204519.GW22515@bicker> <4BF8E6FE.9000303@bfs.de>
In-Reply-To: <4BF8E6FE.9000303@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: netdev@vger.kernel.org, Sjur Braendeland <sjur.brandeland@stericsson.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

"phyinfo" can never be null here because we assigned it an address, so I
removed both the assert and the second check inside the if statement.  I
removed the "phyinfo->phy_layer != NULL" check as well because that was
asserted earlier.

Walter Harms suggested I move the "phyinfo->phy_ref_count++;" outside
the if condition for readability, so I have done that.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
The original code increments phyinfo->phy_ref_count++ even if
phyinfo->phy_layer->modemcmd is NULL.  I kept it the same in my code,
but maybe I should change that?

v2: Removed an assert.  Moved the increment outside the if condition.

diff --git a/net/caif/cfcnfg.c b/net/caif/cfcnfg.c
index df43f26..7c81974 100644
--- a/net/caif/cfcnfg.c
+++ b/net/caif/cfcnfg.c
@@ -308,19 +308,15 @@ cfcnfg_linkup_rsp(struct cflayer *layer, u8 channel_id, enum cfctrl_srv serv,
 	caif_assert(cnfg != NULL);
 	caif_assert(phyid != 0);
 	phyinfo = &cnfg->phy_layers[phyid];
-	caif_assert(phyinfo != NULL);
 	caif_assert(phyinfo->id = phyid);
 	caif_assert(phyinfo->phy_layer != NULL);
 	caif_assert(phyinfo->phy_layer->id = phyid);
 
-	if (phyinfo != NULL &&
-	    phyinfo->phy_ref_count++ = 0 &&
-	    phyinfo->phy_layer != NULL &&
+	phyinfo->phy_ref_count++;
+	if (phyinfo->phy_ref_count = 1 &&
 	    phyinfo->phy_layer->modemcmd != NULL) {
-		caif_assert(phyinfo->phy_layer->id = phyid);
 		phyinfo->phy_layer->modemcmd(phyinfo->phy_layer,
 					     _CAIF_MODEMCMD_PHYIF_USEFULL);
-
 	}
 	adapt_layer->id = channel_id;
 
