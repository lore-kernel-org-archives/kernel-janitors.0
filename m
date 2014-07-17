From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Jul 2014 14:58:11 +0000
Subject: Re: [PATCH 1/3] arch/metag/kernel/cachepart.c: fix failure check
Message-Id: <20140717145811.GI25880@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405603586-12515-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405603586-12515-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-metag@vger.kernel.org, james.hogan@imgtec.com

On Thu, Jul 17, 2014 at 04:26:26PM +0300, Andrey Utkin wrote:
> [linux-3.16-rc5/arch/metag/kernel/cachepart.c:102]: (style) Checking if u=
nsigned variable 'thread_cache_size' is less than zero.
>=20
> Source code is
>=20
>         if (thread_cache_size < 0)
>             pr_emerg("Can't read %s cache size\n",
>                  cache_type ? "DCACHE" : "ICACHE");
>=20
> but
>=20
>     unsigned int thread_cache_size;
>=20
> Function get_thread_cache_size returns an error code
> as (unsigned int) -1.
>=20
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80361
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
> ---
>  arch/metag/kernel/cachepart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/metag/kernel/cachepart.c b/arch/metag/kernel/cachepart.c
> index 0a2385f..b137034 100644
> --- a/arch/metag/kernel/cachepart.c
> +++ b/arch/metag/kernel/cachepart.c
> @@ -99,7 +99,7 @@ void check_for_cache_aliasing(int thread_id)
>  	for (cache_type =3D ICACHE; cache_type <=3D DCACHE; cache_type++) {
>  		thread_cache_size >  				get_thread_cache_size(cache_type, thread_id);
> -		if (thread_cache_size < 0)
> +		if (thread_cache_size =3D (unsigned int)-1)

Oh, wow.  Every single variable in this file is an unsigned int.  :P

We should just make this int.  The values of thread_cache_size do not
go that high.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
