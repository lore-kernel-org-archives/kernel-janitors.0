From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2015 21:36:43 +0000
Subject: Re: [PATCH] drm/radeon: constify radeon_asic_ring structures
Message-Id: <CADnq5_NtvVihuzyLWY2mm0NANUo0QMiD5tx220t6xmLJpU6Sbw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448813561-29014-1-git-send-email-Julia.Lawall@lip6.fr>
	<565B4DBB.8090106@amd.com>
In-Reply-To: <565B4DBB.8090106@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Alex Deucher <alexander.deucher@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

On Sun, Nov 29, 2015 at 2:10 PM, Christian König
<christian.koenig@amd.com> wrote:
> On 29.11.2015 17:12, Julia Lawall wrote:
>>
>> The radeon_asic_ring structures are never modified, so declare them as
>> const.
>>
>> Done with the help of Coccinelle.
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
>
> Nice clean, patch is Reviewed-by: Christian König <christian.koenig@amd.com>

Applied.  thanks!

Alex


>
>
>>
>> ---
>>   drivers/gpu/drm/radeon/radeon.h      |    2 -
>>   drivers/gpu/drm/radeon/radeon_asic.c |   38
>> +++++++++++++++++------------------
>>   2 files changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon.h
>> b/drivers/gpu/drm/radeon/radeon.h
>> index b6cbd81..cf09102 100644
>> --- a/drivers/gpu/drm/radeon/radeon.h
>> +++ b/drivers/gpu/drm/radeon/radeon.h
>> @@ -1889,7 +1889,7 @@ struct radeon_asic {
>>                 void (*pad_ib)(struct radeon_ib *ib);
>>         } vm;
>>         /* ring specific callbacks */
>> -       struct radeon_asic_ring *ring[RADEON_NUM_RINGS];
>> +       const struct radeon_asic_ring *ring[RADEON_NUM_RINGS];
>>         /* irqs */
>>         struct {
>>                 int (*set)(struct radeon_device *rdev);
>> diff --git a/drivers/gpu/drm/radeon/radeon_asic.c
>> b/drivers/gpu/drm/radeon/radeon_asic.c
>> index 1d4d452..7d5a36d 100644
>> --- a/drivers/gpu/drm/radeon/radeon_asic.c
>> +++ b/drivers/gpu/drm/radeon/radeon_asic.c
>> @@ -179,7 +179,7 @@ void radeon_agp_disable(struct radeon_device *rdev)
>>    * ASIC
>>    */
>>   -static struct radeon_asic_ring r100_gfx_ring = {
>> +static const struct radeon_asic_ring r100_gfx_ring = {
>>         .ib_execute = &r100_ring_ib_execute,
>>         .emit_fence = &r100_fence_ring_emit,
>>         .emit_semaphore = &r100_semaphore_ring_emit,
>> @@ -329,7 +329,7 @@ static struct radeon_asic r200_asic = {
>>         },
>>   };
>>   -static struct radeon_asic_ring r300_gfx_ring = {
>> +static const struct radeon_asic_ring r300_gfx_ring = {
>>         .ib_execute = &r100_ring_ib_execute,
>>         .emit_fence = &r300_fence_ring_emit,
>>         .emit_semaphore = &r100_semaphore_ring_emit,
>> @@ -343,7 +343,7 @@ static struct radeon_asic_ring r300_gfx_ring = {
>>         .set_wptr = &r100_gfx_set_wptr,
>>   };
>>   -static struct radeon_asic_ring rv515_gfx_ring = {
>> +static const struct radeon_asic_ring rv515_gfx_ring = {
>>         .ib_execute = &r100_ring_ib_execute,
>>         .emit_fence = &r300_fence_ring_emit,
>>         .emit_semaphore = &r100_semaphore_ring_emit,
>> @@ -901,7 +901,7 @@ static struct radeon_asic r520_asic = {
>>         },
>>   };
>>   -static struct radeon_asic_ring r600_gfx_ring = {
>> +static const struct radeon_asic_ring r600_gfx_ring = {
>>         .ib_execute = &r600_ring_ib_execute,
>>         .emit_fence = &r600_fence_ring_emit,
>>         .emit_semaphore = &r600_semaphore_ring_emit,
>> @@ -914,7 +914,7 @@ static struct radeon_asic_ring r600_gfx_ring = {
>>         .set_wptr = &r600_gfx_set_wptr,
>>   };
>>   -static struct radeon_asic_ring r600_dma_ring = {
>> +static const struct radeon_asic_ring r600_dma_ring = {
>>         .ib_execute = &r600_dma_ring_ib_execute,
>>         .emit_fence = &r600_dma_fence_ring_emit,
>>         .emit_semaphore = &r600_dma_semaphore_ring_emit,
>> @@ -999,7 +999,7 @@ static struct radeon_asic r600_asic = {
>>         },
>>   };
>>   -static struct radeon_asic_ring rv6xx_uvd_ring = {
>> +static const struct radeon_asic_ring rv6xx_uvd_ring = {
>>         .ib_execute = &uvd_v1_0_ib_execute,
>>         .emit_fence = &uvd_v1_0_fence_emit,
>>         .emit_semaphore = &uvd_v1_0_semaphore_emit,
>> @@ -1198,7 +1198,7 @@ static struct radeon_asic rs780_asic = {
>>         },
>>   };
>>   -static struct radeon_asic_ring rv770_uvd_ring = {
>> +static const struct radeon_asic_ring rv770_uvd_ring = {
>>         .ib_execute = &uvd_v1_0_ib_execute,
>>         .emit_fence = &uvd_v2_2_fence_emit,
>>         .emit_semaphore = &uvd_v2_2_semaphore_emit,
>> @@ -1305,7 +1305,7 @@ static struct radeon_asic rv770_asic = {
>>         },
>>   };
>>   -static struct radeon_asic_ring evergreen_gfx_ring = {
>> +static const struct radeon_asic_ring evergreen_gfx_ring = {
>>         .ib_execute = &evergreen_ring_ib_execute,
>>         .emit_fence = &r600_fence_ring_emit,
>>         .emit_semaphore = &r600_semaphore_ring_emit,
>> @@ -1318,7 +1318,7 @@ static struct radeon_asic_ring evergreen_gfx_ring >> {
>>         .set_wptr = &r600_gfx_set_wptr,
>>   };
>>   -static struct radeon_asic_ring evergreen_dma_ring = {
>> +static const struct radeon_asic_ring evergreen_dma_ring = {
>>         .ib_execute = &evergreen_dma_ring_ib_execute,
>>         .emit_fence = &evergreen_dma_fence_ring_emit,
>>         .emit_semaphore = &r600_dma_semaphore_ring_emit,
>> @@ -1612,7 +1612,7 @@ static struct radeon_asic btc_asic = {
>>         },
>>   };
>>   -static struct radeon_asic_ring cayman_gfx_ring = {
>> +static const struct radeon_asic_ring cayman_gfx_ring = {
>>         .ib_execute = &cayman_ring_ib_execute,
>>         .ib_parse = &evergreen_ib_parse,
>>         .emit_fence = &cayman_fence_ring_emit,
>> @@ -1627,7 +1627,7 @@ static struct radeon_asic_ring cayman_gfx_ring = {
>>         .set_wptr = &cayman_gfx_set_wptr,
>>   };
>>   -static struct radeon_asic_ring cayman_dma_ring = {
>> +static const struct radeon_asic_ring cayman_dma_ring = {
>>         .ib_execute = &cayman_dma_ring_ib_execute,
>>         .ib_parse = &evergreen_dma_ib_parse,
>>         .emit_fence = &evergreen_dma_fence_ring_emit,
>> @@ -1642,7 +1642,7 @@ static struct radeon_asic_ring cayman_dma_ring = {
>>         .set_wptr = &cayman_dma_set_wptr
>>   };
>>   -static struct radeon_asic_ring cayman_uvd_ring = {
>> +static const struct radeon_asic_ring cayman_uvd_ring = {
>>         .ib_execute = &uvd_v1_0_ib_execute,
>>         .emit_fence = &uvd_v2_2_fence_emit,
>>         .emit_semaphore = &uvd_v3_1_semaphore_emit,
>> @@ -1760,7 +1760,7 @@ static struct radeon_asic cayman_asic = {
>>         },
>>   };
>>   -static struct radeon_asic_ring trinity_vce_ring = {
>> +static const struct radeon_asic_ring trinity_vce_ring = {
>>         .ib_execute = &radeon_vce_ib_execute,
>>         .emit_fence = &radeon_vce_fence_emit,
>>         .emit_semaphore = &radeon_vce_semaphore_emit,
>> @@ -1881,7 +1881,7 @@ static struct radeon_asic trinity_asic = {
>>         },
>>   };
>>   -static struct radeon_asic_ring si_gfx_ring = {
>> +static const struct radeon_asic_ring si_gfx_ring = {
>>         .ib_execute = &si_ring_ib_execute,
>>         .ib_parse = &si_ib_parse,
>>         .emit_fence = &si_fence_ring_emit,
>> @@ -1896,7 +1896,7 @@ static struct radeon_asic_ring si_gfx_ring = {
>>         .set_wptr = &cayman_gfx_set_wptr,
>>   };
>>   -static struct radeon_asic_ring si_dma_ring = {
>> +static const struct radeon_asic_ring si_dma_ring = {
>>         .ib_execute = &cayman_dma_ring_ib_execute,
>>         .ib_parse = &evergreen_dma_ib_parse,
>>         .emit_fence = &evergreen_dma_fence_ring_emit,
>> @@ -2023,7 +2023,7 @@ static struct radeon_asic si_asic = {
>>         },
>>   };
>>   -static struct radeon_asic_ring ci_gfx_ring = {
>> +static const struct radeon_asic_ring ci_gfx_ring = {
>>         .ib_execute = &cik_ring_ib_execute,
>>         .ib_parse = &cik_ib_parse,
>>         .emit_fence = &cik_fence_gfx_ring_emit,
>> @@ -2038,7 +2038,7 @@ static struct radeon_asic_ring ci_gfx_ring = {
>>         .set_wptr = &cik_gfx_set_wptr,
>>   };
>>   -static struct radeon_asic_ring ci_cp_ring = {
>> +static const struct radeon_asic_ring ci_cp_ring = {
>>         .ib_execute = &cik_ring_ib_execute,
>>         .ib_parse = &cik_ib_parse,
>>         .emit_fence = &cik_fence_compute_ring_emit,
>> @@ -2053,7 +2053,7 @@ static struct radeon_asic_ring ci_cp_ring = {
>>         .set_wptr = &cik_compute_set_wptr,
>>   };
>>   -static struct radeon_asic_ring ci_dma_ring = {
>> +static const struct radeon_asic_ring ci_dma_ring = {
>>         .ib_execute = &cik_sdma_ring_ib_execute,
>>         .ib_parse = &cik_ib_parse,
>>         .emit_fence = &cik_sdma_fence_ring_emit,
>> @@ -2068,7 +2068,7 @@ static struct radeon_asic_ring ci_dma_ring = {
>>         .set_wptr = &cik_sdma_set_wptr,
>>   };
>>   -static struct radeon_asic_ring ci_vce_ring = {
>> +static const struct radeon_asic_ring ci_vce_ring = {
>>         .ib_execute = &radeon_vce_ib_execute,
>>         .emit_fence = &radeon_vce_fence_emit,
>>         .emit_semaphore = &radeon_vce_semaphore_emit,
>>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
