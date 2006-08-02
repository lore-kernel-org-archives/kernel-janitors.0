From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 02 Aug 2006 01:04:04 +0000
Subject: Re: [KJ] [PATCH] apm: clean up module initalization
Message-Id: <20060802110404.70edf996.sfr@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0177309019=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060801214545.GA6827@martell.zuzino.mipt.ru>
In-Reply-To: <20060801214545.GA6827@martell.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============0177309019==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Wed__2_Aug_2006_11_04_04_+1000_ZEIS_pYUipwMyhsd"

--Signature=_Wed__2_Aug_2006_11_04_04_+1000_ZEIS_pYUipwMyhsd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Tue, 1 Aug 2006 12:25:48 -0400 Neil Horman <nhorman@tuxdriver.com> wrote:
>
> diff --git a/arch/i386/kernel/apm.c b/arch/i386/kernel/apm.c
> index 8591f2f..75d8bde 100644
> --- a/arch/i386/kernel/apm.c
> +++ b/arch/i386/kernel/apm.c
> @@ -2339,16 +2339,22 @@ #endif
>  	ret =3D kernel_thread(apm, NULL, CLONE_KERNEL | SIGCHLD);
>  	if (ret < 0) {
>  		printk(KERN_ERR "apm: disabled - Unable to start kernel thread.\n");
> -		return -ENOMEM;
> +		ret =3D -ENOMEM;

Doesn't kernel_thread return a good error code?

> +		goto out_proc;

Good catch.

>  	}
> =20
>  	if (num_online_cpus() > 1 && !smp ) {
>  		printk(KERN_NOTICE
>  		   "apm: disabled - APM is not SMP safe (power off active).\n");
> -		return 0;
> +		ret =3D -EOPNOTSUPP;
> +		goto out_thread;

This is a success return.  i.e. we want the kernel thread and the proc
file.  So the original was correct.  We have checked above if we are
trying to run SMP without the smp boot option - this check is just to stop
any more initialisation.

>  	}
> =20
> -	misc_register(&apm_device);
> +	if (misc_register(&apm_device)) {
> +		printk(KERN_ERR "apm: Unable to register misc device\n");
> +		ret =3D -ENOMEM;
> +		goto out_thread;
> +	}

We don't care if misc_register fails as the apm module can still do much
good work even if user mode cannot control it.  So the original was
correct.  Maybe a comment here would be good as this patch has been
submitted before.

> =20
>  	if (HZ !=3D 100)
>  		idle_period =3D (idle_period * HZ) / 100;
> @@ -2357,8 +2363,17 @@ #endif
>  		pm_idle  =3D apm_cpu_idle;
>  		set_pm_idle =3D 1;
>  	}
> +=09
> +	return  0;
> =20
> -	return 0;
> +out_thread:
> +	exit_kapmd =3D 1;
> +	while (kapmd_running)
> +		schedule();

So we don't need the above.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Aug_2006_11_04_04_+1000_ZEIS_pYUipwMyhsd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFEz/oLFdBgD/zoJvwRAuljAJ4y8xhX5AtXNDPTRGcMCJnBOx4QBACfTeuG
cfQ+iFkfyMZ2wOoP5OCIadA=
=bnuq
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Aug_2006_11_04_04_+1000_ZEIS_pYUipwMyhsd--

--===============0177309019==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0177309019==--
