From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 20 Nov 2019 01:47:22 +0000
Subject: [PATCH net v2] net: dsa: ocelot: add dependency for NET_DSA_MSCC_FELIX
Message-Id: <20191120014722.8075-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119.154125.1492881397881625788.davem@davemloft.net>
In-Reply-To: <20191119.154125.1492881397881625788.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vladimir.oltean@nxp.com, claudiu.manoil@nxp.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

If CONFIG_NET_DSA_MSCC_FELIX=y, and CONFIG_NET_VENDOR_MICROSEMI=n,
below errors can be found:
drivers/net/dsa/ocelot/felix.o: In function `felix_vlan_del':
felix.c:(.text+0x26e): undefined reference to `ocelot_vlan_del'
drivers/net/dsa/ocelot/felix.o: In function `felix_vlan_add':
felix.c:(.text+0x352): undefined reference to `ocelot_vlan_add'

and warning as below:
WARNING: unmet direct dependencies detected for MSCC_OCELOT_SWITCH
Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] &&
NET_VENDOR_MICROSEMI [=n] && NET_SWITCHDEV [=y] && HAS_IOMEM [=y]
Selected by [y]:
NET_DSA_MSCC_FELIX [=y] && NETDEVICES [=y] && HAVE_NET_DSA [=y]
&& NET_DSA [=y] && PCI [=y]

This patch is to select NET_VENDOR_MICROSEMI for NET_DSA_MSCC_FELIX.

Fixes: 56051948773e ("net: dsa: ocelot: add driver for Felix switch family")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v2: modify 'depends on' to 'select'.
 drivers/net/dsa/ocelot/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/ocelot/Kconfig b/drivers/net/dsa/ocelot/Kconfig
index 0031ca8..652604b 100644
--- a/drivers/net/dsa/ocelot/Kconfig
+++ b/drivers/net/dsa/ocelot/Kconfig
@@ -2,6 +2,7 @@
 config NET_DSA_MSCC_FELIX
 	tristate "Ocelot / Felix Ethernet switch support"
 	depends on NET_DSA && PCI
+	select NET_VENDOR_MICROSEMI
 	select MSCC_OCELOT_SWITCH
 	select NET_DSA_TAG_OCELOT
 	help
-- 
2.7.4
