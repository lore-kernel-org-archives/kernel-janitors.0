From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 15 Sep 2016 20:23:25 +0000
Subject: [PATCH 2/3] dwc_eth_qos: constify net_device_ops structures
Message-Id: <1473971006-2074-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473971006-2074-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1473971006-2074-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Persson <lars.persson@axis.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Check for net_device_ops structures that are only stored in the netdev_ops
field of a net_device structure.  This field is declared const, so
net_device_ops structures that have this property can be declared as const
also.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct net_device_ops i@p = { ... };

@ok@
identifier r.i;
struct net_device e;
position p;
@@
e.netdev_ops = &i@p;

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct net_device_ops e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct net_device_ops i = { ... };
// </smpl>

The result of size on this file before the change is:
   text	      data     bss     dec         hex	  filename
  21623       1316      40   22979        59c3
   drivers/net/ethernet/synopsys/dwc_eth_qos.o

and after the change it is:
   text	     data        bss	    dec	    hex	filename
  22199       724         40      22963    59b3
   drivers/net/ethernet/synopsys/dwc_eth_qos.o

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/ethernet/synopsys/dwc_eth_qos.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/synopsys/dwc_eth_qos.c b/drivers/net/ethernet/synopsys/dwc_eth_qos.c
index c25d971..b5c4554 100644
--- a/drivers/net/ethernet/synopsys/dwc_eth_qos.c
+++ b/drivers/net/ethernet/synopsys/dwc_eth_qos.c
@@ -2761,7 +2761,7 @@ static const struct ethtool_ops dwceqos_ethtool_ops = {
 	.set_link_ksettings = phy_ethtool_set_link_ksettings,
 };
 
-static struct net_device_ops netdev_ops = {
+static const struct net_device_ops netdev_ops = {
 	.ndo_open		= dwceqos_open,
 	.ndo_stop		= dwceqos_stop,
 	.ndo_start_xmit		= dwceqos_start_xmit,

