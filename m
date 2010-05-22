From: Dan Carpenter <error27@gmail.com>
Date: Sat, 22 May 2010 20:45:19 +0000
Subject: [patch] caif: cleanup: remove duplicate checks
Message-Id: <20100522204519.GW22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Sjur Braendeland <sjur.brandeland@stericsson.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

These checks merely duplicate the things we've asserted already.  In the
case of the checks for null we've already dereferenced those variables
as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/caif/cfcnfg.c b/net/caif/cfcnfg.c
index df43f26..cc2f072 100644
--- a/net/caif/cfcnfg.c
+++ b/net/caif/cfcnfg.c
@@ -313,14 +313,10 @@ cfcnfg_linkup_rsp(struct cflayer *layer, u8 channel_id, enum cfctrl_srv serv,
 	caif_assert(phyinfo->phy_layer != NULL);
 	caif_assert(phyinfo->phy_layer->id = phyid);
 
-	if (phyinfo != NULL &&
-	    phyinfo->phy_ref_count++ = 0 &&
-	    phyinfo->phy_layer != NULL &&
+	if (phyinfo->phy_ref_count++ = 0 &&
 	    phyinfo->phy_layer->modemcmd != NULL) {
-		caif_assert(phyinfo->phy_layer->id = phyid);
 		phyinfo->phy_layer->modemcmd(phyinfo->phy_layer,
 					     _CAIF_MODEMCMD_PHYIF_USEFULL);
-
 	}
 	adapt_layer->id = channel_id;
 
