From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sun, 08 Oct 2017 18:17:33 +0000
Subject: Re: [6/8] cris-cryptocop: Delete two variables in cryptocop_ioctl_process()
Message-Id: <80d4d513-13e3-0301-83d3-0603ae574554@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f228c0d7-481e-3444-0e61-0c93e8a554e2@users.sourceforge.net>
In-Reply-To: <f228c0d7-481e-3444-0e61-0c93e8a554e2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-cris-kernel@axis.com, Jesper Nilsson <jesper.nilsson@axis.com>, Mikael Starvik <starvik@axis.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Hello Markus,

On 26/08/16 14:56, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 26 Aug 2016 13:40:29 +0200
> 
> A zero was assigned to the local variables "cipher_done" and "csum_done"
> at one place. But they were not read within this function.
> Thus remove them.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  arch/cris/arch-v32/drivers/cryptocop.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/cris/arch-v32/drivers/cryptocop.c b/arch/cris/arch-v32/drivers/cryptocop.c
> index cd34723..a682b1f 100644
> --- a/arch/cris/arch-v32/drivers/cryptocop.c
> +++ b/arch/cris/arch-v32/drivers/cryptocop.c
> @@ -2497,8 +2497,6 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
>  	int    cipher_active, digest_active, csum_active;
>  	int    end_digest, end_csum;
>  	int    digest_done = 0;
> -	int    cipher_done = 0;
> -	int    csum_done = 0;
>  
>  	DEBUG(printk("cryptocop_ioctl_process\n"));
>  
> @@ -2794,12 +2792,10 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
>  			dcfgs[dcfg_ix].src = cryptocop_source_dma;
>  			cipher_active = 1;
>  
> -			if (next_ix = (oper.cipher_start + oper.cipher_len)){
> -				cipher_done = 1;
> +			if (next_ix = (oper.cipher_start + oper.cipher_len))
>  				dcfgs[dcfg_ix].last = 1;
> -			} else {
> +			else
>  				dcfgs[dcfg_ix].last = 0;
> -			}
>  			dcfgs[dcfg_ix].next = descs[desc_ix].cfg;
>  			descs[desc_ix].cfg = &dcfgs[dcfg_ix];
>  			++dcfg_ix;
> @@ -2823,12 +2819,10 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
>  			csum_active = 1;
>  			dcfgs[dcfg_ix].tid = CRYPTOCOP_IOCTL_CSUM_TID;
>  			dcfgs[dcfg_ix].src = cryptocop_source_dma;
> -			if (next_ix = (oper.csum_start + oper.csum_len)){
> -				csum_done = 1;
> +			if (next_ix = (oper.csum_start + oper.csum_len))
>  				dcfgs[dcfg_ix].last = 1;
> -			} else {
> +			else
>  				dcfgs[dcfg_ix].last = 0;
> -			}
>  			dcfgs[dcfg_ix].next = descs[desc_ix].cfg;
>  			descs[desc_ix].cfg = &dcfgs[dcfg_ix];
>  			++dcfg_ix;
> 
