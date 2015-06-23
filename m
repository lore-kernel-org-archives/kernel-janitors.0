From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Jun 2015 14:24:08 +0000
Subject: re: Add support of Cavium Liquidio ethernet adapters
Message-Id: <20150623142408.GA10121@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Raghu Vatsavayi,

The patch f21fb3ed364b: "Add support of Cavium Liquidio ethernet
adapters" from Jun 9, 2015, leads to the following static checker
warning:

	drivers/net/ethernet/cavium/liquidio/lio_main.c:2530 handle_timestamp()
	warn: suspicious bitop condition

drivers/net/ethernet/cavium/liquidio/lio_main.c
  2529  
  2530          if (unlikely((skb_shinfo(skb)->tx_flags | SKBTX_IN_PROGRESS) != 0)) {

Don't use unlikely() unless you have benchmark data to prove that it's
worth the extra difficulty in reading.

Double negatives like != 0 don't not make things more difficult to read.

This condition is always true, so that's probably a bug.  & vs |.

  2531                  struct skb_shared_hwtstamps ts;
  2532                  u64 ns = resp->timestamp;

regards,
dan carpenter
