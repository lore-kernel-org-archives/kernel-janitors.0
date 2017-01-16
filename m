From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Jan 2017 11:24:59 +0000
Subject: [bug report] net: ethernet: ti: davinci_cpdma: add set rate for a channel
Message-Id: <20170116112459.GA10004@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ivan Khoronzhuk,

This is a semi-automatic email about new static checker warnings.

The patch 8f32b90981dc: "net: ethernet: ti: davinci_cpdma: add set 
rate for a channel" from Nov 29, 2016, leads to the following Smatch 
complaint:

drivers/net/ethernet/ti/davinci_cpdma.c:843 cpdma_chan_set_rate()
	 warn: variable dereferenced before check 'ch' (see line 838)

drivers/net/ethernet/ti/davinci_cpdma.c
   837	{
   838		struct cpdma_ctlr *ctlr = ch->ctlr;
                                          ^^^^
New NULL check?

   839		unsigned long flags, ch_flags;
   840		int ret, prio_mode;
   841		u32 rmask;
   842	
   843		if (!ch || !is_tx_chan(ch))
                    ^^^
Too late.

   844			return -EINVAL;
   845	

regards,
dan carpenter
