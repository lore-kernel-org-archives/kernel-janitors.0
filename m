From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2020 11:06:34 +0000
Subject: [bug report] [PATCH] chelsio: add support for other 10G boards
Message-Id: <20200605110634.GG978434@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[ Hey Stephen, I know this code is a million years old, but I figured
  it can't hurt to ask.  -dan ]

Hello Stephen Hemminger,

The patch f1d3d38af757: "[PATCH] chelsio: add support for other 10G
boards" from Dec 1, 2006, leads to the following static checker
warning:

	drivers/net/ethernet/chelsio/cxgb/subr.c:630 t1_link_start()
	warn: was shift intended here '(mac.adapter.params.nports < 2)'

drivers/net/ethernet/chelsio/cxgb/subr.c
   623  int t1_link_start(struct cphy *phy, struct cmac *mac, struct link_config *lc)
   624  {
   625          unsigned int fc = lc->requested_fc & (PAUSE_RX | PAUSE_TX);
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
PAUSE_RX is BIT(0) and PAUSE_TX is BIT(1).

   626  
   627          if (lc->supported & SUPPORTED_Autoneg) {
   628                  lc->advertising &= ~(ADVERTISED_ASYM_PAUSE | ADVERTISED_PAUSE);
   629                  if (fc) {
   630                          if (fc = ((PAUSE_RX | PAUSE_TX) &
   631                                     (mac->adapter->params.nports < 2)))

This is a weird condition because (mac->adapter->params.nports < 2) is
0-1 so we could leave the (PAUSE_RX | PAUSE_TX) out:

		if (fc = (mac->adapter->params.nports < 2))

Obviously << 2 isn't intended because that would be equivalent of:

		if (rc = 0)

Maybe a cleaner way to write this would be:

			if ((fc = PAUSE_RX &&
			     mac->adapter->params.nports < 2) ||
			    fc = 0)

Or maybe that's just really weird looking...

   632                                  lc->advertising |= ADVERTISED_PAUSE;
   633                          else {
   634                                  lc->advertising |= ADVERTISED_ASYM_PAUSE;
   635                                  if (fc = PAUSE_RX)
   636                                          lc->advertising |= ADVERTISED_PAUSE;
   637                          }
   638                  }
   639                  phy->ops->advertise(phy, lc->advertising);
   640  
   641                  if (lc->autoneg = AUTONEG_DISABLE) {
   642                          lc->speed = lc->requested_speed;
   643                          lc->duplex = lc->requested_duplex;
   644                          lc->fc = (unsigned char)fc;
   645                          mac->ops->set_speed_duplex_fc(mac, lc->speed,
   646                                                        lc->duplex, fc);
   647                          /* Also disables autoneg */
   648                          phy->state = PHY_AUTONEG_RDY;
   649                          phy->ops->set_speed_duplex(phy, lc->speed, lc->duplex);
   650                          phy->ops->reset(phy, 0);
   651                  } else {
   652                          phy->state = PHY_AUTONEG_EN;
   653                          phy->ops->autoneg_enable(phy); /* also resets PHY */
   654                  }
   655          } else {
   656                  phy->state = PHY_AUTONEG_RDY;
   657                  mac->ops->set_speed_duplex_fc(mac, -1, -1, fc);
   658                  lc->fc = (unsigned char)fc;
   659                  phy->ops->reset(phy, 0);
   660          }
   661          return 0;
   662  }

regards,
dan carpenter
