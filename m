From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Tue, 03 Feb 2004 11:45:35 +0000
Subject: Re: [Kernel-janitors] [PATCH] Fix warning
Message-Id: <1075808735.5801.16.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi Adrian,

Em Seg, 2004-02-02 =E0s 20:03, Adrian Bunk escreveu:

> > > 	IIRC the policy for adding #ifdefs on .c files is when it's really=20
> > > necessary, and I don't really see the point for this (expect object s=
ize=20
> > > and an extra symbol defined, which I don't think it really hurts here=
).
> >=20
> >  AFAIK, the _real_ problem is when you have #ifdef/#endif inside
> > functions. I agree that is better to avoid it in .c files, but is not
> > all the cases that it can be done.
>=20
> Let's think about something different:
> CONFIG_PROC_FS=3Dn is _very_ unusual.

Ok.

> It's good that drivers compile and work with CONFIG_PROC_FS=3Dn, and it's=
=20
> also good to remove warnings in code.

Yes.

> But is it really worth uglifying code with #ifdef's to avoid a=20
> completely harmless warning in a very unusual configuration?

 Well, as I said before, I agree that #ifdef's are bad (actually, I
think the real problem is use it inside functions, but I agree it's
bad in .c files too).

 When I did the first patch, people said is ok to do this things,
when there is not other way, of course. I'm doing it.

 But, when Felipe said it were bad, I tryed to think in another way
to make the change. I think the solution is to put things in .h, but
even with it, will be necessary a #ifdef/#endif in *.c files.

 So, as you can see, a help here will be better than "its bad".

thank you,

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
