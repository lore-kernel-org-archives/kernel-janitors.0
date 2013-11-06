From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Nov 2013 16:11:24 +0000
Subject: re: mfd: add driver for sequencer serial port
Message-Id: <20131106161124.GA15603@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Cyril Chemparathy,

This is a semi-automatic email about new static checker warnings.

The patch 03df0f629483: "mfd: add driver for sequencer serial port" 
from Jan 18, 2011, leads to the following Smatch complaint:

drivers/mfd/ti-ssp.c:407 ti_ssp_probe()
	 error: we previously assumed 'pdata' could be null (see line 400)

drivers/mfd/ti-ssp.c
   399		sysclk = clk_get_rate(ssp->clk);
   400		if (pdata && pdata->out_clock)
                    ^^^^^
Check.

   401			prediv = (sysclk / pdata->out_clock) - 1;
   402		prediv = clamp(prediv, 0, 0xff);
   403		ssp_rmw(ssp, REG_PREDIV, 0xff, prediv);
   404	
   405		memset(cells, 0, sizeof(cells));
   406		for (id = 0; id < 2; id++) {
   407			const struct ti_ssp_dev_data *data = &pdata->dev_data[id];
                                                              ^^^^^^^^^^^^^^^^^^^
Unchecked dereference.

   408	
   409			cells[id].id		= id;

regards,
dan carpenter
