From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Aug 2017 11:34:22 +0000
Subject: [bug report] net: mvpp2: set maximum packet size for 10G ports
Message-Id: <20170824113422.fm6schupqmb6limc@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Stefan Chulski,

The patch 76eb1b1de5b6: "net: mvpp2: set maximum packet size for 10G
ports" from Aug 22, 2017, leads to the following static checker
warning:

	drivers/net/ethernet/marvell/mvpp2.c:4666 mvpp2_xlg_max_rx_size_set()
	warn: double left shift '((port->pkt_size - 2) / 2) << (1 << (0))'

drivers/net/ethernet/marvell/mvpp2.c
  4659  /* Change maximum receive size of the port */
  4660  static inline void mvpp2_xlg_max_rx_size_set(struct mvpp2_port *port)
  4661  {
  4662          u32 val;
  4663  
  4664          val =  readl(port->base + MVPP22_XLG_CTRL1_REG);
  4665          val &= ~MVPP22_XLG_CTRL1_FRAMESIZELIMIT_MASK;
  4666          val |= ((port->pkt_size - MVPP2_MH_SIZE) / 2) <<
  4667                 MVPP22_XLG_CTRL1_FRAMESIZELIMIT;

MVPP22_XLG_CTRL1_FRAMESIZELIMIT is BIT(0).  It doesn't make sense that
the max size is BIT(0) and it doesn't make sense to shift by the max
size.  I'm not sure what was intended.

  4668          writel(val, port->base + MVPP22_XLG_CTRL1_REG);
  4669  }

regards,
dan carpenter
