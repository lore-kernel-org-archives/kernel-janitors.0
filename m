From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Nov 2016 14:12:41 +0000
Subject: [bug report] bnx2x: Separate VF and PF logic
Message-Id: <20161114141241.GA32626@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ariel Elior,

The patch ad5afc89365e: "bnx2x: Separate VF and PF logic" from Jan 1,
2013, leads to the following static checker warning:

	drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2944 bnx2x_nic_load()
	warn: 'rc' can be either negative or positive

drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
  2797  
  2798          /* setup rss */
  2799          rc = bnx2x_init_rss(bp);
  2800          if (rc) {
  2801                  BNX2X_ERR("PF RSS init failed\n");
  2802                  LOAD_ERROR_EXIT(bp, load_error3);
  2803          }
  2804  

The warning heuristic here is to complain if negative and positive
values are treated the same.  This code is very confusing.  For example,
the comments for bnx2x_queue_state_change() says it returns a positive
EBUSY but it does not.

But my main concern is bnx2x_setup_rss(), it either returns a negative
value or it returns 1.  My understanding is that both of those returns
are treated as an error on line 2800 in the code above so it can't
possibly work.

regards,
dan carpenter
