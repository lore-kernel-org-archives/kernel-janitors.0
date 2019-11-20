From: David Miller <davem@davemloft.net>
Date: Wed, 20 Nov 2019 02:53:23 +0000
Subject: Re: [PATCH net v2] net: dsa: ocelot: add dependency for NET_DSA_MSCC_FELIX
Message-Id: <20191119.185323.1049045586606004090.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119.154125.1492881397881625788.davem@davemloft.net>
        <20191120014722.8075-1-maowenan@huawei.com>
In-Reply-To: <20191120014722.8075-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: vladimir.oltean@nxp.com, claudiu.manoil@nxp.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 20 Nov 2019 09:47:22 +0800

> If CONFIG_NET_DSA_MSCC_FELIX=y, and CONFIG_NET_VENDOR_MICROSEMI=n,
> below errors can be found:
> drivers/net/dsa/ocelot/felix.o: In function `felix_vlan_del':
> felix.c:(.text+0x26e): undefined reference to `ocelot_vlan_del'
> drivers/net/dsa/ocelot/felix.o: In function `felix_vlan_add':
> felix.c:(.text+0x352): undefined reference to `ocelot_vlan_add'
> 
> and warning as below:
> WARNING: unmet direct dependencies detected for MSCC_OCELOT_SWITCH
> Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] &&
> NET_VENDOR_MICROSEMI [=n] && NET_SWITCHDEV [=y] && HAS_IOMEM [=y]
> Selected by [y]:
> NET_DSA_MSCC_FELIX [=y] && NETDEVICES [=y] && HAVE_NET_DSA [=y]
> && NET_DSA [=y] && PCI [=y]
> 
> This patch is to select NET_VENDOR_MICROSEMI for NET_DSA_MSCC_FELIX.
> 
> Fixes: 56051948773e ("net: dsa: ocelot: add driver for Felix switch family")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

You did not read my feedback, read it again please.
