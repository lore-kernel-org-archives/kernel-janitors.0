From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 May 2020 15:53:50 +0000
Subject: Re: [PATCH][next] drm/amdgpu: remove redundant assignment to variable ret
Message-Id: <CADnq5_PPLtqWPtE9LTEz3j333EyqSQ1Y-0p_7YR=cLAEmu7Now@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200512124806.195856-1-colin.king@canonical.com>
In-Reply-To: <20200512124806.195856-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Tue, May 12, 2020 at 8:48 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initializeed with a value that is never read
> and it is being updated later with a new value. The initialization
> is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index 90610b4f2c75..e9e59bc68c9f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -441,7 +441,7 @@ int amdgpu_xgmi_set_pstate(struct amdgpu_device *adev, int pstate)
>
>  int amdgpu_xgmi_update_topology(struct amdgpu_hive_info *hive, struct amdgpu_device *adev)
>  {
> -       int ret = -EINVAL;
> +       int ret;
>
>         /* Each psp need to set the latest topology */
>         ret = psp_xgmi_set_topology_info(&adev->psp,
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
