From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Fri, 15 Dec 2017 12:18:45 +0000
Subject: Re: [PATCH] drm/amd/display: remove redundant null check of array 'data'
Message-Id: <034400d8-22ec-f5fe-a958-6c61e487784a@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171215105343.11372-1-colin.king@canonical.com>
In-Reply-To: <20171215105343.11372-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>, Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Am 15.12.2017 um 11:53 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> The null check on aconnector->base.edid_blob_ptr->data is redundant
> since data is an array and can never be null.  Remove it.
>
> Detected by CoverityScan, CID#1460369 ("Array compared against 0")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ccbf10e3bbb6..c388778dbba3 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2725,8 +2725,7 @@ static void create_eml_sink(struct amdgpu_dm_connec=
tor *aconnector)
>   	};
>   	struct edid *edid;
>  =20
> -	if (!aconnector->base.edid_blob_ptr ||
> -		!aconnector->base.edid_blob_ptr->data) {
> +	if (!aconnector->base.edid_blob_ptr) {
>   		DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n=
",
>   				aconnector->base.name);
>  =20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
