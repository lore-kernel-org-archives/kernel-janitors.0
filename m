From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Dec 2013 20:02:13 +0000
Subject: re: net: vmxnet3 calls skb_set_hash
Message-Id: <20131220200213.GA8911@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Tom Herbert,

The patch 0b6807034791: "net: vmxnet3 calls skb_set_hash" from Dec
17, 2013, leads to the following static checker warning:

	drivers/net/vmxnet3/vmxnet3_drv.c:1238 vmxnet3_rq_rx_complete()
	error: potentially dereferencing uninitialized 'skb'.

drivers/net/vmxnet3/vmxnet3_drv.c
  1233                                           PCI_DMA_FROMDEVICE);
  1234  
  1235  #ifdef VMXNET3_RSS
  1236                          if (rcd->rssType != VMXNET3_RCD_RSS_TYPE_NONE &&
  1237                              (adapter->netdev->features & NETIF_F_RXHASH))
  1238                                  skb_set_hash(skb, le32_to_cpu(rcd->rssHash),
                                                     ^^^
Is it possible to hit this on the first loop iteration before "skb" has
been set?

  1239                                               PKT_HASH_TYPE_L3);
  1240  #endif
  1241                          skb_put(ctx->skb, rcd->len);
  1242  
  1243                          /* Immediate refill */

regards,
dan carpenter

