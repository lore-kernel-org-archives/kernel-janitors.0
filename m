From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Dec 2006 00:05:06 +0000
Subject: Re: [KJ] [PATCH] Replace __get_free_pages(...GFP_DMA...) with
Message-Id: <200612210105.07150.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0612201823300.11703@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0612201823300.11703@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Thursday 21 December 2006 00:51, Robert P. J. Day wrote:
> On Thu, 21 Dec 2006, Arnd Bergmann wrote:
> > On Thursday 21 December 2006 00:29, Robert P. J. Day wrote:
> > > --- a/arch/s390/kernel/smp.c
> > > +++ b/arch/s390/kernel/smp.c
> > > @@ -728,8 +728,7 @@ void __init smp_prepare_cpus(unsigned int max_cpu=
s)
> > >
> > > =A0 =A0 =A0 =A0 =A0for_each_possible_cpu(i) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0lowcore_ptr[i] =3D (s=
truct _lowcore *)
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0__get_free_pages(GFP_KERNEL|GFP_DMA,
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sizeof(void*) =3D 8 ? 1 =
: 0);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0__get_dma_pages(GFP_KERNEL, sizeof(void*) =3D 8 ? 1 : 0);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0stack =3D __get_free_=
pages(GFP_KERNEL,ASYNC_ORDER);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (lowcore_ptr[i] =
=3D NULL || stack =3D 0ULL)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0panic("smp_boot_cpus failed to allocate memory\n");
> >
> >
> > Not sure about this one. There is not actually any DMA going on to the
> > lowcore page, it just happens to be required to have a low address,
> > so the change doesn't make the code clearer at all.
>=20
> so what do you suggest?  i'm not completely clear on what you're
> saying here.  are you saying that the GFP_DMA flag is being used as a
> bit of a hack, in that it doesn't really represent DMA but that it
> just "happens" to give the right effect?
>=20
> i can remove that particular change from the patch submission, but
> then i just *know* someone down the road is going to complain that i
> "missed" one.  :-)

good point

> thoughts?

Maybe add a comment like

/*
 * Not actually used for DMA, but needs to be below 2GB as defined
 * by the CPU architecture.
 */

The comment should have been there already, but since you're touching
the code, it would be good to add it now.

	Arnd <><

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
