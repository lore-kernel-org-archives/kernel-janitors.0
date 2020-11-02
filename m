From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 02 Nov 2020 19:00:14 +0000
Subject: Re: [PATCH][next] drm/amdgpu: fix spelling mistake: "Successed" -> "Succeeded"
Message-Id: <CADnq5_NJ=X1A+R5rHCvLZAXWpAL-3YiN_ksrzY8Kjuaoj1ybeg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201102141654.699468-1-colin.king@canonical.com>
In-Reply-To: <20201102141654.699468-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

Applied.  Thanks!

Alex

On Mon, Nov 2, 2020 at 9:17 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a deb_dbg message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 28a5c0d21b71..c99c2180785f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -296,7 +296,7 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
>                 if (drm_mm_reserve_node(mm, &rsv->mm_node))
>                         continue;
>
> -               dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Successed\n",
> +               dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
>                         rsv->mm_node.start, rsv->mm_node.size);
>
>                 vis_usage = amdgpu_vram_mgr_vis_size(adev, &rsv->mm_node);
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
