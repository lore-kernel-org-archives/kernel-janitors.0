From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Sun, 21 Jun 2020 15:33:01 +0000
Subject: Re: [PATCH][next] drm/mm/selftests: fix unsigned comparison with less than zero
Message-Id: <feb9dc72-c6e8-b745-ca90-b4ff7021d7bd@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200617155959.231740-1-colin.king@canonical.com>
In-Reply-To: <20200617155959.231740-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Am 17.06.20 um 17:59 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> Function get_insert_time can return error values that are cast
> to a u64. The checks of insert_time1 and insert_time2 check for
> the errors but because they are u64 variables the check for less
> than zero can never be true. Fix this by casting the value to s64
> to allow of the negative error check to succeed.
>
> Addresses-Coverity: ("Unsigned compared against 0, no effect")
> Fixes: 6e60d5ded06b ("drm/mm: add ig_frag selftest")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Going to pick that up for drm-misc-fixes tomorrow.

> ---
>   drivers/gpu/drm/selftests/test-drm_mm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/se=
lftests/test-drm_mm.c
> index 3846b0f5bae3..671a152a6df2 100644
> --- a/drivers/gpu/drm/selftests/test-drm_mm.c
> +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
> @@ -1124,12 +1124,12 @@ static int igt_frag(void *ignored)
>  =20
>   		insert_time1 =3D get_insert_time(&mm, insert_size,
>   					       nodes + insert_size, mode);
> -		if (insert_time1 < 0)
> +		if ((s64)insert_time1 < 0)
>   			goto err;
>  =20
>   		insert_time2 =3D get_insert_time(&mm, (insert_size * 2),
>   					       nodes + insert_size * 2, mode);
> -		if (insert_time2 < 0)
> +		if ((s64)insert_time2 < 0)
>   			goto err;
>  =20
>   		pr_info("%s fragmented insert of %u and %u insertions took %llu and %=
llu nsecs\n",
