From: Joe Perches <joe@perches.com>
Date: Thu, 18 Jan 2018 15:14:06 +0000
Subject: Re: [PATCH-next] MEMCG: memcontrol: make local symbol static
Message-Id: <1516288446.14023.0.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180118150805.18521-1-chrisadr@gentoo.org>
In-Reply-To: <20180118150805.18521-1-chrisadr@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christopher =?ISO-8859-1?Q?D=EDaz?= Riveros <chrisadr@gentoo.org>, hannes@cmpxchg.org, mhocko@kernel.org, vdavydov.dev@gmail.com
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2018-01-18 at 10:08 -0500, Christopher D=EDaz Riveros wrote:
> Fixes the following sparse warning:
>=20
> mm/memcontrol.c:1097:14: warning:
>   symbol 'memcg1_stats' was not declared. Should it be static?
>=20
> Signed-off-by: Christopher D=EDaz Riveros <chrisadr@gentoo.org>
> ---
>  mm/memcontrol.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
[]
> @@ -1094,7 +1094,7 @@ static bool mem_cgroup_wait_acct_move(struct mem_cg=
roup *memcg)
>  	return false;
>  }
> =20
> -unsigned int memcg1_stats[] =3D {
> +static unsigned int memcg1_stats[] =3D {

This should almost certainly be static const

>  	MEMCG_CACHE,
>  	MEMCG_RSS,
>  	MEMCG_RSS_HUGE,
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
