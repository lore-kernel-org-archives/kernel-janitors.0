From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 20 Dec 2006 23:51:31 +0000
Subject: Re: [KJ] [PATCH] Replace __get_free_pages(...GFP_DMA...) with
Message-Id: <Pine.LNX.4.64.0612201848030.29561@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-682334302-1166658691=:29561"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0612201823300.11703@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0612201823300.11703@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-682334302-1166658691=:29561
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Dec 2006, Arnd Bergmann wrote:

> On Thursday 21 December 2006 00:29, Robert P. J. Day wrote:
> > --- a/arch/s390/kernel/smp.c
> > +++ b/arch/s390/kernel/smp.c
> > @@ -728,8 +728,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> >
> > =A0 =A0 =A0 =A0 =A0for_each_possible_cpu(i) {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0lowcore_ptr[i] =3D (str=
uct _lowcore *)
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0_=
_get_free_pages(GFP_KERNEL|GFP_DMA,
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sizeof(void*) =3D=3D 8 ? 1 =
: 0);
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0_=
_get_dma_pages(GFP_KERNEL, sizeof(void*) =3D=3D 8 ? 1 : 0);
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0stack =3D __get_free_pa=
ges(GFP_KERNEL,ASYNC_ORDER);
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (lowcore_ptr[i] =3D=
=3D NULL || stack =3D=3D 0ULL)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0panic("smp_boot_cpus failed to allocate memory\n");
>
>
> Not sure about this one. There is not actually any DMA going on to the
> lowcore page, it just happens to be required to have a low address,
> so the change doesn't make the code clearer at all.

so what do you suggest?  i'm not completely clear on what you're
saying here.  are you saying that the GFP_DMA flag is being used as a
bit of a hack, in that it doesn't really represent DMA but that it
just "happens" to give the right effect?

i can remove that particular change from the patch submission, but
then i just *know* someone down the road is going to complain that i
"missed" one.  :-)

thoughts?

rday
--8323328-682334302-1166658691=:29561
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--8323328-682334302-1166658691=:29561--
