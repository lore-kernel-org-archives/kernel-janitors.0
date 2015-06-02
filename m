From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Jun 2015 10:03:15 +0000
Subject: re: stmmac: add ipq806x glue layer
Message-Id: <20150602100315.GB11247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Mathieu Olivari,

The patch b1c17215d718: "stmmac: add ipq806x glue layer" from May 27,
2015, leads to the following static checker warning:

	drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c:297 ipq806x_gmac_setup()
	warn: double left shift '1 << (1 << gmac->id)'

drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
   292          /* Configure the clock src according to the mode */
   293          regmap_read(gmac->nss_common, NSS_COMMON_CLK_SRC_CTRL, &val);
   294          val &= ~NSS_COMMON_CLK_SRC_CTRL_OFFSET(gmac->id);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We are clearing a bit here, but it's not the same bit we set later.

   295          switch (gmac->phy_mode) {
   296          case PHY_INTERFACE_MODE_RGMII:
   297                  val |= NSS_COMMON_CLK_SRC_CTRL_RGMII(gmac->id) <<
   298                          NSS_COMMON_CLK_SRC_CTRL_OFFSET(gmac->id);

NSS_COMMON_CLK_SRC_CTRL_RGMII(gmac->id) is always 1.
NSS_COMMON_CLK_SRC_CTRL_OFFSET is "(1 << gmac->id)".
gmac->id is a number in the 0-3 range so val is either 0x100, 0x10, 0x4
or 0x2, which is kind of weird.

Also the comments seem to imply that we read a number 1-4 for gmac->id
but we map it to 0-3 so that counting starts at zero.  But I don't see
that we subtract 1 from the number that we read in
ipq806x_gmac_of_parse().

   299                  break;
   300          case PHY_INTERFACE_MODE_SGMII:
   301                  val |= NSS_COMMON_CLK_SRC_CTRL_SGMII(gmac->id) <<
   302                          NSS_COMMON_CLK_SRC_CTRL_OFFSET(gmac->id);
   303                  break;
   304          default:
   305                  dev_err(&pdev->dev, "Unsupported PHY mode: \"%s\"\n",
   306                          phy_modes(gmac->phy_mode));
   307                  return NULL;
   308          }
   309          regmap_write(gmac->nss_common, NSS_COMMON_CLK_SRC_CTRL, val);



regards,
dan carpenter
