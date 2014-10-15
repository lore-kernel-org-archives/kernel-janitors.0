From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Oct 2014 13:53:54 +0000
Subject: re: net: sxgbe: add basic framework for Samsung 10Gb ethernet driver
Message-Id: <20141015135354.GA15342@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Siva Reddy,

The patch 1edb9ca69e8a: "net: sxgbe: add basic framework for Samsung
10Gb ethernet driver" from Mar 25, 2014, leads to the following
static checker warning:

	drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c:505 init_rx_ring()
	warning: passing freed memory 'rx_ring->rx_skbuff'

drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
   500          return 0;
   501  
   502  err_init_rx_buffers:
   503          while (--desc_index >= 0)
   504                  free_rx_ring(priv->device, rx_ring, desc_index);
                                                   ^^^^^^^
We free "rx_ring->rx_skbuff" and "rx_ring->rx_skbuff_dma" here so the
next two kfree() calls are double frees.

   505          kfree(rx_ring->rx_skbuff);
   506  rxbuff_err:
   507          kfree(rx_ring->rx_skbuff_dma);
   508  dmamem_err:
   509          dma_free_coherent(priv->device,
   510                            rx_rsize * sizeof(struct sxgbe_rx_norm_desc),
   511                            rx_ring->dma_rx, rx_ring->dma_rx_phy);
   512  error:
   513          return -ENOMEM;
   514  }

regards,
dan carpenter
