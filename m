From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Aug 2016 14:13:31 +0000
Subject: [bug report] drivers/net: support hdlc function for QE-UCC
Message-Id: <20160803141331.GA9097@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160712234919.GA23061@mwanda>
In-Reply-To: <20160712234919.GA23061@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Zhao Qiang,

The patch c19b6d246a35: "drivers/net: support hdlc function for
QE-UCC" from Jun 6, 2016, leads to the following static checker
warning:

	drivers/net/wan/fsl_ucc_hdlc.c:164 uhdlc_init()
	warn: unsigned 'priv->ucc_pram_offset' is never less than zero.

drivers/net/wan/fsl_ucc_hdlc.c
   159  
   160          /* Alloc parameter ram for ucc hdlc */
   161          priv->ucc_pram_offset = qe_muram_alloc(sizeof(priv->ucc_pram),
   162                                  ALIGNMENT_OF_UCC_HDLC_PRAM);
   163  
   164          if (priv->ucc_pram_offset < 0) {

This is slightly complicated what's happening here.  qe_muram_alloc()
returns negatives but casted to an unsigned long, then we assign it to
priv->ucc_pram_offset which is a u32.

   165                  dev_err(priv->dev, "Can not allocate MURAM for hdlc prameter.\n");
   166                  ret = -ENOMEM;
   167                  goto free_tx_bd;
   168          }
   169  

regards,
dan carpenter
