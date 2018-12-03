From: Jerome Glisse <jglisse@redhat.com>
Date: Mon, 03 Dec 2018 00:48:49 +0000
Subject: Re: [PATCH -next] mm/hmm: remove set but not used variable 'devmem'
Message-Id: <20181203004848.GA21092@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543629971-128377-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543629971-128377-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: YueHaibing <yuehaibing@huawei.com>
Cc: akpm@linux-foundation.org, sfr@canb.auug.org.au, dan.j.williams@intel.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Dec 01, 2018 at 02:06:11AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> mm/hmm.c: In function 'hmm_devmem_ref_kill':
> mm/hmm.c:995:21: warning:
>  variable 'devmem' set but not used [-Wunused-but-set-variable]
>=20
> It not used any more since commit 35d39f953d4e ("mm, hmm: replace
> hmm_devmem_pages_create() with devm_memremap_pages()")
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: J=E9r=F4me Glisse <jglisse@redhat.com>

> ---
>  mm/hmm.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 50fbaf8..361f370 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -992,9 +992,6 @@ static void hmm_devmem_ref_exit(void *data)
> =20
>  static void hmm_devmem_ref_kill(struct percpu_ref *ref)
>  {
> -	struct hmm_devmem *devmem;
> -
> -	devmem =3D container_of(ref, struct hmm_devmem, ref);
>  	percpu_ref_kill(ref);
>  }
>=20
>=20
>=20
