From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 20 Feb 2004 12:08:53 +0000
Subject: Re: [Kernel-janitors] [PATCH][RFC] - proc cleanup for
Message-Id: <1077278933.10792.18.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1077194142.3626.6.camel@telecentrolivre>
In-Reply-To: <1077194142.3626.6.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Bonjour mon ami,

Em Qui, 2004-02-19 =E0s 19:26, Francois Romieu escreveu:
> Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br> :
> [...]
> > @@ -501,12 +514,9 @@
> >  	if(retval < 0)
> >  		return retval;
> > =20
> > -#ifdef CONFIG_PROC_FS
> > -	if((create_proc_read_entry ("driver/rtc", 0, 0, gen_rtc_read_proc, NU=
LL)) =3D NULL){
> > -		misc_deregister(&rtc_gen_dev);
> > -		return -ENOMEM;
> > -	}
> > -#endif
> > +	retval =3D gen_rtc_proc_init(&rtc_gen_dev);
> > +	if(retval < 0)
> > +		return retval;
>=20
> You do not need to test retval: simply return it.

 Wow, I didn't noticed this. :-)

 I will rediff.

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
