From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Nov 2019 08:23:29 +0000
Subject: [bug report] dpaa2-eth: add MAC/PHY support through phylink
Message-Id: <20191106082329.GA32733@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ioana Ciornei,

The patch 719479230893: "dpaa2-eth: add MAC/PHY support through
phylink" from Oct 31, 2019, leads to the following static checker
warning:

	drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:55 dpaa2_mac_get_if_mode()
	warn: always true condition '(if_mode >= 0) => (0-u32max >= 0)'

drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
    44  static int dpaa2_mac_get_if_mode(struct device_node *node,
    45                                   struct dpmac_attr attr)
    46  {
    47          phy_interface_t if_mode;
    48          int err;
    49  
    50          err = of_get_phy_mode(node, &if_mode);
    51          if (!err)
    52                  return if_mode;
    53  
    54          if_mode = phy_mode(attr.eth_if);
    55          if (if_mode >= 0)
                    ^^^^^^^^^^^^
This enum is unsigned so the condition is always true.

    56                  return if_mode;
    57  
    58          return -ENODEV;
    59  }

regards,
dan carpenter
