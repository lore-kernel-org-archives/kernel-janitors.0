From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 13:10:11 +0000
Subject: [bug report] phy: renesas: phy-rcar-gen2: Add support for r8a77470
Message-Id: <20190503131010.GJ29695@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Biju Das,

The patch b7187e001a10: "phy: renesas: phy-rcar-gen2: Add support for
r8a77470" from Apr 10, 2019, leads to the following static checker
warning:

	drivers/phy/renesas/phy-rcar-gen2.c:403 rcar_gen2_phy_probe()
	warn: array off by one? 'data->select_value[channel_num]'

drivers/phy/renesas/phy-rcar-gen2.c
   262  static const u32 pci_select_value[][PHYS_PER_CHANNEL] = {
   263          [0]     = { USBHS_UGCTRL2_USB0SEL_PCI, USBHS_UGCTRL2_USB0SEL_HS_USB },
   264          [2]     = { USBHS_UGCTRL2_USB2SEL_PCI, USBHS_UGCTRL2_USB2SEL_USB30 },

This select array has three elements.

   265  };
   266  
   267  static const u32 usb20_select_value[][PHYS_PER_CHANNEL] = {
   268          { USBHS_UGCTRL2_USB0SEL_USB20, USBHS_UGCTRL2_USB0SEL_HS_USB20 },

But this one only has two.

   269  };
   270  
   271  static const struct rcar_gen2_phy_data rcar_gen2_usb_phy_data = {
   272          .gen2_phy_ops = &rcar_gen2_phy_ops,
   273          .select_value = pci_select_value,
   274  };
   275  
   276  static const struct rcar_gen2_phy_data rz_g1c_usb_phy_data = {
   277          .gen2_phy_ops = &rz_g1c_phy_ops,
   278          .select_value = usb20_select_value,
   279  };

[ snip ]

   382          for_each_child_of_node(dev->of_node, np) {
   383                  struct rcar_gen2_channel *channel = drv->channels + i;
   384                  u32 channel_num;
   385                  int error, n;
   386  
   387                  channel->of_node = np;
   388                  channel->drv = drv;
   389                  channel->selected_phy = -1;
   390  
   391                  error = of_property_read_u32(np, "reg", &channel_num);
   392                  if (error || channel_num > 2) {
                                     ^^^^^^^^^^^^^^^
The code seems to assume they all have 3 elements

   393                          dev_err(dev, "Invalid \"reg\" property\n");
   394                          return error;
   395                  }
   396                  channel->select_mask = select_mask[channel_num];
   397  
   398                  for (n = 0; n < PHYS_PER_CHANNEL; n++) {
   399                          struct rcar_gen2_phy *phy = &channel->phys[n];
   400  
   401                          phy->channel = channel;
   402                          phy->number = n;
   403                          phy->select_value = data->select_value[channel_num][n];
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Smatch warning.

   404  
   405                          phy->phy = devm_phy_create(dev, NULL,
   406                                                     data->gen2_phy_ops);
   407                          if (IS_ERR(phy->phy)) {
   408                                  dev_err(dev, "Failed to create PHY\n");
   409                                  return PTR_ERR(phy->phy);
   410                          }
   411                          phy_set_drvdata(phy->phy, phy);
   412                  }
   413  
   414                  i++;
   415          }

regards,
dan carpenter
