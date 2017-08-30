From: Salil Mehta <salil.mehta@huawei.com>
Date: Wed, 30 Aug 2017 11:08:05 +0000
Subject: RE: [bug report] net: hns3: Add MDIO support to HNS3 Ethernet driver for hip08 SoC
Message-Id: <F4CC6FACFEB3C54C9141D49AD221F7F93B88DCDD@FRAEML521-MBX.china.huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170829192449.ndgst5b2anah33vj@mwanda>
In-Reply-To: <20170829192449.ndgst5b2anah33vj@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, August 29, 2017 8:29 PM
> To: Salil Mehta
> Cc: kernel-janitors@vger.kernel.org
> Subject: [bug report] net: hns3: Add MDIO support to HNS3 Ethernet
> driver for hip08 SoC
> 
> Hello Salil,
> 
> The patch 256727da7395: "net: hns3: Add MDIO support to HNS3 Ethernet
> driver for hip08 SoC" from Aug 2, 2017, leads to the following static
> checker warning:
> 
> 	drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mdio.c:153
> hclge_mac_mdio_config()
> 	warn: 'phydev' isn't an ERR_PTR
> 
> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mdio.c
>    142          mdio_bus->parent = &hdev->pdev->dev;
>    143          mdio_bus->priv = hdev;
>    144          mdio_bus->phy_mask = ~(1 << mac->phy_addr);
>    145          ret = mdiobus_register(mdio_bus);
>    146          if (ret) {
>    147                  dev_err(mdio_bus->parent,
>    148                          "Failed to register MDIO bus ret > %#x\n", ret);
>    149                  return ret;
>    150          }
>    151
>    152          phydev = mdiobus_get_phy(mdio_bus, mac->phy_addr);
>    153          if (!phydev || IS_ERR(phydev)) {
>                                ^^^^^^^^^^^^^^
> mdiobus_get_phy() never returns error pointers.
Sure, will fix this. Thanks!

Salil
> 
>    154                  dev_err(mdio_bus->parent, "Failed to get phy
> device\n");
>    155                  mdiobus_unregister(mdio_bus);
>    156                  return -EIO;
>    157          }
>    158
>    159          mac->phydev = phydev;
>    160          mac->mdio_bus = mdio_bus;
>    161
>    162          return 0;
> 
> 
> regards,
> dan carpenter
