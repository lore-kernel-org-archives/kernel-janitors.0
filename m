From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Jan 2016 01:12:41 +0000
Subject: re: net/macb: better manage tx errors
Message-Id: <20160126011241.GA27064@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Nicolas Ferre,

The patch e86cd53afc59: "net/macb: better manage tx errors" from Oct
31, 2012, leads to the following static checker warning:

	drivers/net/ethernet/cadence/macb.c:517 macb_halt_tx()
	error: scheduling with locks held: 'spin_lock:lock'

drivers/net/ethernet/cadence/macb.c
   503  static int macb_halt_tx(struct macb *bp)
   504  {
   505          unsigned long   halt_time, timeout;
   506          u32             status;
   507  
   508          macb_writel(bp, NCR, macb_readl(bp, NCR) | MACB_BIT(THALT));
   509  
   510          timeout = jiffies + usecs_to_jiffies(MACB_HALT_TIMEOUT);
   511          do {
   512                  halt_time = jiffies;
   513                  status = macb_readl(bp, TSR);
   514                  if (!(status & MACB_BIT(TGO)))
   515                          return 0;
   516  
   517                  usleep_range(10, 250);
                        ^^^^^^^^^^^^^^^^^^^^^
This function is called with a spinlock held so we are not allowed to
sleep.

   518          } while (time_before(halt_time, timeout));
   519  
   520          return -ETIMEDOUT;
   521  }

regards,
dan carpenter
