From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Fri, 03 Oct 2014 13:40:33 +0000
Subject: Re: net: pxa168_eth: set the mac address on the Ethernet controller
Message-Id: <20141003134033.GA4323@kwain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141001165402.GB16843@mwanda>
In-Reply-To: <20141001165402.GB16843@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, Oct 01, 2014 at 07:54:02PM +0300, Dan Carpenter wrote:
> Hello Antoine T=E9nart,
>=20
> The patch 39830689ef0a: "net: pxa168_eth: set the mac address on the
> Ethernet controller" from Sep 30, 2014, leads to the following static
> checker warning:
>=20
> 	drivers/net/ethernet/marvell/pxa168_eth.c:640 pxa168_eth_set_mac_address=
()
> 	warn: using signed char for bitops

Thanks for reporting this!

>=20
> drivers/net/ethernet/marvell/pxa168_eth.c
>    625  static int pxa168_eth_set_mac_address(struct net_device *dev, voi=
d *addr)
>    626  {
>    627          struct sockaddr *sa =3D addr;
>    628          struct pxa168_eth_private *pep =3D netdev_priv(dev);
>    629          unsigned char oldMac[ETH_ALEN];
>    630          u32 mac_h, mac_l;
>    631 =20
>    632          if (!is_valid_ether_addr(sa->sa_data))
>    633                  return -EADDRNOTAVAIL;
>    634          memcpy(oldMac, dev->dev_addr, ETH_ALEN);
>    635          memcpy(dev->dev_addr, sa->sa_data, ETH_ALEN);
>    636 =20
>    637          mac_h =3D sa->sa_data[0] << 24;
>    638          mac_h |=3D sa->sa_data[1] << 16;
>    639          mac_h |=3D sa->sa_data[2] << 8;
>    640          mac_h |=3D sa->sa_data[3];
>=20
> You may end up with weird signedness bugs doing this (depending of if
> the highest bit is ever used).

Since dev->dev_addr is of type unsigned char *, I could use it instead.
That's what most of the other net drivers do, at least.

While having a look on other net drivers, I spotted
drivers/net/ethernet/toshiba/spider_net.c which is also using signed
char for bitops and may need a fix:

        macu =3D (addr->sa_data[0]<<24) + (addr->sa_data[1]<<16) +
                (addr->sa_data[2]<<8) + (addr->sa_data[3]);
        macl =3D (addr->sa_data[4]<<8) + (addr->sa_data[5]);


I'll cook up a fix for both of them if the solution's OK with you.


Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
