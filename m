From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jul 2015 19:12:55 +0000
Subject: re: stmmac: add ipq806x glue layer
Message-Id: <20150730191219.GA13023@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Mathieu Olivari,

The patch b1c17215d718: "stmmac: add ipq806x glue layer" from May 27,
2015, leads to the following static checker warning:

	drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c:314 ipq806x_gmac_probe()
	warn: double left shift '1 << (1 << gmac->id)'

drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
   312          switch (gmac->phy_mode) {
   313          case PHY_INTERFACE_MODE_RGMII:
   314                  val |= NSS_COMMON_CLK_SRC_CTRL_RGMII(gmac->id) <<
   315                          NSS_COMMON_CLK_SRC_CTRL_OFFSET(gmac->id);

It's very strange to shift to do this.  My guess is we should delete the
NSS_COMMON_CLK_SRC_CTRL_RGMII macro and just use:

			val |= NSS_COMMON_CLK_SRC_CTRL_OFFSET(gmac->id);

   316                  break;
   317          case PHY_INTERFACE_MODE_SGMII:
   318                  val |= NSS_COMMON_CLK_SRC_CTRL_SGMII(gmac->id) <<
   319                          NSS_COMMON_CLK_SRC_CTRL_OFFSET(gmac->id);


Same here.


   320                  break;
   321          default:
   322                  dev_err(&pdev->dev, "Unsupported PHY mode: \"%s\"\n",
   323                          phy_modes(gmac->phy_mode));
   324                  return -EINVAL;
   325          }

regards,
dan carpenter
