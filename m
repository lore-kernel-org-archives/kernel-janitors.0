From: Hoang-Nam Nguyen <HNGUYEN@de.ibm.com>
Date: Mon, 21 Jul 2008 18:28:59 +0000
Subject: Re: [PATCH 1/7] drivers/infiniband: Release mutex in error handling code
Message-Id: <OF524A7E58.50725540-ONC125748D.00654D93-C125748D.00657007@de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <ada4p6j6w7w.fsf@cisco.com>
References: <Pine.LNX.4.64.0807210956040.24625@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807210956040.24625@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier@cisco.com>
Cc: Christoph Raisch <raisch@de.ibm.com>, general@lists.openfabrics.org, hal.rosenstock@gmail.com, Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, rolandd@cisco.com, sean.hefty@intel.com

Roland and Julia,
Looks good to me. Thanks for pointing this out.
Nam

Roland Dreier <rdreier@cisco.com> wrote on 21.07.2008 18:25:07:

>  > --- a/drivers/infiniband/hw/ehca/ipz_pt_fn.c
>  > +++ b/drivers/infiniband/hw/ehca/ipz_pt_fn.c
>  > @@ -163,6 +163,7 @@ static int alloc_small_queue_page(struct
>  >
>  >  out:
>  >     ehca_err(pd->ib_pd.device, "failed to allocate small queue page");
>  > +   mutex_unlock(&pd->lock);
>  >     return 0;
>  >  }
>
> Thanks, looks obviously correct.  ehca guys, I will queue this for my
> next pull request to Linus; please let me know if you see a problem and
> want me to drop it.
>
>  - R.

