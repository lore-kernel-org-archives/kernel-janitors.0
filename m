From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Feb 2020 11:27:09 +0000
Subject: [bug report] bnx2x: Add Warpcore support for 578xx
Message-Id: <20200228112709.6ailvgxaq7nymz4m@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Yaniv Rosner,

The patch 3c9ada227c56: "bnx2x: Add Warpcore support for 578xx" from
Jun 14, 2011, leads to the following static checker warning:

	drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c:5638 bnx2x_link_settings_status()
	warn: assigning (-22) to unsigned variable

drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
  5614  static u8 bnx2x_link_settings_status(struct bnx2x_phy *phy,
               ^^
This is a u8.  My understanding is that the function returns 1 on
success and 0 on failure?

  5615                                       struct link_params *params,
  5616                                       struct link_vars *vars)
  5617  {
  5618          struct bnx2x *bp = params->bp;
  5619  
  5620          u16 gp_status, duplex = DUPLEX_HALF, link_up = 0, speed_mask;
  5621          int rc = 0;
  5622  
  5623          /* Read gp_status */
  5624          CL22_RD_OVER_CL45(bp, phy,
  5625                            MDIO_REG_BANK_GP_STATUS,
  5626                            MDIO_GP_STATUS_TOP_AN_STATUS1,
  5627                            &gp_status);
  5628          if (gp_status & MDIO_GP_STATUS_TOP_AN_STATUS1_DUPLEX_STATUS)
  5629                  duplex = DUPLEX_FULL;
  5630          if (gp_status & MDIO_GP_STATUS_TOP_AN_STATUS1_LINK_STATUS)
  5631                  link_up = 1;
  5632          speed_mask = gp_status & GP_STATUS_SPEED_MASK;
  5633          DP(NETIF_MSG_LINK, "gp_status 0x%x, is_link_up %d, speed_mask 0x%x\n",
  5634                         gp_status, link_up, speed_mask);
  5635          rc = bnx2x_get_link_speed_duplex(phy, params, vars, link_up, speed_mask,
  5636                                           duplex);
  5637          if (rc = -EINVAL)
  5638                  return rc;
                        ^^^^^^^^^
This is -22 cast to u8 (success?).  The problem is that the
bnx2x_get_link_speed_duplex() function only return -EINVAL and zero.

  5639  
  5640          if (gp_status & MDIO_GP_STATUS_TOP_AN_STATUS1_LINK_STATUS) {
  5641                  if (SINGLE_MEDIA_DIRECT(params)) {
  5642                          vars->duplex = duplex;
  5643                          bnx2x_flow_ctrl_resolve(phy, params, vars, gp_status);
  5644                          if (phy->req_line_speed = SPEED_AUTO_NEG)
  5645                                  bnx2x_xgxs_an_resolve(phy, params, vars,
  5646                                                        gp_status);
  5647                  }
  5648          } else { /* Link_down */
  5649                  if ((phy->req_line_speed = SPEED_AUTO_NEG) &&
  5650                      SINGLE_MEDIA_DIRECT(params)) {
  5651                          /* Check signal is detected */
  5652                          bnx2x_check_fallback_to_cl37(phy, params);
  5653                  }
  5654          }
  5655  
  5656          /* Read LP advertised speeds*/
  5657          if (SINGLE_MEDIA_DIRECT(params) &&
  5658              (vars->link_status & LINK_STATUS_AUTO_NEGOTIATE_COMPLETE)) {
  5659                  u16 val;
  5660  
  5661                  CL22_RD_OVER_CL45(bp, phy, MDIO_REG_BANK_CL73_IEEEB1,
  5662                                    MDIO_CL73_IEEEB1_AN_LP_ADV2, &val);
  5663  
  5664                  if (val & MDIO_CL73_IEEEB1_AN_ADV2_ADVR_1000M_KX)
  5665                          vars->link_status |  5666                                  LINK_STATUS_LINK_PARTNER_1000TFD_CAPABLE;
  5667                  if (val & (MDIO_CL73_IEEEB1_AN_ADV2_ADVR_10G_KX4 |
  5668                             MDIO_CL73_IEEEB1_AN_ADV2_ADVR_10G_KR))
  5669                          vars->link_status |  5670                                  LINK_STATUS_LINK_PARTNER_10GXFD_CAPABLE;
  5671  
  5672                  CL22_RD_OVER_CL45(bp, phy, MDIO_REG_BANK_OVER_1G,
  5673                                    MDIO_OVER_1G_LP_UP1, &val);
  5674  
  5675                  if (val & MDIO_OVER_1G_UP1_2_5G)
  5676                          vars->link_status |  5677                                  LINK_STATUS_LINK_PARTNER_2500XFD_CAPABLE;
  5678                  if (val & (MDIO_OVER_1G_UP1_10G | MDIO_OVER_1G_UP1_10GH))
  5679                          vars->link_status |  5680                                  LINK_STATUS_LINK_PARTNER_10GXFD_CAPABLE;
  5681          }
  5682  
  5683          DP(NETIF_MSG_LINK, "duplex %x  flow_ctrl 0x%x link_status 0x%x\n",
  5684                     vars->duplex, vars->flow_ctrl, vars->link_status);
  5685          return rc;
                       ^^
This rc is always zero (failure/link down?).

  5686  }

regards,
dan carpenter
