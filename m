From: Mike Rapoport <rppt@linux.ibm.com>
Date: Tue, 04 Dec 2018 07:48:49 +0000
Subject: Re: [PATCH 3/3] mm: add missing declaration of memmap_init in linux/mm.h
Message-Id: <20181204074848.GH26700@rapoport-lnx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <466ad4ebe5d788e7be6a14fbbcaaa9596bac7141.1543899764.git.dato@net.com.org.es>
 <fccff943020c51f2319b673dd9e5720672e64a6e.1543899764.git.dato@net.com.org.es>
In-Reply-To: <fccff943020c51f2319b673dd9e5720672e64a6e.1543899764.git.dato@net.com.org.es>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Adeodato =?iso-8859-1?Q?Sim=F3?= <dato@net.com.org.es>
Cc: linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Tue, Dec 04, 2018 at 02:14:24AM -0300, Adeodato Sim=F3 wrote:
> This follows-up commit dfb3ccd00a06 ("mm: make memmap_init a proper
> function"), which changed memmap_init from macro to function.
>=20
> Signed-off-by: Adeodato Sim=F3 <dato@net.com.org.es>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
> scripts/checkpatch.pl complained about use of extern for a prototype,
> but I preferred to maintain consistency with surrounding code. -d
>=20
>  include/linux/mm.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 3eb3bf7774f1..8597b864dd91 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2268,6 +2268,8 @@ static inline void zero_resv_unavail(void) {}
>  #endif
>=20
>  extern void set_dma_reserve(unsigned long new_dma_reserve);
> +extern void memmap_init(unsigned long size, int nid,
> +			unsigned long zone, unsigned long start_pfn);
>  extern void memmap_init_zone(unsigned long, int, unsigned long, unsigned=
 long,
>  		enum memmap_context, struct vmem_altmap *);
>  extern void setup_per_zone_wmarks(void);
> --=20
> 2.19.2
>=20

--=20
Sincerely yours,
Mike.
