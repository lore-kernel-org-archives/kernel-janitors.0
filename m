From: Neil Horman <nhorman@tuxdriver.com>
Date: Sun, 30 Jul 2006 01:56:36 +0000
Subject: Re: [KJ] patch to fix initialization code of edd.c
Message-Id: <20060730015636.GA10030@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10607291831q7d2dbe26q6aec6406b093da8d@mail.gmail.com>
In-Reply-To: <6b4e42d10607291831q7d2dbe26q6aec6406b093da8d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jul 29, 2006 at 06:31:49PM -0700, Om. wrote:
> Hi,
> BIOS Enhanced Disk Drive Services (EDD) driver's failed return from
> the init function causes memory leaks in src/drivers/firmware/edd.c
> This is my first patch submission. It is generated against 2.6.18-rc2.
> 
> Review comments welcome.
> Regards,
> Om.
> 
Looks good, but instead of adding a stack variable failno to free the allocated
devices on failure, why not just use the same i variable and count backwards in
the loop under alloc_fail?

Regards
Neil


> Signed-off-by: Om Nara<xhandle@gmail.com>
> 
>  drivers/firmware/edd.c |   27 +++++++++++++++++++--------
>  1 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
> index b4502ed..036dfc6 100644
> --- a/drivers/firmware/edd.c
> +++ b/drivers/firmware/edd.c
> @@ -739,6 +739,7 @@ static int __init
>  edd_init(void)
>  {
>  	unsigned int i;
> +	unsigned int failno;
>  	int rc=0;
>  	struct edd_device *edev;
> 
> @@ -754,21 +755,31 @@ edd_init(void)
>  	if (rc)
>  		return rc;
> 
> -	for (i = 0; i < edd_num_devices() && !rc; i++) {
> +	for (i = 0, failno = 0; i < edd_num_devices(); i++) {
>  		edev = kzalloc(sizeof (*edev), GFP_KERNEL);
> -		if (!edev)
> -			return -ENOMEM;
> -
> +		if (!edev) {
> +			failno = i;
> +			rc = -ENOMEM;
> +			goto alloc_fail;
> +		}
>  		rc = edd_device_register(edev, i);
>  		if (rc) {
> -			kfree(edev);
> -			break;
> +			failno = i;
> +			goto devreg_fail;
>  		}
>  		edd_devices[i] = edev;
>  	}
> +	return rc;
> 
> -	if (rc)
> -		firmware_unregister(&edd_subsys);
> +devreg_fail:
> +	kfree (edev);
> +
> +alloc_fail:
> +	for (i = 0; i < failno; i++) {
> +		edd_device_unregister (edd_devices[i]);
> +		kfree (edd_devices[i]);
> +	}
> +	firmware_unregister(&edd_subsys);
>  	return rc;
>  }
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
