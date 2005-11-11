From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Fri, 11 Nov 2005 23:46:28 +0000
Subject: Re: [KJ] Re: [PATCH 6/9] Cleanup kmem_cache_create()
Message-Id: <a01a16b50511111546k199bbdm7a8212dba2b1c748@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200511110910.38350.ioe-lkml@rameria.de>
In-Reply-To: <200511110910.38350.ioe-lkml@rameria.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 11/11/05, Ingo Oeser <ioe-lkml@rameria.de> wrote:
> On Friday 11 November 2005 01:04, Matthew Dobson wrote:
> I would suggest sth. like
>
> if (size < RED_TONE_LIMIT
>     || fls(size - 1) =3D fls(size - 1 + 3 * BYTES_PER_WORD))
>         flags |=3D SLAB_RED_ZONE | SLAB_STORE_USER
>
>
> Reason: A binary operator in front is a huge hint
>         that this is a continued line.
>
> Just compare when you go to a store next time.
>
>         1
> +       2
> -       3
> *       4
>
> is much more readable then
>
> 1       +
> 2       -
> 3       *
> 4
>
> right?
>
>
> Regards
>
> Ingo Oeser

In a similar way, this is also useful for multi line pipes in shell scripts.
The following is a lame example, but you get the idea...

#!/bin/sh
ls -l /usr/src/linux/Documentation \
| awk '{print $8,$6,$7,$9}' \
| grep 2005 \
| sort

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
