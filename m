From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 26 Feb 2004 11:56:35 +0000
Subject: Re: [Kernel-janitors] [PATCH][REDIFF] - proc cleanup for
Message-Id: <1077796595.25685.15.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1077309166.17385.11.camel@telecentrolivre>
In-Reply-To: <1077309166.17385.11.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi Randy,

(Sorry for the delay)

Em Ter, 2004-02-24 =E0s 17:14, Randy.Dunlap escreveu:

> Let me see if I understand this.  This patch isn't to fix a warning,
> but just to move an ifdef/endif block outside of a function (?).

 Yes, and I think it is better written.

> That's OK, but I can't say that I like this particular patch.
> It passes <rtc_gen_dev> to gen_rtc_proc_init() only so that the
> latter can call misc_deregister() in an error case.  Otherwise
> gen_rtc_proc_init() has no use for that parameter.

 Hummm... Good point.

> I'd rather see the calling function stay balanced -- i.e., if
> there's an error, call misc_deregister() there.
>=20
> How's the alternative patch down below look?
>=20
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> // Linux 2.6.3
> // description:	remove ifdef/endif in rtc_generic_init();
>=20
> diffstat:>  drivers/char/genrtc.c |   20 +++++++++++++++-----
>  1 files changed, 15 insertions(+), 5 deletions(-)
>=20
>=20
> diff -Naurp ./drivers/char/genrtc.c~genrtc_proc ./drivers/char/genrtc.c
> --- ./drivers/char/genrtc.c~genrtc_proc	2004-02-17 19:59:28.000000000 -08=
00
> +++ ./drivers/char/genrtc.c	2004-02-24 12:00:06.000000000 -0800
> @@ -466,6 +466,17 @@ static int gen_rtc_read_proc(char *page,
>  	return len;
>  }
> =20
> +static int __init gen_rtc_proc_init(void)
> +{
> +	struct proc_dir_entry *r;
> +
> +	r =3D create_proc_read_entry("driver/rtc", 0, 0, gen_rtc_read_proc, NUL=
L);
> +	if (!r)
> +		return -ENOMEM;
> +	return 0;
> +}
> +#else
> +static inline int gen_rtc_proc_init(void) { return 0; }
>  #endif /* CONFIG_PROC_FS */
> =20
>=20
> @@ -498,15 +509,14 @@ static int __init rtc_generic_init(void)
>  	printk(KERN_INFO "Generic RTC Driver v%s\n", RTC_VERSION);
> =20
>  	retval =3D misc_register(&rtc_gen_dev);
> -	if(retval < 0)
> +	if (retval < 0)
>  		return retval;
> =20
> -#ifdef CONFIG_PROC_FS
> -	if((create_proc_read_entry ("driver/rtc", 0, 0, gen_rtc_read_proc, NULL=
)) =3D NULL){
> +	retval =3D gen_rtc_proc_init();
> +	if (retval) {
>  		misc_deregister(&rtc_gen_dev);
> -		return -ENOMEM;
> +		return retval;
>  	}
> -#endif
> =20
>  	return 0;
>  }

 Very better! :)

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
