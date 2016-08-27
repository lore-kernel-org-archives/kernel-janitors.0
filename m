From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 27 Aug 2016 19:06:25 +0000
Subject: Re: [PATCH 8/8] cris-cryptocop: Apply another recommendation from "checkpatch.pl"
Message-Id: <alpine.DEB.2.10.1608272105110.3363@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <bfc23090-e05d-f491-2a28-1803ceb31a31@users.sourceforge.net> <0e29d372-ef5f-afa7-50b1-70ddc089ef00@users.sourceforge.net>
In-Reply-To: <0e29d372-ef5f-afa7-50b1-70ddc089ef00@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-cris-kernel@axis.com, Adam Buchbinder <adam.buchbinder@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Jiri Kosina <jkosina@suse.cz>, Mikael Starvik <starvik@axis.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>



On Fri, 26 Aug 2016, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 26 Aug 2016 14:23:06 +0200
>
> The script "checkpatch.pl" can point out that assignments should usually
> not be performed within condition checks.
> Thus move the assignments for a local variable to separate statements
> in three functions.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/cris/arch-v32/drivers/cryptocop.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/cris/arch-v32/drivers/cryptocop.c b/arch/cris/arch-v32/drivers/cryptocop.c
> index 1a966dc..00231a7 100644
> --- a/arch/cris/arch-v32/drivers/cryptocop.c
> +++ b/arch/cris/arch-v32/drivers/cryptocop.c
> @@ -1510,7 +1510,8 @@ int cryptocop_new_session(cryptocop_session_id *sid, struct cryptocop_transform_
>  	while (tfrm_in){
>  		int err;
>  		++no_tfrms;
> -		if ((err = transform_ok(tfrm_in))) {
> +		err = transform_ok(tfrm_in);
> +		if (err) {
>  			DEBUG_API(printk("cryptocop_new_session, bad transform\n"));
>  			return err;
>  		}
> @@ -2276,7 +2277,10 @@ static int cryptocop_job_setup(struct cryptocop_prio_job **pj, struct cryptocop_
>  		(*pj)->iop->ctx_in.saved_data = operation->list_op.inlist;
>  		(*pj)->iop->ctx_in.saved_data_buf = operation->list_op.in_data_buf;
>  	} else {
> -		if ((err = cryptocop_setup_dma_list(operation, &(*pj)->iop, alloc_flag))) {
> +		err = cryptocop_setup_dma_list(operation,
> +					       &(*pj)->iop,
> +					       alloc_flag);

Checkpatch didn't say to put every argument on a different line, and that
wasn't done before, so why do it now?  There is plenty of room for at
least &(*pj)->iop on the line before.

julia

> +		if (err) {
>  			DEBUG_API(printk("cryptocop_job_setup: cryptocop_setup_dma_list failed %d\n", err));
>  			kfree(*pj);
>  			return err;
> @@ -2867,7 +2871,8 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
>
>  	DEBUG(printk("cryptocop_ioctl_process: inserting job, cb_data=0x%p\n", cop->cb_data));
>
> -	if ((err = cryptocop_job_queue_insert_user_job(cop)) != 0) {
> +	err = cryptocop_job_queue_insert_user_job(cop);
> +	if (err) {
>  		DEBUG_API(printk("cryptocop_ioctl_process: insert job %d\n", err));
>  		err = -EINVAL;
>  		goto mark_outpages_dirty;
> --
> 2.9.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
