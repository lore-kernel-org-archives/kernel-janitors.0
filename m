From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 18 Dec 2009 14:19:40 +0000
Subject: Re: [PATCH 09/10] Fix misspellings of "separate" in strings.
Message-Id: <alpine.LNX.2.00.0912181519310.3755@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1260567342-8327-10-git-send-email-adam.buchbinder@gmail.com>
In-Reply-To: <1260567342-8327-10-git-send-email-adam.buchbinder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 11 Dec 2009, Adam Buchbinder wrote:

> Some string messages misspell "separate"; this fixes them. No change in
> functionality.
> 
> Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
> ---
>  drivers/acpi/proc.c             |    2 +-
>  drivers/isdn/mISDN/l1oip_core.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/proc.c b/drivers/acpi/proc.c
> index d0d25e2..1ac678d 100644
> --- a/drivers/acpi/proc.c
> +++ b/drivers/acpi/proc.c
> @@ -435,7 +435,7 @@ acpi_system_write_wakeup_device(struct file *file,
>  				found_dev->wakeup.gpe_device)) {
>  				printk(KERN_WARNING
>  				       "ACPI: '%s' and '%s' have the same GPE, "
> -				       "can't disable/enable one seperately\n",
> +				       "can't disable/enable one separately\n",
>  				       dev->pnp.bus_id, found_dev->pnp.bus_id);
>  				dev->wakeup.state.enabled >  				    found_dev->wakeup.state.enabled;
> diff --git a/drivers/isdn/mISDN/l1oip_core.c b/drivers/isdn/mISDN/l1oip_core.c
> index 7e5f30d..7c63472 100644
> --- a/drivers/isdn/mISDN/l1oip_core.c
> +++ b/drivers/isdn/mISDN/l1oip_core.c
> @@ -1509,7 +1509,7 @@ l1oip_init(void)
>  			printk(KERN_DEBUG "%s: interface %d is %s with %s.\n",
>  			    __func__, l1oip_cnt, pri ? "PRI" : "BRI",
>  			    bundle ? "bundled IP packet for all B-channels" :
> -			    "seperate IP packets for every B-channel");
> +			    "separate IP packets for every B-channel");
>  
>  		hc = kzalloc(sizeof(struct l1oip), GFP_ATOMIC);

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
