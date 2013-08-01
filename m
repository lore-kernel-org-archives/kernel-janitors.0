From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Aug 2013 15:44:52 +0000
Subject: re: pktcdvd: add struct pktcdvd_device * to pkt_dbg
Message-Id: <20130801154452.GB5198@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Joe Perches,

This is a semi-automatic email about new static checker warnings.

The patch 3567318a63ff: "pktcdvd: add struct pktcdvd_device * to 
pkt_dbg" from Aug 1, 2013, leads to the following Smatch complaint:

drivers/block/pktcdvd.c:2844 pkt_remove_dev()
	 error: we previously assumed 'pd' could be null (see line 2840)

drivers/block/pktcdvd.c
  2839			pd = pkt_devs[idx];
  2840			if (pd && (pd->pkt_dev = pkt_dev))
                            ^^
Old check.

  2841				break;
  2842		}
  2843		if (idx = MAX_WRITERS) {
  2844			pkt_dbg(1, pd, "dev not setup\n");
                                   ^^
New dereference.

  2845			ret = -ENXIO;
  2846			goto out;

regards,
dan carpenter
