From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Aug 2014 15:59:05 +0000
Subject: re: net: stmmac: Support devicetree configs for mcast and ucast filter entries
Message-Id: <20140801155905.GA31489@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Vince Bridgers,

The patch 3b57de958e2a: "net: stmmac: Support devicetree configs for
mcast and ucast filter entries" from Jul 31, 2014, leads to the
following static checker warning:

	drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:123 dwmac1000_set_mchash()
	error: buffer overflow 'mcfilterbits' 2 <= 7

drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
   100  static void dwmac1000_set_mchash(void __iomem *ioaddr, u32 *mcfilterbits,
   101                                   int mcbitslog2)
   102  {
   103          int numhashregs, regs;
   104  
   105          switch (mcbitslog2) {
   106          case 6:
   107                  writel(mcfilterbits[0], ioaddr + GMAC_HASH_LOW);
   108                  writel(mcfilterbits[1], ioaddr + GMAC_HASH_HIGH);
   109                  return;
   110                  break;

These days checkpatch complains about extra unreachable break
statements.

   111          case 7:
   112                  numhashregs = 4;
   113                  break;
   114          case 8:
   115                  numhashregs = 8;
   116                  break;
   117          default:
   118                  pr_debug("STMMAC: err in setting mulitcast filter\n");
   119                  return;
   120                  break;
   121          }
   122          for (regs = 0; regs < numhashregs; regs++)
   123                  writel(mcfilterbits[regs],

There is only one caller for this function and mcfilterbits[] only has
2 elements.  So neither 4 nor 8 is correct.  I don't understand.

   124                         ioaddr + GMAC_EXTHASH_BASE + regs * 4);
   125  }

regards,
dan carpenter
