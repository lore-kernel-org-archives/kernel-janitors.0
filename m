From: "Gole, Anant" <anantgole@ti.com>
Date: Wed, 21 Aug 2013 08:44:16 +0000
Subject: RE: net: Add TI DaVinci EMAC driver
Message-Id: <3F602CD5BF1C69469B2F060E908506427DCEE0CE@DQHE05.ent.ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130821084024.GK5240@elgon.mountain>
In-Reply-To: <20130821084024.GK5240@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan,
Sorry for top posting. I am looping in Mugunthan who is currently looking into this driver.

Mugunthan,
Can you look at the issue pointed out by Dan and submit a patch if this is a bug and clean up if needed?


Regards,
Anant

-----Original Message-----
From: Dan Carpenter [mailto:dan.carpenter@oracle.com] 
Sent: Wednesday, August 21, 2013 2:10 PM
To: Gole, Anant
Cc: kernel-janitors@vger.kernel.org
Subject: re: net: Add TI DaVinci EMAC driver

Hello Anant Gole,

The patch a6286ee630f6: "net: Add TI DaVinci EMAC driver" from May 18, 2009, has the following potentially buggy code:

drivers/net/ethernet/ti/davinci_emac.c
  1316                   ((EMAC_DEF_ERROR_FRAME_EN) ? (EMAC_RXMBP_CEFEN_MASK) : 0x0) |
  1317                   ((EMAC_DEF_PROM_EN) ? (EMAC_RXMBP_CAFEN_MASK) : 0x0) |
  1318                   ((EMAC_DEF_PROM_CH & EMAC_RXMBP_CHMASK) << \
                           ^^^^^^^^^^^^^^^^ This is bit 0 but it's used as a mask.  It should maybe be:

				EMAC_MBP_PROMISCCH(EMAC_DEF_PROM_CH) & EMAC_RXMBP_CHMASK

  1319                          EMAC_RXMBP_PROMCH_SHIFT) |
  1320                   ((EMAC_DEF_BCAST_EN) ? (EMAC_RXMBP_BROADEN_MASK) : 0x0) |
  1321                   ((EMAC_DEF_BCAST_CH & EMAC_RXMBP_CHMASK) << \
                           ^^^^^^^^^^^^^^^^^ Same thing here.

  1322                          EMAC_RXMBP_BROADCH_SHIFT) |
  1323                   ((EMAC_DEF_MCAST_EN) ? (EMAC_RXMBP_MULTIEN_MASK) : 0x0) |
  1324                   ((EMAC_DEF_MCAST_CH & EMAC_RXMBP_CHMASK) << \
                           ^^^^^^^^^^^^^^^^^
  1325                          EMAC_RXMBP_MULTICH_SHIFT));

Really, this whole section of bit masks is very hard to look at or review.

regards,
dan carpenter

