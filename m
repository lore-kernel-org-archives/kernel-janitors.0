From: <dan.carpenter@oracle.com>
Date: Wed, 15 Jul 2020 11:59:29 +0000
Subject: [bug report] dpaa2-eth: send a scatter-gather FD instead of realloc-ing
Message-Id: <20200715115929.GA390833@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ioana Ciornei,

The patch d70446ee1f40: "dpaa2-eth: send a scatter-gather FD instead
of realloc-ing" from Jun 29, 2020, leads to the following static
checker warning:

	drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:719 build_sg_fd_single_buf()
	warn: overwrite may leak 'sgt_buf'

drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
   694  static int build_sg_fd_single_buf(struct dpaa2_eth_priv *priv,
   695                                    struct sk_buff *skb,
   696                                    struct dpaa2_fd *fd)
   697  {
   698          struct device *dev = priv->net_dev->dev.parent;
   699          struct dpaa2_eth_sgt_cache *sgt_cache;
   700          struct dpaa2_sg_entry *sgt;
   701          struct dpaa2_eth_swa *swa;
   702          dma_addr_t addr, sgt_addr;
   703          void *sgt_buf = NULL;
   704          int sgt_buf_size;
   705          int err;
   706  
   707          /* Prepare the HW SGT structure */
   708          sgt_cache = this_cpu_ptr(priv->sgt_cache);
   709          sgt_buf_size = priv->tx_data_offset + sizeof(struct dpaa2_sg_entry);
   710  
   711          if (sgt_cache->count = 0)
   712                  sgt_buf = kzalloc(sgt_buf_size + DPAA2_ETH_TX_BUF_ALIGN,
   713                                    GFP_ATOMIC);
   714          else
   715                  sgt_buf = sgt_cache->buf[--sgt_cache->count];
   716          if (unlikely(!sgt_buf))
   717                  return -ENOMEM;
   718  
   719          sgt_buf = PTR_ALIGN(sgt_buf, DPAA2_ETH_TX_BUF_ALIGN);

Do we need to store the original "sgt_buf" pointer so we can kfree() it
at the end?

   720          sgt = (struct dpaa2_sg_entry *)(sgt_buf + priv->tx_data_offset);
   721  
   722          addr = dma_map_single(dev, skb->data, skb->len, DMA_BIDIRECTIONAL);
   723          if (unlikely(dma_mapping_error(dev, addr))) {
   724                  err = -ENOMEM;
   725                  goto data_map_failed;
   726          }
   727  
   728          /* Fill in the HW SGT structure */
   729          dpaa2_sg_set_addr(sgt, addr);
   730          dpaa2_sg_set_len(sgt, skb->len);
   731          dpaa2_sg_set_final(sgt, true);
   732  
   733          /* Store the skb backpointer in the SGT buffer */

regards,
dan carpenter
