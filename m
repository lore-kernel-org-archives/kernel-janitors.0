From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Mon, 15 Mar 2004 19:30:56 +0000
Subject: Re: [Kernel-janitors] [PATCH] - style fixes for kernel/cpu.c.
Message-Id: <1079379056.28138.52.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1079377456.28138.39.camel@telecentrolivre>
In-Reply-To: <1079377456.28138.39.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi Matthew,

Em Seg, 2004-03-15 =E0s 16:18, Matthew Wilcox escreveu:

> > -	if (cpu_online(cpu)) {
> > +	ret =3D cpu_online(cpu);
> > +	if (ret) {
> >  		ret =3D -EINVAL;
> >  		goto out;
> >  	}
> > +
>=20
> This one is bad.
>=20
> > @@ -49,8 +52,9 @@ int __devinit cpu_up(unsigned int cpu)
> > =20
> >  	/* Arch-specific enabling code. */
> >  	ret =3D __cpu_up(cpu);
> > -	if (ret !=3D 0)
> > +	if (ret)
> >  		goto out_notify;
> > +
>=20
> I wouldn't change this one, personally.
>=20
> > @@ -58,7 +62,7 @@ int __devinit cpu_up(unsigned int cpu)
> >  	notifier_call_chain(&cpu_chain, CPU_ONLINE, hcpu);
> > =20
> >  out_notify:
> > -	if (ret !=3D 0)
> > +	if (ret)
> >  		notifier_call_chain(&cpu_chain, CPU_UP_CANCELED, hcpu);
> >  out:
> >  	up(&cpucontrol);
>=20
> This one's a bit dodgy too.

Why they are bad ?

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
