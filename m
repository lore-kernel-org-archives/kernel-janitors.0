From: Jerome Glisse <jglisse@redhat.com>
Date: Tue, 17 Oct 2017 16:31:49 +0000
Subject: Re: [PATCH] mm/hmm: remove redundant variable align_end
Message-Id: <20171017163148.GC2933@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171017143837.23207-1-colin.king@canonical.com>
In-Reply-To: <20171017143837.23207-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: linux-mm@kvack.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 17, 2017 at 03:38:37PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Variable align_end is assigned a value but it is never read, so
> the variable is redundant and can be removed. Cleans up the clang
> warning: Value stored to 'align_end' is never read
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: J=E9r=F4me Glisse <jglisse@redhat.com>

> ---
>  mm/hmm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/mm/hmm.c b/mm/hmm.c
> index a88a847bccba..ea19742a5d60 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -803,11 +803,10 @@ static RADIX_TREE(hmm_devmem_radix, GFP_KERNEL);
> =20
>  static void hmm_devmem_radix_release(struct resource *resource)
>  {
> -	resource_size_t key, align_start, align_size, align_end;
> +	resource_size_t key, align_start, align_size;
> =20
>  	align_start =3D resource->start & ~(PA_SECTION_SIZE - 1);
>  	align_size =3D ALIGN(resource_size(resource), PA_SECTION_SIZE);
> -	align_end =3D align_start + align_size - 1;
> =20
>  	mutex_lock(&hmm_devmem_lock);
>  	for (key =3D resource->start;
> --=20
> 2.14.1
>=20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
