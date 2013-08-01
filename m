From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Aug 2013 15:44:26 +0000
Subject: re: pktcdvd: add struct pktcdvd_device.name to pr_err logging where possible
Message-Id: <20130801154426.GA5198@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Joe Perches,

This is a semi-automatic email about new static checker warnings.

The patch b5a0e979a657: "pktcdvd: add struct pktcdvd_device.name to 
pr_err logging where possible" from Aug 1, 2013, leads to the 
following Smatch complaint:

drivers/block/pktcdvd.c:2363 pkt_make_request()
	 error: we previously assumed 'pd' could be null (see line 2362)

drivers/block/pktcdvd.c
  2361		pd = q->queuedata;
  2362		if (!pd) {
                    ^^^
Old check.
  2363			pkt_err(pd, "%s incorrect request queue\n",
                                ^^^
New dereference.
  2364				bdevname(bio->bi_bdev, b));
  2365			goto end_io;

regards,
dan carpenter
