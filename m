From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 May 2015 10:17:13 +0000
Subject: re: bna: Brocade 10Gb Ethernet device driver
Message-Id: <20150507101713.GA19357@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Rasesh Mody,

The patch 8b230ed8ec96: "bna: Brocade 10Gb Ethernet device driver"
from Aug 23, 2010, leads to the following Smatch static checker warning:

	drivers/net/ethernet/brocade/bna/bnad.c:1550 bnad_tx_msix_register()
	error: format string overflow. buf_size: 16 length: 31

	drivers/net/ethernet/brocade/bna/bnad.c:1601 bnad_rx_msix_register()
	error: format string overflow. buf_size: 16 length: 30

drivers/net/ethernet/brocade/bna/bnad.c
  1540  static int
  1541  bnad_tx_msix_register(struct bnad *bnad, struct bnad_tx_info *tx_info,
  1542                          u32 tx_id, int num_txqs)
  1543  {
  1544          int i;
  1545          int err;
  1546          int vector_num;
  1547  
  1548          for (i = 0; i < num_txqs; i++) {
  1549                  vector_num = tx_info->tcb[i]->intr_vector;
  1550                  sprintf(tx_info->tcb[i]->name, "%s TXQ %d", bnad->netdev->name,
                                                        ^^^^^^^^^

Smatch thinks this can theoretically go up to 31 chars, but definitely
bnad->netdev->name is 16 chars so it can overflow and corrupt memory.

  1551                                  tx_id + tx_info->tcb[i]->id);
  1552                  err = request_irq(bnad->msix_table[vector_num].vector,
  1553                                    (irq_handler_t)bnad_msix_tx, 0,
  1554                                    tx_info->tcb[i]->name,
  1555                                    tx_info->tcb[i]);
  1556                  if (err)
  1557                          goto err_return;
  1558          }
  1559  
  1560          return 0;
  1561  
  1562  err_return:
  1563          if (i > 0)
  1564                  bnad_tx_msix_unregister(bnad, tx_info, (i - 1));
  1565          return -1;
  1566  }


  1591  static int
  1592  bnad_rx_msix_register(struct bnad *bnad, struct bnad_rx_info *rx_info,
  1593                          u32 rx_id, int num_rxps)
  1594  {
  1595          int i;
  1596          int err;
  1597          int vector_num;
  1598  
  1599          for (i = 0; i < num_rxps; i++) {
  1600                  vector_num = rx_info->rx_ctrl[i].ccb->intr_vector;
  1601                  sprintf(rx_info->rx_ctrl[i].ccb->name, "%s CQ %d",
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Same issue.

  1602                          bnad->netdev->name,
  1603                          rx_id + rx_info->rx_ctrl[i].ccb->id);
  1604                  err = request_irq(bnad->msix_table[vector_num].vector,
  1605                                    (irq_handler_t)bnad_msix_rx, 0,
  1606                                    rx_info->rx_ctrl[i].ccb->name,
  1607                                    rx_info->rx_ctrl[i].ccb);
  1608                  if (err)
  1609                          goto err_return;
  1610          }
  1611  
  1612          return 0;
  1613  
  1614  err_return:

Other warnings:
drivers/net/ethernet/brocade/bna/bnad.c:936 bnad_cb_ethport_link_status() warn: comparison is always 'false'

regards,
dan carpenter
