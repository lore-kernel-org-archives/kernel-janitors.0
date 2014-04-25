From: mathieu souchaud <mattieu.souchaud@free.fr>
Date: Fri, 25 Apr 2014 17:47:12 +0000
Subject: Re: [PATCH] x86/mce: Improve mcheck_init_device() error handling.
Message-Id: <535A9FA0.6030104@free.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1398447604-21471-1-git-send-email-mattieu.souchaud@free.fr>
In-Reply-To: <1398447604-21471-1-git-send-email-mattieu.souchaud@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: tony.luck@intel.com, bp@alien8.de, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In this patch, unwindind is still not perfect from the=20
mce_device_create() calls. I guess, from this point, on error we should=20
call mce_device_remove on every created device. But I think this will=20
make the code rather complex. And I am not too confident on this kind of=20
modification as I don't know much about MCE.

Mathieu S.

Le 25/04/2014 19:40, Mathieu Souchaud a =E9crit :
> Check return code of every function called.
>
> Signed-off-by: Mathieu Souchaud <mattieu.souchaud@free.fr>
> ---
>   arch/x86/kernel/cpu/mcheck/mce.c |   30 +++++++++++++++++++++++-------
>   1 file changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/mcheck/mce.c b/arch/x86/kernel/cpu/mchec=
k/mce.c
> index 68317c8..b865285 100644
> --- a/arch/x86/kernel/cpu/mcheck/mce.c
> +++ b/arch/x86/kernel/cpu/mcheck/mce.c
> @@ -2437,33 +2437,49 @@ static __init int mcheck_init_device(void)
>   	int err;
>   	int i =3D 0;
>  =20
> -	if (!mce_available(&boot_cpu_data))
> -		return -EIO;
> +	if (!mce_available(&boot_cpu_data)) {
> +		err =3D -EIO;
> +		goto err_out;
> +	}
>  =20
> -	zalloc_cpumask_var(&mce_device_initialized, GFP_KERNEL);
> +	if (!zalloc_cpumask_var(&mce_device_initialized, GFP_KERNEL)) {
> +		err =3D -ENOMEM;
> +		goto err_out;
> +	}
>  =20
>   	mce_init_banks();
>  =20
>   	err =3D subsys_system_register(&mce_subsys, NULL);
>   	if (err)
> -		return err;
> +		goto err_out_mem;
>  =20
>   	cpu_notifier_register_begin();
>   	for_each_online_cpu(i) {
>   		err =3D mce_device_create(i);
>   		if (err) {
>   			cpu_notifier_register_done();
> -			return err;
> +			goto err_out_mem;
>   		}
>   	}
>  =20
>   	register_syscore_ops(&mce_syscore_ops);
> -	__register_hotcpu_notifier(&mce_cpu_notifier);
> +	err =3D __register_hotcpu_notifier(&mce_cpu_notifier);
>   	cpu_notifier_register_done();
> +	if (err)
> +		goto err_out_mem;
>  =20
>   	/* register character device /dev/mcelog */
> -	misc_register(&mce_chrdev_device);
> +	err =3D misc_register(&mce_chrdev_device);
> +	if (err)
> +		goto err_out_mem;
> +
> +	return 0;
> +
> +err_out_mem:
> +	free_cpumask_var(mce_device_initialized);
>  =20
> +err_out:
> +	pr_err("Unable to init device /dev/mcelog (rc: %d)\n", err);
>   	return err;
>   }
>   device_initcall_sync(mcheck_init_device);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
