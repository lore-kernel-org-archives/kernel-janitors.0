From: Roland Dreier <rdreier@cisco.com>
Date: Mon, 21 Jul 2008 16:25:07 +0000
Subject: Re: [PATCH 1/7] drivers/infiniband: Release mutex in error handling code
Message-Id: <ada4p6j6w7w.fsf@cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807210956040.24625@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807210956040.24625@ask.diku.dk> (Julia Lawall's
	message of "Mon, 21 Jul 2008 09:57:04 +0200 (CEST)")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: rolandd@cisco.com, sean.hefty@intel.com, hal.rosenstock@gmail.com, general@lists.openfabrics.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, hnguyen@de.ibm.com, raisch@de.ibm.com

 > --- a/drivers/infiniband/hw/ehca/ipz_pt_fn.c
 > +++ b/drivers/infiniband/hw/ehca/ipz_pt_fn.c
 > @@ -163,6 +163,7 @@ static int alloc_small_queue_page(struct
 >  
 >  out:
 >  	ehca_err(pd->ib_pd.device, "failed to allocate small queue page");
 > +	mutex_unlock(&pd->lock);
 >  	return 0;
 >  }

Thanks, looks obviously correct.  ehca guys, I will queue this for my
next pull request to Linus; please let me know if you see a problem and
want me to drop it.

 - R.
