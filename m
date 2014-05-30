From: Dimitri Sivanich <sivanich@sgi.com>
Date: Fri, 30 May 2014 17:15:07 +0000
Subject: Re: [PATCH RESEND] sgi-gru: use time_before()
Message-Id: <20140530171507.GA85969@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401457259-17401-1-git-send-email-manuel.schoelling@gmx.de>
In-Reply-To: <1401457259-17401-1-git-send-email-manuel.schoelling@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Manuel =?iso-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Acked-by: Dimitri Sivanich <sivanich@sgi.com>

On Fri, May 30, 2014 at 03:40:59PM +0200, Manuel Sch=F6lling wrote:
> To be future-proof and for better readability the time comparisons are
> modified to use time_before() instead of plain, error-prone math.
>=20
> Signed-off-by: Manuel Sch=F6lling <manuel.schoelling@gmx.de>
> ---
>  drivers/misc/sgi-gru/grumain.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/misc/sgi-gru/grumain.c b/drivers/misc/sgi-gru/grumai=
n.c
> index ae16c8c..1525870 100644
> --- a/drivers/misc/sgi-gru/grumain.c
> +++ b/drivers/misc/sgi-gru/grumain.c
> @@ -930,6 +930,7 @@ int gru_fault(struct vm_area_struct *vma, struct vm_f=
ault *vmf)
>  {
>  	struct gru_thread_state *gts;
>  	unsigned long paddr, vaddr;
> +	unsigned long expires;
> =20
>  	vaddr =3D (unsigned long)vmf->virtual_address;
>  	gru_dbg(grudev, "vma %p, vaddr 0x%lx (0x%lx)\n",
> @@ -954,7 +955,8 @@ again:
>  			mutex_unlock(&gts->ts_ctxlock);
>  			set_current_state(TASK_INTERRUPTIBLE);
>  			schedule_timeout(GRU_ASSIGN_DELAY);  /* true hack ZZZ */
> -			if (gts->ts_steal_jiffies + GRU_STEAL_DELAY < jiffies)
> +			expires =3D gts->ts_steal_jiffies + GRU_STEAL_DELAY;
> +			if (time_before(expires, jiffies))
>  				gru_steal_context(gts);
>  			goto again;
>  		}
> --=20
> 1.7.10.4
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
