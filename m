From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 May 2019 10:05:39 +0000
Subject: [bug report] net: ll_temac: Cleanup multicast filter on change
Message-Id: <20190527100539.GA31007@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Esben Haabendal,

The patch 1b3fa5cf859b: "net: ll_temac: Cleanup multicast filter on
change" from May 23, 2019, leads to the following static checker
warning:

	drivers/net/ethernet/xilinx/ll_temac_main.c:490 temac_set_multicast_list()
	error: uninitialized symbol 'i'.

drivers/net/ethernet/xilinx/ll_temac_main.c
   451  static void temac_set_multicast_list(struct net_device *ndev)
   452  {
   453          struct temac_local *lp = netdev_priv(ndev);
   454          u32 multi_addr_msw, multi_addr_lsw;
   455          int i;
                ^^^^^

   456          unsigned long flags;
   457          bool promisc_mode_disabled = false;
   458  
   459          if (ndev->flags & (IFF_PROMISC | IFF_ALLMULTI) ||
   460              (netdev_mc_count(ndev) > MULTICAST_CAM_TABLE_NUM)) {
   461                  temac_indirect_out32(lp, XTE_AFM_OFFSET, XTE_AFM_EPPRM_MASK);
   462                  dev_info(&ndev->dev, "Promiscuous mode enabled.\n");
   463                  return;
   464          }
   465  
   466          spin_lock_irqsave(lp->indirect_lock, flags);
   467  
   468          if (!netdev_mc_empty(ndev)) {
   469                  struct netdev_hw_addr *ha;
   470  
   471                  i = 0;
                        ^^^^^
This is not initialized on the false path.

   472                  netdev_for_each_mc_addr(ha, ndev) {
   473                          if (WARN_ON(i >= MULTICAST_CAM_TABLE_NUM))
   474                                  break;
   475                          multi_addr_msw = ((ha->addr[3] << 24) |
   476                                            (ha->addr[2] << 16) |
   477                                            (ha->addr[1] << 8) |
   478                                            (ha->addr[0]));
   479                          temac_indirect_out32_locked(lp, XTE_MAW0_OFFSET,
   480                                                      multi_addr_msw);
   481                          multi_addr_lsw = ((ha->addr[5] << 8) |
   482                                            (ha->addr[4]) | (i << 16));
   483                          temac_indirect_out32_locked(lp, XTE_MAW1_OFFSET,
   484                                                      multi_addr_lsw);
   485                          i++;
   486                  }
   487          }
   488  
   489          /* Clear all or remaining/unused address table entries */
   490          while (i < MULTICAST_CAM_TABLE_NUM) {
                       ^
Uninitialized.

   491                  temac_indirect_out32_locked(lp, XTE_MAW0_OFFSET, 0);
   492                  temac_indirect_out32_locked(lp, XTE_MAW1_OFFSET, i << 16);
   493                  i++;
   494          }

regards,
dan carpenter
