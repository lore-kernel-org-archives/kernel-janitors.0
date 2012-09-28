From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 13:06:08 +0000
Subject: drivers/net/cris/eth_v10.c:1715:2: error: too many arguments to function 'e100rxtx_interrupt'
Message-Id: <20120928130608.GA5158@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

Hi Jesper,

FYI, a rather old build bug that's introduced by

bafef0a cris build fixes: update eth_v10.c ethernet driver

All error/warnings:

drivers/net/cris/eth_v10.c: In function 'e100_netpoll':
drivers/net/cris/eth_v10.c:1715:2: error: too many arguments to function 'e100rxtx_interrupt'
drivers/net/cris/eth_v10.c:1131:1: note: declared here

vim +1715 drivers/net/cris/eth_v10.c

^1da177e (Linus Torvalds 2005-04-16  1710) 
bafef0ae (Jesper Nilsson 2007-11-14  1711) #ifdef CONFIG_NET_POLL_CONTROLLER
bafef0ae (Jesper Nilsson 2007-11-14  1712) static void
bafef0ae (Jesper Nilsson 2007-11-14  1713) e100_netpoll(struct net_device* netdev)
bafef0ae (Jesper Nilsson 2007-11-14  1714) {
bafef0ae (Jesper Nilsson 2007-11-14 @1715) 	e100rxtx_interrupt(NETWORK_DMA_TX_IRQ_NBR, netdev, NULL);
bafef0ae (Jesper Nilsson 2007-11-14  1716) }
bafef0ae (Jesper Nilsson 2007-11-14  1717) #endif
bafef0ae (Jesper Nilsson 2007-11-14  1718) 
^1da177e (Linus Torvalds 2005-04-16  1719) static int
^1da177e (Linus Torvalds 2005-04-16  1720) etrax_init_module(void)
^1da177e (Linus Torvalds 2005-04-16  1721) {
^1da177e (Linus Torvalds 2005-04-16  1722) 	return etrax_ethernet_init();
^1da177e (Linus Torvalds 2005-04-16  1723) }

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
