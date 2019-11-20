From: maowenan <maowenan@huawei.com>
Date: Wed, 20 Nov 2019 01:27:32 +0000
Subject: Re: [PATCH net] net: dsa: ocelot: add dependency for NET_DSA_MSCC_FELIX
Message-Id: <b541e6bb-020f-c2c4-8921-9f4d140f3bcb@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119025128.7393-1-maowenan@huawei.com>
 <20191119.154125.1492881397881625788.davem@davemloft.net>
In-Reply-To: <20191119.154125.1492881397881625788.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: David Miller <davem@davemloft.net>
Cc: vladimir.oltean@nxp.com, claudiu.manoil@nxp.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



=D4=DA 2019/11/20 7:41, David Miller =D0=B4=B5=C0:
> From: Mao Wenan <maowenan@huawei.com>
> Date: Tue, 19 Nov 2019 10:51:28 +0800
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
>> This patch add dependency NET_VENDOR_MICROSEMI for NET_DSA_MSCC_FELIX.
>>
>> Fixes: 56051948773e ("net: dsa: ocelot: add driver for Felix switch fami=
ly")
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>=20
> This seems more like a "select" situation, why in the world should the
> user be required to know about NET_VENDOR_MISCROSEMI at all for this
> driver?
thanks.
I will change to 'select' it and send v2.
>=20
> And NET_VENDOR_MICROSEMI does _NOT_ enable any code at all, you have
> to enable the individual drivers guarded by NET_VENDOR_MICROSEMI in order
> to resolve the symbols necessary for ocelot.
>=20
> I'm not applying this, it isn't correct.
>=20
> Thank you.
>=20
> .
>=20
