From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 30 Jan 2004 19:06:09 +0000
Subject: Re: [Kernel-janitors] [REDIFF] Fix warning in drivers/net/pppoe.c
Message-Id: <1075489569.8618.12.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073582302.6115.42.camel@telecentrolivre>
In-Reply-To: <1073582302.6115.42.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Em Sex, 2004-01-30 =E0s 16:20, Matthew Wilcox escreveu:
> On Fri, Jan 30, 2004 at 04:07:59PM -0200, Luiz Fernando Capitulino wrote:
> > this version have the Matthew's hints.
>=20
> Sorry to do this to you ...

 No problems Matthew. :)

> > +#else /* CONFIG_PROC_FS */
> > +static inline int pppoe_proc_init(void) { return 1; }
> >  #endif /* CONFIG_PROC_FS */
>=20
> > +	err =3D pppoe_proc_init();
> > +	if (err) {
> > +		unregister_pppox_proto(PX_PROTO_OE);
> > +		err =3D -ENOMEM;
> > +		goto out;
> > +	}
>=20
> Shouldn't the stub function return 0 (no error)?  Otherwise we'll always
> unregister the protocol.

Oh yes, I made a confusion here.

I thought pppoe_init() jump to 'out_unregister' when !CONFIG_PROC_FS,
so I tryed to follow this rule. I don't know where I saw that.

I'll sleep some hours before rediff this (simple) code again. :)

many thanks,

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
