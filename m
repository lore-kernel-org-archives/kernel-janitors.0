From: Mike Rapoport <rppt@linux.ibm.com>
Date: Tue, 04 Dec 2018 07:48:24 +0000
Subject: Re: [PATCH 2/3] mm: move two private functions to static linkage
Message-Id: <20181204074823.GG26700@rapoport-lnx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <466ad4ebe5d788e7be6a14fbbcaaa9596bac7141.1543899764.git.dato@net.com.org.es>
 <75cae66d92a074dbd62590a966d7005b187f4fe5.1543899764.git.dato@net.com.org.es>
In-Reply-To: <75cae66d92a074dbd62590a966d7005b187f4fe5.1543899764.git.dato@net.com.org.es>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Adeodato =?iso-8859-1?Q?Sim=F3?= <dato@net.com.org.es>
Cc: linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Tue, Dec 04, 2018 at 02:14:23AM -0300, Adeodato Sim=F3 wrote:
> follow_page_context() and __thp_get_unmapped_area() have no public
> declarations and are only used in the files that define them (mm/gup.c
> and mm/huge_memory.c, respectively).
>=20
> This change also appeases GCC if run with -Wmissing-prototypes.
>=20
> Signed-off-by: Adeodato Sim=F3 <dato@net.com.org.es>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  mm/gup.c         | 6 +++---
>  mm/huge_memory.c | 5 +++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/mm/gup.c b/mm/gup.c
> index 6dd33e16a806..86a10a9b0344 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -399,9 +399,9 @@ static struct page *follow_p4d_mask(struct vm_area_st=
ruct *vma,
>   * an error pointer if there is a mapping to something not represented
>   * by a page descriptor (see also vm_normal_page()).
>   */
> -struct page *follow_page_mask(struct vm_area_struct *vma,
> -			      unsigned long address, unsigned int flags,
> -			      struct follow_page_context *ctx)
> +static struct page *follow_page_mask(struct vm_area_struct *vma,
> +				     unsigned long address, unsigned int flags,
> +				     struct follow_page_context *ctx)
>  {
>  	pgd_t *pgd;
>  	struct page *page;
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2dba2c1c299a..45c1ff36baf1 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -499,8 +499,9 @@ void prep_transhuge_page(struct page *page)
>  	set_compound_page_dtor(page, TRANSHUGE_PAGE_DTOR);
>  }
>=20
> -unsigned long __thp_get_unmapped_area(struct file *filp, unsigned long l=
en,
> -		loff_t off, unsigned long flags, unsigned long size)
> +static unsigned long __thp_get_unmapped_area(struct file *filp,
> +		unsigned long len, loff_t off, unsigned long flags,
> +		unsigned long size)
>  {
>  	unsigned long addr;
>  	loff_t off_end =3D off + len;
> --=20
> 2.19.2
>=20

--=20
Sincerely yours,
Mike.
