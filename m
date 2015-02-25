From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Feb 2015 13:34:22 +0000
Subject: re: net: bcmgenet: add main driver file
Message-Id: <20150225133422.GT19745@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Florian Fainelli,

The patch 1c1008c793fa: "net: bcmgenet: add main driver file" from
Feb 13, 2014, leads to the following static checker warning:

	drivers/net/ethernet/broadcom/genet/bcmgenet.c:1955 bcmgenet_init_dma()
	error: potential null dereference 'priv->tx_cbs'.  (kcalloc returns null)

drivers/net/ethernet/broadcom/genet/bcmgenet.c
  1952          priv->tx_cbs = kcalloc(priv->num_tx_bds, sizeof(struct enet_cb),
  1953                                 GFP_KERNEL);
  1954          if (!priv->tx_cbs) {
  1955                  bcmgenet_fini_dma(priv);
                        ^^^^^^^^^^^^^^^^^^^^^^^
We dereference "priv->tx_cbs" inside the bcmgenet_fini_dma() function.

  1956                  return -ENOMEM;
  1957          }

regards,
dan carpenter
