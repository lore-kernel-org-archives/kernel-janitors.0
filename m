From: Simon Holm =?ISO-8859-1?Q?Th=F8gersen?= <odie@cs.aau.dk>
Date: Mon, 12 May 2008 14:37:29 +0000
Subject: Re: [PATCH 1/6] arch/ia64/kernel: remove null pointer dereference
Message-Id: <1210603050.25310.9.camel@odie.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0805121536370.3694@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0805121536370.3694@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: tony.luck@intel.com, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

man, 12 05 2008 kl. 15:37 +0200, skrev Julia Lawall:
> From: Julia Lawall <julia@diku.dk>
>=20
> If data is NULL, it is not possible to access data->ret.
>=20
> The problem was detected using the following semantic match
> (http://www.emn.fr/x-info/coccinelle/)
>=20
> // <smpl>
> @@
> expression E, E1;
> identifier f;
> statement S1,S2,S3;
> @@
>=20
> * if (E =3D NULL)
> {
>   ... when !=3D if (E =3D NULL) S1 else S2
>       when !=3D E =3D E1
> * E->f
>   ... when any
>   return ...;
> }
> else S3
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>
>=20
> ---
>=20
> diff -u -p a/arch/ia64/kernel/palinfo.c b/arch/ia64/kernel/palinfo.c
> --- a/arch/ia64/kernel/palinfo.c	2008-05-09 16:46:57.000000000 +0200
> +++ b/arch/ia64/kernel/palinfo.c	2008-05-12 08:43:35.000000000 +0200
> @@ -902,7 +902,6 @@ palinfo_smp_call(void *info)
>  	palinfo_smp_data_t *data =3D (palinfo_smp_data_t *)info;
>  	if (data =3D NULL) {
>  		printk(KERN_ERR "palinfo: data pointer is NULL\n");
> -		data->ret =3D 0; /* no output */
>  		return;
>  	}
>  	/* does this actual call */
> --

The whole if block should just be deleted, as info is never NULL. There
is only palinfo_handle_smp as (indirect) user of palinfo_smp_call (by
way of smp_call_function_single) and surely palinfo_smp_call never pass
NULL.


Simon Holm Th=C3=B8gersen

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
