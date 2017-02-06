From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Feb 2017 09:22:40 +0000
Subject: Re: [bug report] liquidio: fix for iq and droq cnts going negative
Message-Id: <20170206092240.GA11154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170206090845.GA14504@mwanda>
In-Reply-To: <20170206090845.GA14504@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Also the other one in lio_vf_main.c

drivers/net/ethernet/cavium/liquidio/lio_vf_main.c:1635 liquidio_napi_poll()
error: we previously assumed 'iq' could be null (see line 1621)

regards,
dan carpenter

On Mon, Feb 06, 2017 at 12:08:45PM +0300, Dan Carpenter wrote:
> Hello Satanand Burla,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch cdb478e5e413: "liquidio: fix for iq and droq cnts going 
> negative" from Jan 31, 2017, leads to the following Smatch complaint:
> 
> drivers/net/ethernet/cavium/liquidio/lio_main.c:2450 liquidio_napi_poll()
> 	 error: we previously assumed 'iq' could be null (see line 2436)
> 
> drivers/net/ethernet/cavium/liquidio/lio_main.c
>   2435		iq = oct->instr_queue[iq_no];
>   2436		if (iq) {
>                     ^^
> Old code assumed "iq" can be NULL.
> 
>   2437			/* Process iq buffers with in the budget limits */
>   2438			tx_done = octeon_flush_iq(oct, iq, budget);
>   2439			/* Update iq read-index rather than waiting for next interrupt.
>   2440			 * Return back if tx_done is false.
>   2441			 */
>   2442			update_txq_status(oct, iq_no);
>   2443		} else {
>   2444			dev_err(&oct->pci_dev->dev, "%s:  iq (%d) num invalid\n",
>   2445				__func__, iq_no);
>   2446		}
>   2447	
>   2448		/* force enable interrupt if reg cnts are high to avoid wraparound */
>   2449		if ((work_done < budget && tx_done) ||
>   2450		    (iq->pkt_in_done >= MAX_REG_CNT) ||
>                      ^^^^^^^^^^^^^^^
> New code adds unchecked dereference.
> 
>   2451		    (droq->pkt_count >= MAX_REG_CNT)) {
>   2452			tx_done = 1;
> 
> regards,
> dan carpenter
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
