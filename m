From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 Apr 2020 14:15:48 +0000
Subject: Re: [PATCH][next] drm/amdgpu: fix unlocks on error return path
Message-Id: <CADnq5_OXYD0bkLZtfQeL0+B6RrcWjEn2yrAPRANpx0HAtEREEg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200424125640.22656-1-colin.king@canonical.com>
In-Reply-To: <20200424125640.22656-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Fri, Apr 24, 2020 at 8:56 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the error returns paths are unlocking lock kiq->ring_lock
> however it seems this should be dev->gfx.kiq.ring_lock as this
> is the lock that is being locked and unlocked around the ring
> operations.  This looks like a bug, fix it by unlocking the
> correct lock.
>
> [ Note: untested ]
>
> Addresses-Coverity: ("Missing unlock")
> Fixes: 82478876eaac ("drm/amdgpu: protect ring overrun")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

It's the same lock, just accessed via a local pointer.  I'll take the
patch and update the commit message when I apply it to avoid confusion
in the future.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index b120f9160f13..edaa50d850a6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -430,7 +430,7 @@ static int gmc_v10_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
>                 r = amdgpu_fence_emit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
>                 if (r) {
>                         amdgpu_ring_undo(ring);
> -                       spin_unlock(&kiq->ring_lock);
> +                       spin_unlock(&adev->gfx.kiq.ring_lock);
>                         return -ETIME;
>                 }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 0a6026308343..055ecba754ff 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -624,7 +624,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
>                 r = amdgpu_fence_emit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
>                 if (r) {
>                         amdgpu_ring_undo(ring);
> -                       spin_unlock(&kiq->ring_lock);
> +                       spin_unlock(&adev->gfx.kiq.ring_lock);
>                         return -ETIME;
>                 }
>
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
