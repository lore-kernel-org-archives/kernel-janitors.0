From: Corey Minyard <minyard@acm.org>
Date: Fri, 22 Mar 2019 13:13:48 +0000
Subject: Re: [Openipmi-developer] [PATCH] ipmi_si: remove an unused variable in try_smi_init()
Message-Id: <20190322131348.GE2628@minyard.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Mar 22, 2019 at 09:54:26AM +0300, Dan Carpenter wrote:
> The "init_name" variable isn't used any more after commit 90b2d4f15ff7
> ("ipmi_si: Remove hacks for adding a dummy platform devices").
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued for 5.1, thanks.

-corey

> ---
>  drivers/char/ipmi/ipmi_si_intf.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index b1732882b97e..f124a2d2bb9f 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -1931,7 +1931,6 @@ static int try_smi_init(struct smi_info *new_smi)
>  {
>  	int rv = 0;
>  	int i;
> -	char *init_name = NULL;
>  
>  	pr_info("Trying %s-specified %s state machine at %s address 0x%lx, slave address 0x%x, irq %d\n",
>  		ipmi_addr_src_to_str(new_smi->io.addr_source),
> @@ -2073,7 +2072,6 @@ static int try_smi_init(struct smi_info *new_smi)
>  		new_smi->io.io_cleanup = NULL;
>  	}
>  
> -	kfree(init_name);
>  	return rv;
>  }
>  
> -- 
> 2.17.1
> 
> 
> 
> _______________________________________________
> Openipmi-developer mailing list
> Openipmi-developer@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/openipmi-developer
