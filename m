From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Mon, 15 Mar 2004 19:41:47 +0000
Subject: Re: [Kernel-janitors] [PATCH] - style fixes for kernel/cpu.c.
Message-Id: <1079379707.28487.54.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1079377456.28138.39.camel@telecentrolivre>
In-Reply-To: <1079377456.28138.39.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Em Seg, 2004-03-15 =E0s 16:39, Matthew Wilcox escreveu:
> On Mon, Mar 15, 2004 at 04:30:56PM -0300, Luiz Fernando Capitulino wrote:
> > Why they are bad ?
> >=20
> > Em Seg, 2004-03-15 =E0s 16:18, Matthew Wilcox escreveu:
> > > > -	if (cpu_online(cpu)) {
> > > > +	ret =3D cpu_online(cpu);
> > > > +	if (ret) {
> > > >  		ret =3D -EINVAL;
> > > >  		goto out;
> > > >  	}
> > > > +
> > >=20
> > > This one is bad.
>=20
> It's bad because the changed form reads worse than the previous one.

 Oh yes, you right... I will rediff.

 thanks,

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
