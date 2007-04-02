From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 02 Apr 2007 22:27:19 +0000
Subject: Re: [KJ] [PATCH] mm: spelling error in a comment
Message-Id: <20070402152719.e7b622ba.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070402210636.GA14216@tux>
In-Reply-To: <20070402210636.GA14216@tux>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Charles =?ISO-8859-1?Q?Cl=E9ment?= <caratorn@gmail.com>
Cc: kernel-janitors@lists.linux-foundation.org, linux-mm@kvack.org

On Mon, 2 Apr 2007 23:06:36 +0200 Charles Cl=E9ment wrote:

>=20
> Fix spelling in a comment in mm/slab.c.
>=20
> Signed-off-by: Charles Cl=E9ment <caratorn@gmail.com>

Alexey can grab this if he wants to (or Adrian could),
but here's what Andrew Morton has to say about such patches:

http://marc.info/?l=3Dkernel-janitor-discuss&m=117360826232574&w=3D2

"...I prefer not to do spello and grammaro
fixes, unless they're in something user-visible: a printk or documentation.
Simply because there would be no end to it."


> ---
>=20
> Index: linux-2.6.21-rc5/mm/slab.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D> --- linux-2.6.21-rc5.orig/mm/slab.c
> +++ linux-2.6.21-rc5/mm/slab.c
> @@ -451,7 +451,7 @@ struct kmem_cache {
> =20
>  #define BATCHREFILL_LIMIT	16
>  /*
> - * Optimization question: fewer reaps means less probability for unnessa=
ry
> + * Optimization question: fewer reaps means less probability for unneces=
sary
>   * cpucache drain/refill cycles.
>   *
>   * OTOH the cpuarrays can contain lots of objects,
>=20
> --=20
> Charles Cl=E9ment.
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
>=20


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
