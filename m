From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 13 Jan 2014 15:23:26 +0000
Subject: [PATCH 1/4] ksz884x: delete useless variable
Message-Id: <1389629847-5330-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1389629847-5330-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1389629847-5330-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete a variable that is at most only assigned to a constant, but never
used otherwise.  In this code, it is the variable result that is used for
the return code, not rc.

A simplified version of the semantic patch that fixes this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
identifier i;
constant c;
@@

-T i;
<... when != i
-i = c;
...>
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/ethernet/micrel/ksz884x.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/micrel/ksz884x.c
index 8e9dad7..ce84dc2 100644
--- a/drivers/net/ethernet/micrel/ksz884x.c
+++ b/drivers/net/ethernet/micrel/ksz884x.c
@@ -5853,15 +5853,12 @@ static int netdev_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 	struct dev_info *hw_priv = priv->adapter;
 	struct ksz_hw *hw = &hw_priv->hw;
 	struct ksz_port *port = &priv->port;
-	int rc;
 	int result = 0;
 	struct mii_ioctl_data *data = if_mii(ifr);
 
 	if (down_interruptible(&priv->proc_sem))
 		return -ERESTARTSYS;
 
-	/* assume success */
-	rc = 0;
 	switch (cmd) {
 	/* Get address of MII PHY in use. */
 	case SIOCGMIIPHY:

