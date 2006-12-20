From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Dec 2006 23:50:03 +0000
Subject: Re: [KJ] [PATCH] Replace __get_free_pages(...GFP_DMA...) with
Message-Id: <200612210050.04415.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0612201823300.11703@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0612201823300.11703@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Thursday 21 December 2006 00:29, Robert P. J. Day wrote:> --- a/arch/s39=
0/kernel/smp.c> +++ b/arch/s390/kernel/smp.c> @@ -728,8 +728,7 @@ void __in=
it smp_prepare_cpus(unsigned int max_cpus)> > =A0 =A0 =A0 =A0 =A0for_each_p=
ossible_cpu(i) {> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0lowcore_p=
tr[i] =3D (struct _lowcore *)> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0__get_free_pages(GFP_KERNEL|GFP_DMA,> -=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sizeof(void*) =3D 8 ? 1 : 0);> +=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0__get_dma_pages=
(GFP_KERNEL, sizeof(void*) =3D 8 ? 1 : 0);> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0stack =3D __get_free_pages(GFP_KERNEL,ASYNC_ORDER);> =A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (lowcore_ptr[i] =3D NULL ||=
 stack =3D 0ULL)> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0panic("smp_boot_cpus failed to allocate memory\n");

Not sure about this one. There is not actually any DMA going on to thelowco=
re page, it just happens to be required to have a low address,so the change=
 doesn't make the code clearer at all.
The other s390 changes look right to me.
	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
