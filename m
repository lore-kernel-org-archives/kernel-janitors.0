From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 01:15:46 +0000
Subject: Re: [PATCH 14/16] memcg: fix sparse warning: Using plain integer as
Message-Id: <154e089b0902261715p3d1a865ep845e0f1345549ebb@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000532.17557.52930.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000532.17557.52930.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

[Added To]

On Sun, Feb 22, 2009 at 1:05 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warning:
> =A0mm/memcontrol.c:1637:32: warning: Using plain integer as NULL pointer
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0mm/memcontrol.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 8e4be9c..09d6650 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -1634,7 +1634,7 @@ static int mem_cgroup_force_empty_list(struct mem_c=
group *mem,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pc =3D list_entry(list->prev, struct page_=
cgroup, lru);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (busy =3D pc) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0list_move(&pc->lru, list);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 busy =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 busy =3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0spin_unlock_irqrestore(&zo=
ne->lru_lock, flags);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
