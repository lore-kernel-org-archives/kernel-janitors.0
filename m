From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 30 Jan 2004 15:15:56 +0000
Subject: Re: [Kernel-janitors] [REDIFF] Fix warning in drivers/net/pppoe.c
Message-Id: <1075475756.2354.2.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073582302.6115.42.camel@telecentrolivre>
In-Reply-To: <1073582302.6115.42.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi Matthew,

Em Sex, 2004-01-30 =E0s 13:02, Matthew Wilcox escreveu:

> > +static int __init pppoe_proc_init(void)
> > +{
> > +	struct proc_dir_entry *p =3D create_proc_entry("pppoe", S_IRUGO,
> > +						     proc_net);
>=20
> While I normally prefer declaration and initialisation on the same line,
> if you have to split the arguments of the initialisation, better to write=
 it
> like this:
>=20
> 	struct proc_dir_entry *p;
>=20
> 	p =3D create_proc_entry("pppoe", S_IRUGO, proc_net);
> 	if (!p)
> 		return 1;

 Hummm... very better.

> > +static int inline pppoe_proc_init(void) { return 1; }
>=20
> "static inline int" is preferred.

 I was wrong....

 I will rediff and send again.

 More comments ?

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
