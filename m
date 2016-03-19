From: Bart Van Assche <bart.vanassche@sandisk.com>
Date: Sat, 19 Mar 2016 01:17:20 +0000
Subject: Re: [patch] ib_srpt: fix a WARN_ON() message
Message-Id: <56ECA8A0.5060502@sandisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160318054159.GE2111@mwanda>
In-Reply-To: <20160318054159.GE2111@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicholas Bellinger <nab-IzHhD5pYlfBP7FQvKIMDCQ@public.gmane.org>, Sagi Grimberg <sagig-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Alex Estrin <alex.estrin-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 03/17/16 22:41, Dan Carpenter wrote:
> The first argument of WARN_ON() is a condition, so it means the warning
> message here will just be the name without the ->qp_num information.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
> index 1d13090..0bd3cb2 100644
> --- a/drivers/infiniband/ulp/srpt/ib_srpt.c
> +++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
> @@ -839,7 +839,7 @@ static void srpt_zerolength_write_done(struct ib_cq *cq, struct ib_wc *wc)
>   		if (srpt_set_ch_state(ch, CH_DISCONNECTED))
>   			schedule_work(&ch->release_work);
>   		else
> -			WARN_ONCE("%s-%d\n", ch->sess_name, ch->qp->qp_num);
> +			WARN_ONCE(1, "%s-%d\n", ch->sess_name, ch->qp->qp_num);
>   	}
>   }

Reviewed-by: Bart Van Assche <bart.vanassche@sandisk.com>
