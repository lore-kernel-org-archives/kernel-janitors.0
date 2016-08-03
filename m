From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Aug 2016 13:06:25 +0000
Subject: re: drivers/net: support hdlc function for QE-UCC
Message-Id: <20160803130625.GA27767@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Zhao Qiang,

This is a semi-automatic email about new static checker warnings.

The patch c19b6d246a35: "drivers/net: support hdlc function for 
QE-UCC" from Jun 6, 2016, leads to the following Smatch complaint:

drivers/net/wan/fsl_ucc_hdlc.c:707 uhdlc_memclean()
	 warn: variable dereferenced before check 'priv->ucc_pram' (see line 686)

drivers/net/wan/fsl_ucc_hdlc.c
   685	{
   686		qe_muram_free(priv->ucc_pram->riptr);
   687		qe_muram_free(priv->ucc_pram->tiptr);
                              ^^^^^^^^^^^^^^
Dereference.

   688	
   689		if (priv->rx_bd_base) {
   690			dma_free_coherent(priv->dev,
   691					  RX_BD_RING_LEN * sizeof(struct qe_bd),
   692					  priv->rx_bd_base, priv->dma_rx_bd);
   693	
   694			priv->rx_bd_base = NULL;
   695			priv->dma_rx_bd = 0;
   696		}
   697	
   698		if (priv->tx_bd_base) {
   699			dma_free_coherent(priv->dev,
   700					  TX_BD_RING_LEN * sizeof(struct qe_bd),
   701					  priv->tx_bd_base, priv->dma_tx_bd);
   702	
   703			priv->tx_bd_base = NULL;
   704			priv->dma_tx_bd = 0;
   705		}
   706	
   707		if (priv->ucc_pram) {
                    ^^^^^^^^^^^^^^
Checked too late.

   708			qe_muram_free(priv->ucc_pram_offset);
   709			priv->ucc_pram = NULL;

regards,
dan carpenter
