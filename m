From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 May 2016 14:36:58 +0000
Subject: re: tg3: Add SGMII phy support for 5719/5718 serdes
Message-Id: <20160503143658.GA18927@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Michael Chan,

The patch 85730a631f0c: "tg3: Add SGMII phy support for 5719/5718
serdes" from Apr 9, 2013, leads to the following static checker
warning:

	drivers/net/ethernet/broadcom/tg3.c:5979 tg3_setup_fiber_mii_phy()
	error: uninitialized symbol 'local_adv'.

drivers/net/ethernet/broadcom/tg3.c
  5805  static int tg3_setup_fiber_mii_phy(struct tg3 *tp, bool force_reset)
  5806  {
  5807          int err = 0;
  5808          u32 bmsr, bmcr;
  5809          u16 current_speed = SPEED_UNKNOWN;
  5810          u8 current_duplex = DUPLEX_UNKNOWN;
  5811          bool current_link_up = false;
  5812          u32 local_adv, remote_adv, sgsr;
                    ^^^^^^^^^
Not initialized.

  5813  
  5814          if ((tg3_asic_rev(tp) = ASIC_REV_5719 ||
  5815               tg3_asic_rev(tp) = ASIC_REV_5720) &&
  5816               !tg3_readphy(tp, SERDES_TG3_1000X_STATUS, &sgsr) &&
  5817               (sgsr & SERDES_TG3_SGMII_MODE)) {
  5818  
  5819                  if (force_reset)
  5820                          tg3_phy_reset(tp);
  5821  
  5822                  tp->mac_mode &= ~MAC_MODE_PORT_MODE_MASK;
  5823  
  5824                  if (!(sgsr & SERDES_TG3_LINK_UP)) {
  5825                          tp->mac_mode |= MAC_MODE_PORT_MODE_GMII;
  5826                  } else {
  5827                          current_link_up = true;
                                ^^^^^^^^^^^^^^^^^^^^^^^
current_link_up is true.

  5828                          if (sgsr & SERDES_TG3_SPEED_1000) {
  5829                                  current_speed = SPEED_1000;
  5830                                  tp->mac_mode |= MAC_MODE_PORT_MODE_GMII;
  5831                          } else if (sgsr & SERDES_TG3_SPEED_100) {
  5832                                  current_speed = SPEED_100;
  5833                                  tp->mac_mode |= MAC_MODE_PORT_MODE_MII;
  5834                          } else {
  5835                                  current_speed = SPEED_10;
  5836                                  tp->mac_mode |= MAC_MODE_PORT_MODE_MII;
  5837                          }
  5838  
  5839                          if (sgsr & SERDES_TG3_FULL_DUPLEX)
  5840                                  current_duplex = DUPLEX_FULL;
                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
It's full duplex.

  5841                          else
  5842                                  current_duplex = DUPLEX_HALF;
  5843                  }
  5844  
  5845                  tw32_f(MAC_MODE, tp->mac_mode);
  5846                  udelay(40);
  5847  
  5848                  tg3_clear_mac_status(tp);
  5849  
  5850                  goto fiber_setup_done;
  5851          }

  5979  fiber_setup_done:
  5980          if (current_link_up && current_duplex = DUPLEX_FULL)
  5981                  tg3_setup_flow_control(tp, local_adv, remote_adv);
                                                   ^^^^^^^^^
Uninitialized.

  5982  

regards,
dan carpenter
