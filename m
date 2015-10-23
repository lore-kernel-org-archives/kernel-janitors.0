From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Fri, 23 Oct 2015 07:37:33 +0000
Subject: Re: [PATCH] TPM: Avoid reference to potentially freed memory
Message-Id: <20151023073733.GA6941@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445545961-5620-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1445545961-5620-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: peterhuewe@gmx.de, tpmdd@selhorst.net, tpmdd-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Oct 22, 2015 at 10:32:41PM +0200, Christophe JAILLET wrote:
> Reference to the 'np' node is dropped before dereferencing the 'sizep' and
> 'basep' pointers, which could by then point to junk if the node has been
> freed.
> 
> Refactor code to call 'of_node_pup' later.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

LGTM.

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

> ---
>  drivers/char/tpm/tpm_of.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/tpm/tpm_of.c b/drivers/char/tpm/tpm_of.c
> index 1141456..570f30c 100644
> --- a/drivers/char/tpm/tpm_of.c
> +++ b/drivers/char/tpm/tpm_of.c
> @@ -53,17 +53,18 @@ int read_log(struct tpm_bios_log *log)
>  		goto cleanup_eio;
>  	}
>  
> -	of_node_put(np);
>  	log->bios_event_log = kmalloc(*sizep, GFP_KERNEL);
>  	if (!log->bios_event_log) {
>  		pr_err("%s: ERROR - Not enough memory for BIOS measurements\n",
>  		       __func__);
> +		of_node_put(np);
>  		return -ENOMEM;
>  	}
>  
>  	log->bios_event_log_end = log->bios_event_log + *sizep;
>  
>  	memcpy(log->bios_event_log, __va(*basep), *sizep);
> +	of_node_put(np);
>  
>  	return 0;
>  
> -- 
> 2.1.4
> 

/Jarkko
