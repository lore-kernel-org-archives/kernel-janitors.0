From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Aug 2017 10:53:35 +0000
Subject: [bug report] liquidio: moved liquidio_napi_poll to lio_core.c
Message-Id: <20170817105335.n3wvejgisrvserii@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Intiyaz Basha,

This is a semi-automatic email about new static checker warnings.

The patch d314ac222829: "liquidio: moved liquidio_napi_poll to
lio_core.c" from Aug 14, 2017, leads to the following Smatch
complaint:

    drivers/net/ethernet/cavium/liquidio/lio_core.c:670 liquidio_napi_poll()
    error: we previously assumed 'iq' could be null (see line 648)

drivers/net/ethernet/cavium/liquidio/lio_core.c
   647	
   648		/* Flush the instruction queue */
   649		iq = oct->instr_queue[iq_no];
   650		if (iq) {
                    ^^
Exising code checks for NULL.

   651			/* TODO: move this check to inside octeon_flush_iq,
   652			 * once check_db_timeout is removed
   653			 */
   654			if (atomic_read(&iq->instr_pending))
   655				/* Process iq buffers with in the budget limits */
   656				tx_done = octeon_flush_iq(oct, iq, budget);
   657			else
   658				tx_done = 1;
   659			/* Update iq read-index rather than waiting for next interrupt.
   660			 * Return back if tx_done is false.
   661			 */
   662			/* sub-queue status update */
   663			lio_update_txq_status(oct, iq_no);
   664		} else {
   665			dev_err(&oct->pci_dev->dev, "%s:  iq (%d) num invalid\n",
   666				__func__, iq_no);
   667		}
   668	
   669	#define MAX_REG_CNT  2000000U
   670		/* force enable interrupt if reg cnts are high to avoid wraparound */
   671		if (((work_done < budget) && (tx_done)) ||
   672		    (iq->pkt_in_done >= MAX_REG_CNT) ||
                     ^^^^^^^^^^^^^^^
The old code had a check for NULL here as well, but the re-shuffled code
removed it.

regards,
dan carpenter
