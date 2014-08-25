From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Aug 2014 17:10:59 +0000
Subject: re: bnx2x: Safe bnx2x_panic_dump()
Message-Id: <20140825171059.GA22518@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Yuval Mintz,

The patch e261199872a2: "bnx2x: Safe bnx2x_panic_dump()" from Aug 17,
2014, leads to the following static checker warning:

	drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:987 bnx2x_panic_dump()
	warn: this array is probably non-NULL. 'fp->txdata_ptr'

drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
   983  
   984                  /* Tx */
   985                  for_each_cos_in_tx_queue(fp, cos)
   986                  {
   987                          if (!fp->txdata_ptr)
                                     ^^^^^^^^^^^^^^
Maybe, "if (fp->txdata_ptr[cos])" was intended?

   988                                  break;
   989  
   990                          txdata = *fp->txdata_ptr[cos];
   991  
   992                          if (!txdata.tx_cons_sb)
   993                                  continue;
   994  

regards,
dan carpenter
