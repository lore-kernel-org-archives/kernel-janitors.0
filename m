From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Dec 2019 10:48:16 +0000
Subject: [bug report] net: emac: emac gigabit ethernet controller driver
Message-Id: <20191203104816.qdozqfywtvtmr4ie@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Timur Tabi,

The patch b9b17debc69d: "net: emac: emac gigabit ethernet controller
driver" from Aug 31, 2016, leads to the following static checker
warning:

	drivers/net/ethernet/qualcomm/emac/emac-mac.c:1463 emac_mac_tx_buf_send()
	error: dereferencing freed memory 'skb'

drivers/net/ethernet/qualcomm/emac/emac-mac.c
  1412           * so it will be freed after unmap
  1413           */
  1414          tpbuf->skb = skb;
  1415  
  1416          return;
  1417  
  1418  error:
  1419          /* One of the memory mappings failed, so undo everything */
  1420          tx_q->tpd.produce_idx = first;
  1421  
  1422          while (count--) {
  1423                  tpbuf = GET_TPD_BUFFER(tx_q, first);
  1424                  dma_unmap_page(adpt->netdev->dev.parent, tpbuf->dma_addr,
  1425                                 tpbuf->length, DMA_TO_DEVICE);
  1426                  tpbuf->dma_addr = 0;
  1427                  tpbuf->length = 0;
  1428  
  1429                  if (++first = tx_q->tpd.count)
  1430                          first = 0;
  1431          }
  1432  
  1433          dev_kfree_skb(skb);
                              ^^^
The caller has no way to know if skb is freed or not.

  1434  }

regards,
dan carpenter
