From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 23 Jan 2004 17:06:46 +0000
Subject: Re: [Kernel-janitors] [PATCH] Fix warning in
Message-Id: <1074877605.5269.10.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi Felipe,

Em Seg, 2004-01-26 =E0s 14:06, Felipe W Damasio escreveu:

> > this patch fixes this warning:
> >=20
> > drivers/ide/pci/triflex.c:49: warning: `triflex_get_info' defined but n=
ot used
> >=20
> > here is:
> >=20
> > diff -X dontdiff -Nru linux-2.6.2-rc2/drivers/ide/pci/triflex.c linux-2=
.6.2-rc2~/drivers/ide/pci/triflex.c
> > --- linux-2.6.2-rc2/drivers/ide/pci/triflex.c	2003-10-08 16:24:04.00000=
0000 -0300
> > +++ linux-2.6.2-rc2~/drivers/ide/pci/triflex.c	2004-01-26 11:02:33.0000=
00000 -0200
> > @@ -45,6 +45,7 @@
> > =20
> >  static struct pci_dev *triflex_dev;
> > =20
> > +#ifdef CONFIG_PROC_FS
> >  static int triflex_get_info(char *buf, char **addr, off_t offset, int =
count)
> >  {
> >  	char *p =3D buf;
> > @@ -91,6 +92,7 @@
> >  =09
> >  	return len > count ? count : len;
> >  }
> > +#endif
>=20
> 	Do we really need this chunk?

 IMHO, yes.

> 	Since triflex_get_info is already #ifdef'd out if CONFIG_PROC_FS is not =

> set, we don't need to put that extra #ifdef on the .c file, since that=20
> function will not get used anyway.

 Is what the warning says. The patch fixes it.

> 	IIRC the policy for adding #ifdefs on .c files is when it's really=20
> necessary, and I don't really see the point for this (expect object size =

> and an extra symbol defined, which I don't think it really hurts here).

 AFAIK, the _real_ problem is when you have #ifdef/#endif inside
functions. I agree that is better to avoid it in .c files, but is not
all the cases that it can be done.

--=20
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
