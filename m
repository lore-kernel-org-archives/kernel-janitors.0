From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Apr 2016 09:51:18 +0000
Subject: re: fjes: Introduce spinlock for rx_status
Message-Id: <20160419095118.GA1977@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Taku Izumi,

The patch bd5a256991f9: "fjes: Introduce spinlock for rx_status" from
Apr 15, 2016, leads to the following static checker warning:

	drivers/net/fjes/fjes_main.c:827 fjes_change_mtu()
	error: double lock 'spin_lock:&hw->rx_status_lock'

drivers/net/fjes/fjes_main.c

   822                  spin_lock_irqsave(&hw->rx_status_lock, flags);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Locked.

   823                  for (epidx = 0; epidx < hw->max_epid; epidx++) {
   824                          if (epidx = hw->my_epid)
   825                                  continue;
   826  
   827                          spin_lock_irqsave(&hw->rx_status_lock, flags);
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Deadlocked.

   828                          fjes_hw_setup_epbuf(&hw->ep_shm_info[epidx].tx,
   829                                              netdev->dev_addr,
   830                                              netdev->mtu);
   831  
   832                          hw->ep_shm_info[epidx].tx.info->v1i.rx_status |   833                                  FJES_RX_MTU_CHANGING_DONE;
   834                          spin_unlock_irqrestore(&hw->rx_status_lock, flags);
   835                  }
   836  
   837                  netif_tx_wake_all_queues(netdev);
   838                  netif_carrier_on(netdev);
   839                  napi_enable(&adapter->napi);
   840                  napi_schedule(&adapter->napi);
   841          }

regards,
dan carpenter
