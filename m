From: Adrian Bunk <bunk@fs.tum.de>
Date: Mon, 02 Feb 2004 22:03:25 +0000
Subject: Re: [Kernel-janitors] [PATCH] Fix warning indrivers/ide/pci/triflex.c
Message-Id: <20040202220324.GB4443@fs.tum.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1074874158.5269.3.camel@telecentrolivre>
In-Reply-To: <1074874158.5269.3.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, Jan 23, 2004 at 03:06:46PM -0200, Luiz Fernando Capitulino wrote:
>...
> Em Seg, 2004-01-26 =E0s 14:06, Felipe W Damasio escreveu:
>...
> > 	IIRC the policy for adding #ifdefs on .c files is when it's really=20
> > necessary, and I don't really see the point for this (expect object siz=
e=20
> > and an extra symbol defined, which I don't think it really hurts here).
>=20
>  AFAIK, the _real_ problem is when you have #ifdef/#endif inside
> functions. I agree that is better to avoid it in .c files, but is not
> all the cases that it can be done.

Let's think about something different:
CONFIG_PROC_FS=3Dn is _very_ unusual.

It's good that drivers compile and work with CONFIG_PROC_FS=3Dn, and it's=20
also good to remove warnings in code.

But is it really worth uglifying code with #ifdef's to avoid a=20
completely harmless warning in a very unusual configuration?

> Luiz Fernando N. Capitulino

cu
Adrian

--=20

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
