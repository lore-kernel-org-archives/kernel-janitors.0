From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 24 Nov 2005 07:32:01 +0000
Subject: Re: [KJ][PATCH] linux-2.6.15-rc2 apm_emu.c audit misc_register() ret.
Message-Id: <20051124073201.GS8272@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60995767801238987=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <34a7ae040511230009j20cff459r@mail.gmail.com>
In-Reply-To: <34a7ae040511230009j20cff459r@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============60995767801238987==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Paolo Teti (paolo.teti@gmail.com) wrote:
> from: Paolo Teti
> 
> fix a missing check on misc_register() return code
> 
> Signed-off-by: Paolo Teti <paolo.teti@gmail.com>
> 
> ---
> --- linux-2.6.15-rc2/drivers/macintosh/apm_emu.c.orig	Tue Nov 22 17:37:06 2005
> +++ linux-2.6.15-rc2/drivers/macintosh/apm_emu.c	Tue Nov 22 18:03:31 2005
> @@ -530,7 +530,11 @@ static int __init apm_emu_init(void)
>  	if (apm_proc)
>  		apm_proc->owner = THIS_MODULE;
> 
> -	misc_register(&apm_device);
> +	if (misc_register(&apm_device) != 0) {
> +		remove_proc_entry("apm", NULL);
> +		printk(KERN_ERR "apm_emu: Failed to register APM Emulation.\n");
> +		return -ENODEV;
> +	}
> 
>  	pmu_register_sleep_notifier(&apm_sleep_notifier);
 

Good retry :)

Already done here :

	http://lists.osdl.org/pipermail/kernel-janitors/2005-June/004243.html

Have a nice day,

				- Christophe (clucas@rotomalug.org)


--===============60995767801238987==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60995767801238987==--
