From: maowenan <maowenan@huawei.com>
Date: Wed, 20 Nov 2019 09:38:38 +0000
Subject: Re: [PATCH net v2] net: dsa: ocelot: add dependency for NET_DSA_MSCC_FELIX
Message-Id: <3e9d6100-6965-da85-c310-6e1a9318f61d@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119.154125.1492881397881625788.davem@davemloft.net>
 <20191120014722.8075-1-maowenan@huawei.com>
 <20191119.185323.1049045586606004090.davem@davemloft.net>
In-Reply-To: <20191119.185323.1049045586606004090.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: David Miller <davem@davemloft.net>
Cc: vladimir.oltean@nxp.com, claudiu.manoil@nxp.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



=D4=DA 2019/11/20 10:53, David Miller =D0=B4=B5=C0:
> From: Mao Wenan <maowenan@huawei.com>
> Date: Wed, 20 Nov 2019 09:47:22 +0800
>=20
>> If CONFIG_NET_DSA_MSCC_FELIX=3Dy, and CONFIG_NET_VENDOR_MICROSEMI=3Dn,
>> below errors can be found:
>> drivers/net/dsa/ocelot/felix.o: In function `felix_vlan_del':
>> felix.c:(.text+0x26e): undefined reference to `ocelot_vlan_del'
>> drivers/net/dsa/ocelot/felix.o: In function `felix_vlan_add':
>> felix.c:(.text+0x352): undefined reference to `ocelot_vlan_add'
>>
>> and warning as below:
>> WARNING: unmet direct dependencies detected for MSCC_OCELOT_SWITCH
>> Depends on [n]: NETDEVICES [=3Dy] && ETHERNET [=3Dy] &&
>> NET_VENDOR_MICROSEMI [=3Dn] && NET_SWITCHDEV [=3Dy] && HAS_IOMEM [=3Dy]
>> Selected by [y]:
>> NET_DSA_MSCC_FELIX [=3Dy] && NETDEVICES [=3Dy] && HAVE_NET_DSA [=3Dy]
>> && NET_DSA [=3Dy] && PCI [=3Dy]
>>
>> This patch is to select NET_VENDOR_MICROSEMI for NET_DSA_MSCC_FELIX.
>>
>> Fixes: 56051948773e ("net: dsa: ocelot: add driver for Felix switch fami=
ly")
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>=20
> You did not read my feedback, read it again please.
Sorry for that, do you mean firstly to resolve dependencies according to MS=
CC_OCELOT_SWITCH,
config MSCC_OCELOT_SWITCH
        tristate "Ocelot switch driver"
        depends on NET_SWITCHDEV
        depends on HAS_IOMEM

after that to select in MSCC_OCELOT_SWITCH in NET_DSA_MSCC_FELIX,
config NET_DSA_MSCC_FELIX
        tristate "Ocelot / Felix Ethernet switch support"
        depends on NET_DSA && PCI
+	select NET_VENDOR_MICROSEMI
+       depends on NET_SWITCHDEV
+	depends on HAS_IOMEM
        select MSCC_OCELOT_SWITCH
        select NET_DSA_TAG_OCELOT
        help


>=20
> .
>=20
