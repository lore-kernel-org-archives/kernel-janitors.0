From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 31 Aug 2016 22:21:20 +0000
Subject: [PATCH 2/5] staging: netlogic: constify ethtool_ops structures
Message-Id: <1472682083-5219-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472682083-5219-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1472682083-5219-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Check for ethtool_ops structures that are only stored in the ethtool_ops
field of a net_device structure or passed as the second argument to
netdev_set_default_ethtool_ops.  These contexts are declared const, so
ethtool_ops structures that have these properties can be declared as const
also.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct ethtool_ops i@p = { ... };

@ok1@
identifier r.i;
struct net_device e;
position p;
@@
e.ethtool_ops = &i@p;

@ok2@
identifier r.i;
expression e;
position p;
@@
netdev_set_default_ethtool_ops(e, &i@p)

@bad@
position p != {r.p,ok1.p,ok2.p};
identifier r.i;
@@
i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct ethtool_ops i = { ... };
// </smpl>

Suggested-by: Stephen Hemminger <stephen@networkplumber.org>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/netlogic/xlr_net.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/netlogic/xlr_net.c b/drivers/staging/netlogic/xlr_net.c
index 99445d0..595ac1b 100644
--- a/drivers/staging/netlogic/xlr_net.c
+++ b/drivers/staging/netlogic/xlr_net.c
@@ -192,7 +192,7 @@ static int xlr_set_settings(struct net_device *ndev, struct ethtool_cmd *ecmd)
 	return phy_ethtool_sset(phydev, ecmd);
 }
 
-static struct ethtool_ops xlr_ethtool_ops = {
+static const struct ethtool_ops xlr_ethtool_ops = {
 	.get_settings = xlr_get_settings,
 	.set_settings = xlr_set_settings,
 };

