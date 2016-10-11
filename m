From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Oct 2016 08:34:20 +0000
Subject: [bug report] qed: Add Light L2 support
Message-Id: <20161011083420.GA18141@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Yuval Mintz,

The patch 0a7fb11c23c0: "qed: Add Light L2 support" from Oct 1, 2016,
leads to the following Smatch warning:

	drivers/net/ethernet/qlogic/qed/qed_ll2.c:1590 qed_ll2_start()
	error: dereferencing freed memory 'buffer'

drivers/net/ethernet/qlogic/qed/qed_ll2.c
  1587  
  1588          /* Post all Rx buffers to FW */
  1589          spin_lock_bh(&cdev->ll2->lock);
  1590          list_for_each_entry(buffer, &cdev->ll2->list, list) {
                                    ^^^^^^
Note.

  1591                  rc = qed_ll2_post_rx_buffer(QED_LEADING_HWFN(cdev),
  1592                                              cdev->ll2->handle,
  1593                                              buffer->phys_addr, 0, buffer, 1);
  1594                  if (rc) {
  1595                          DP_INFO(cdev,
  1596                                  "Failed to post an Rx buffer; Deleting it\n");
  1597                          dma_unmap_single(&cdev->pdev->dev, buffer->phys_addr,
  1598                                           cdev->ll2->rx_size, DMA_FROM_DEVICE);
  1599                          kfree(buffer->data);
  1600                          list_del(&buffer->list);
  1601                          kfree(buffer);
                                      ^^^^^^

There was probably supposed to be a break statement after this kfree().
Otherwise use list_for_each_entry_safe().

  1602                  } else {
  1603                          cdev->ll2->rx_cnt++;
  1604                  }
  1605          }
  1606          spin_unlock_bh(&cdev->ll2->lock);
  1607  

regards,
dan carpenter
