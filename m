From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 05 Feb 2004 11:36:05 +0000
Subject: Re: [Kernel-janitors] [REDIFF] Fix warning in drivers/net/pppoe.c
Message-Id: <1075980965.31191.3.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073582302.6115.42.camel@telecentrolivre>
In-Reply-To: <1073582302.6115.42.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Em Qua, 2004-02-04 =E0s 19:58, Francois Romieu escreveu:

> > +	err =3D pppoe_proc_init();
> > +	if (err) {
> > +		unregister_pppox_proto(PX_PROTO_OE);
> > +		err =3D -ENOMEM;
>=20
> -> What about making pppoe_proc_init() return -ENOMEM directly and testing
>    against (err < 0)

hummm.... Looks better, I will rediff again. :)))

Someone do not agree ?

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
