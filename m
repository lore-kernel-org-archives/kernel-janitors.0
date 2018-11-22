From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Nov 2018 16:47:37 +0000
Subject: [bug report] net: systemport: Restore Broadcom tag match filters upon resume
Message-Id: <20181122164736.ech7lz2gknoaqqrr@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Florian Fainelli,

The patch 80f8dea8767e: "net: systemport: Restore Broadcom tag match
filters upon resume" from Nov 6, 2018, leads to the following static
checker warning:

	drivers/net/ethernet/broadcom/bcmsysport.c:2202 bcm_sysport_rule_set()
	warn: array off by one? 'priv->filters_loc[index]'

drivers/net/ethernet/broadcom/bcmsysport.c
  2168  static int bcm_sysport_rule_set(struct bcm_sysport_priv *priv,
  2169                                  struct ethtool_rxnfc *nfc)
  2170  {
  2171          unsigned int index;
  2172          u32 reg;
  2173  
  2174          /* We cannot match locations greater than what the classification ID
  2175           * permits (256 entries)
  2176           */
  2177          if (nfc->fs.location > RXCHK_BRCM_TAG_CID_MASK)
  2178                  return -E2BIG;
  2179  
  2180          /* We cannot support flows that are not destined for a wake-up */
  2181          if (nfc->fs.ring_cookie != RX_CLS_FLOW_WAKE)
  2182                  return -EOPNOTSUPP;
  2183  
  2184          /* All filters are already in use, we cannot match more rules */
  2185          if (bitmap_weight(priv->filters, RXCHK_BRCM_TAG_MAX) =
  2186              RXCHK_BRCM_TAG_MAX)
  2187                  return -ENOSPC;
                        ^^^^^^^^^^^^^^
This check means we have space.

  2188  
  2189          index = find_first_zero_bit(priv->filters, RXCHK_BRCM_TAG_MAX);
  2190          if (index > RXCHK_BRCM_TAG_MAX)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
This check is off by one, but it's not required.  You could fix it or
delete it?

  2191                  return -ENOSPC;
  2192  
  2193          /* Location is the classification ID, and index is the position
  2194           * within one of our 8 possible filters to be programmed
  2195           */
  2196          reg = rxchk_readl(priv, RXCHK_BRCM_TAG(index));
  2197          reg &= ~(RXCHK_BRCM_TAG_CID_MASK << RXCHK_BRCM_TAG_CID_SHIFT);
  2198          reg |= nfc->fs.location << RXCHK_BRCM_TAG_CID_SHIFT;
  2199          rxchk_writel(priv, reg, RXCHK_BRCM_TAG(index));
  2200          rxchk_writel(priv, 0xff00ffff, RXCHK_BRCM_TAG_MASK(index));
  2201  
  2202          priv->filters_loc[index] = nfc->fs.location;
                                  ^^^^^
  2203          set_bit(index, priv->filters);
                        ^^^^^
Off by one.

  2204  
  2205          return 0;
  2206  }

regards,
dan carpenter
