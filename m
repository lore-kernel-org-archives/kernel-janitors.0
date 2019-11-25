From: Vladimir Oltean <olteanv@gmail.com>
Date: Mon, 25 Nov 2019 19:42:22 +0000
Subject: Re: [PATCH net v3] net: dsa: ocelot: add dependency for NET_DSA_MSCC_FELIX
Message-Id: <CA+h21hphrWr84wHGj1U4fVHd8OdmpGVPeouznCCPrZC05PLcig@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3e9d6100-6965-da85-c310-6e1a9318f61d@huawei.com> <20191125124110.145595-1-maowenan@huawei.com>
In-Reply-To: <20191125124110.145595-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, 25 Nov 2019 at 14:47, Mao Wenan <maowenan@huawei.com> wrote:
>
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
> This patch is to select NET_VENDOR_MICROSEMI and add dependency
> NET_SWITCHDEV, HAS_IOMEM for NET_DSA_MSCC_FELIX.
>
> Fixes: 56051948773e ("net: dsa: ocelot: add driver for Felix switch family")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---

NET_DSA already selects NET_SWITCHDEV
MSCC_OCELOT_SWITCH already selects HAS_IOMEM
As for NET_VENDOR_MICROSEMI, does anyone care what are the results
after Kconfig prints this?

WARNING: unmet direct dependencies detected for MSCC_OCELOT_SWITCH
  Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] &&
NET_VENDOR_MICROSEMI [=n] && NET_SWITCHDEV [=y] && HAS_IOMEM [=y]
  Selected by [y]:
  - NET_DSA_MSCC_FELIX [=y] && NETDEVICES [=y] && HAVE_NET_DSA [=y] &&
NET_DSA [=y] && PCI [=y]

WARNING: unmet direct dependencies detected for MSCC_OCELOT_SWITCH
  Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] &&
NET_VENDOR_MICROSEMI [=n] && NET_SWITCHDEV [=y] && HAS_IOMEM [=y]
  Selected by [y]:
  - NET_DSA_MSCC_FELIX [=y] && NETDEVICES [=y] && HAVE_NET_DSA [=y] &&
NET_DSA [=y] && PCI [=y]

WARNING: unmet direct dependencies detected for MSCC_OCELOT_SWITCH
  Depends on [n]: NETDEVICES [=y] && ETHERNET [=y] &&
NET_VENDOR_MICROSEMI [=n] && NET_SWITCHDEV [=y] && HAS_IOMEM [=y]
  Selected by [y]:
  - NET_DSA_MSCC_FELIX [=y] && NETDEVICES [=y] && HAVE_NET_DSA [=y] &&
NET_DSA [=y] && PCI [=y]

If yes. why?

It's like executing code after return.

>  v3: add depends on NET_SWITCHDEV and HAS_IOMEM.
>  v2: modify 'depends on' to 'select'.
>  drivers/net/dsa/ocelot/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/dsa/ocelot/Kconfig b/drivers/net/dsa/ocelot/Kconfig
> index 0031ca814346..1ec2dfbd76ce 100644
> --- a/drivers/net/dsa/ocelot/Kconfig
> +++ b/drivers/net/dsa/ocelot/Kconfig
> @@ -2,6 +2,9 @@
>  config NET_DSA_MSCC_FELIX
>         tristate "Ocelot / Felix Ethernet switch support"
>         depends on NET_DSA && PCI
> +       depends on NET_SWITCHDEV
> +       depends on HAS_IOMEM
> +       select NET_VENDOR_MICROSEMI
>         select MSCC_OCELOT_SWITCH
>         select NET_DSA_TAG_OCELOT
>         help
> --
> 2.20.1
>

Regards,
-Vladimir
