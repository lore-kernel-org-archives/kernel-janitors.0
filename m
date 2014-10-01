From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Oct 2014 16:54:02 +0000
Subject: re: net: pxa168_eth: set the mac address on the Ethernet controller
Message-Id: <20141001165402.GB16843@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hello Antoine T=E9nart,

The patch 39830689ef0a: "net: pxa168_eth: set the mac address on the
Ethernet controller" from Sep 30, 2014, leads to the following static
checker warning:

	drivers/net/ethernet/marvell/pxa168_eth.c:640 pxa168_eth_set_mac_address()
	warn: using signed char for bitops

drivers/net/ethernet/marvell/pxa168_eth.c
   625  static int pxa168_eth_set_mac_address(struct net_device *dev, void =
*addr)
   626  {
   627          struct sockaddr *sa =3D addr;
   628          struct pxa168_eth_private *pep =3D netdev_priv(dev);
   629          unsigned char oldMac[ETH_ALEN];
   630          u32 mac_h, mac_l;
   631 =20
   632          if (!is_valid_ether_addr(sa->sa_data))
   633                  return -EADDRNOTAVAIL;
   634          memcpy(oldMac, dev->dev_addr, ETH_ALEN);
   635          memcpy(dev->dev_addr, sa->sa_data, ETH_ALEN);
   636 =20
   637          mac_h =3D sa->sa_data[0] << 24;
   638          mac_h |=3D sa->sa_data[1] << 16;
   639          mac_h |=3D sa->sa_data[2] << 8;
   640          mac_h |=3D sa->sa_data[3];

You may end up with weird signedness bugs doing this (depending of if
the highest bit is ever used).

   641          mac_l =3D sa->sa_data[4] << 8;
   642          mac_l |=3D sa->sa_data[5];
   643          wrl(pep, MAC_ADDR_HIGH, mac_h);
   644          wrl(pep, MAC_ADDR_LOW, mac_l);
   645 =20
   646          netif_addr_lock_bh(dev);
   647          update_hash_table_mac_address(pep, oldMac, dev->dev_addr);
   648          netif_addr_unlock_bh(dev);
   649          return 0;
   650  }

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
