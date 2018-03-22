From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Thu, 22 Mar 2018 15:43:09 +0000
Subject: Re: [PATCH][next] drm/amdgpu: fix spelling mistake: "asssert" -> "assert"
Message-Id: <0ddcfc5a-e15c-5b01-bce3-17d0673bb4fb@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180322154144.31363-1-colin.king@canonical.com>
In-Reply-To: <20180322154144.31363-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Alex Deucher <alexander.deucher@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "monk.liu" <monk.liu@amd.com>

Am 22.03.2018 um 16:41 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fix to spelling mistake in pr_err error message text
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/=
amdgpu/mxgpu_ai.c
> index 8fb933c62cf5..493348672475 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> @@ -129,7 +129,7 @@ static void xgpu_ai_mailbox_trans_msg (struct amdgpu_=
device *adev,
>   		xgpu_ai_mailbox_set_valid(adev, false);
>   		trn =3D xgpu_ai_peek_ack(adev);
>   		if (trn) {
> -			pr_err("trn=3D%x ACK should not asssert! wait again !\n", trn);
> +			pr_err("trn=3D%x ACK should not assert! wait again !\n", trn);
>   			msleep(1);
>   		}
>   	} while(trn);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
