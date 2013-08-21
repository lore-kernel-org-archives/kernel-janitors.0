From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2013 08:40:24 +0000
Subject: re: net: Add TI DaVinci EMAC driver
Message-Id: <20130821084024.GK5240@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Anant Gole,

The patch a6286ee630f6: "net: Add TI DaVinci EMAC driver" from May 
18, 2009, has the following potentially buggy code:

drivers/net/ethernet/ti/davinci_emac.c
  1316                   ((EMAC_DEF_ERROR_FRAME_EN) ? (EMAC_RXMBP_CEFEN_MASK) : 0x0) |
  1317                   ((EMAC_DEF_PROM_EN) ? (EMAC_RXMBP_CAFEN_MASK) : 0x0) |
  1318                   ((EMAC_DEF_PROM_CH & EMAC_RXMBP_CHMASK) << \
                           ^^^^^^^^^^^^^^^^
This is bit 0 but it's used as a mask.  It should maybe be:

				EMAC_MBP_PROMISCCH(EMAC_DEF_PROM_CH) & EMAC_RXMBP_CHMASK

  1319                          EMAC_RXMBP_PROMCH_SHIFT) |
  1320                   ((EMAC_DEF_BCAST_EN) ? (EMAC_RXMBP_BROADEN_MASK) : 0x0) |
  1321                   ((EMAC_DEF_BCAST_CH & EMAC_RXMBP_CHMASK) << \
                           ^^^^^^^^^^^^^^^^^
Same thing here.

  1322                          EMAC_RXMBP_BROADCH_SHIFT) |
  1323                   ((EMAC_DEF_MCAST_EN) ? (EMAC_RXMBP_MULTIEN_MASK) : 0x0) |
  1324                   ((EMAC_DEF_MCAST_CH & EMAC_RXMBP_CHMASK) << \
                           ^^^^^^^^^^^^^^^^^
  1325                          EMAC_RXMBP_MULTICH_SHIFT));

Really, this whole section of bit masks is very hard to look at or
review.

regards,
dan carpenter

