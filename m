From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Oct 2018 10:48:23 +0000
Subject: [bug report] phy: add driver for Microsemi Ocelot SerDes muxing
Message-Id: <20181010104823.GA15888@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Quentin Schulz,

The patch 51f6b410fc22: "phy: add driver for Microsemi Ocelot SerDes
muxing" from Oct 4, 2018, leads to the following static checker
warning:

	drivers/phy/mscc/phy-ocelot-serdes.c:210 serdes_simple_xlate()
	error: buffer overflow 'ctrl->phys' 8 <= 8

drivers/phy/mscc/phy-ocelot-serdes.c
   197  static struct phy *serdes_simple_xlate(struct device *dev,
   198                                         struct of_phandle_args *args)
   199  {
   200          struct serdes_ctrl *ctrl = dev_get_drvdata(dev);
   201          unsigned int port, idx, i;
   202  
   203          if (args->args_count != 2)
   204                  return ERR_PTR(-EINVAL);
   205  
   206          port = args->args[0];
   207          idx = args->args[1];
   208  
   209          for (i = 0; i <= SERDES_MAX; i++) {
                              ^^
Should this be < ?

   210                  struct serdes_macro *macro = phy_get_drvdata(ctrl->phys[i]);
                                                                     ^^^^^^^^^^^^^
Or is this array too small?

   211  
   212                  if (idx != macro->idx)
   213                          continue;
   214  
   215                  /* SERDES6G(0) is the only SerDes capable of QSGMII */
   216                  if (idx != SERDES6G(0) && macro->port >= 0)
   217                          return ERR_PTR(-EBUSY);
   218  
   219                  macro->port = port;
   220                  return ctrl->phys[i];
   221          }
   222  
   223          return ERR_PTR(-ENODEV);
   224  }

regards,
dan carpenter
