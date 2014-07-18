From: James Hogan <james.hogan@imgtec.com>
Date: Fri, 18 Jul 2014 09:45:33 +0000
Subject: Re: [PATCH] arch/metag/kernel/cachepart.c: fix failure check
Message-Id: <53C8ECBD.5080700@imgtec.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140717145811.GI25880@mwanda> <1405612686-3554-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405612686-3554-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-metag@vger.kernel.org
Cc: dan.carpenter@oracle.com

On 17/07/14 16:58, Andrey Utkin wrote:
> [linux-3.16-rc5/arch/metag/kernel/cachepart.c:102]: (style) Checking if
> unsigned variable 'thread_cache_size' is less than zero.
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
> Changed get_thread_cache_size() to return signed int, and its result is s=
tored
> into signed int variable.
>=20
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80361
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>

Thanks, applied!

Cheers
James

> ---
>  arch/metag/kernel/cachepart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/metag/kernel/cachepart.c b/arch/metag/kernel/cachepart.c
> index 0a2385f..04b7d4f 100644
> --- a/arch/metag/kernel/cachepart.c
> +++ b/arch/metag/kernel/cachepart.c
> @@ -55,7 +55,7 @@ unsigned int get_global_icache_size(void)
>  	return (get_icache_size() * ((temp >> SYSC_xCPARTG_AND_S) + 1)) >> 4;
>  }
> =20
> -static unsigned int get_thread_cache_size(unsigned int cache, int thread=
_id)
> +static int get_thread_cache_size(unsigned int cache, int thread_id)
>  {
>  	unsigned int cache_size;
>  	unsigned int t_cache_part;
> @@ -94,7 +94,7 @@ static unsigned int get_thread_cache_size(unsigned int =
cache, int thread_id)
> =20
>  void check_for_cache_aliasing(int thread_id)
>  {
> -	unsigned int thread_cache_size;
> +	int thread_cache_size;
>  	unsigned int cache_type;
>  	for (cache_type =3D ICACHE; cache_type <=3D DCACHE; cache_type++) {
>  		thread_cache_size >=20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
