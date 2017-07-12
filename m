From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 12 Jul 2017 15:52:47 +0000
Subject: Re: [PATCH] drm/amdgpu: Off by one sanity checks
Message-Id: <CADnq5_OA085hLt7oBB+TnbvTwWsHi+=s8x+Q=JCVfYTK8F0x=Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170711195327.dzwtcsrguzmv3y6t@mwanda>
 <83d7a8d8-4722-afba-11be-2df5e35b8631@amd.com>
In-Reply-To: <83d7a8d8-4722-afba-11be-2df5e35b8631@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tom St Denis <tom.stdenis@amd.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, Monk Liu <Monk.Liu@amd.com>, Xiangliang Yu <Xiangliang.Yu@amd.com>, Andres Rodriguez <andresx7@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Ken Wang <Qingqing.Wang@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>, Hawking Zhang <Hawking.Zhang@amd.com>

On Wed, Jul 12, 2017 at 3:42 AM, Christian König
<christian.koenig@amd.com> wrote:
> Am 11.07.2017 um 21:53 schrieb Dan Carpenter:
>>
>> This is just future proofing code, not something that can be triggered
>> in real life.  We're testing to make sure we don't shift wrap when we
>> do "1ull << i" so "i" has to be in the 0-63 range.  If it's 64 then we
>> have gone too far.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>
> Acked-by: Christian König <christian.koenig@amd.com>
>

Applied.  thanks!

Alex


>
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>> index 3a0b69b09ed6..e63925dffd2a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>> @@ -2425,7 +2425,7 @@ static int gfx_v9_0_kiq_kcq_enable(struct
>> amdgpu_device *adev)
>>                 /* This situation may be hit in the future if a new HW
>>                  * generation exposes more than 64 queues. If so, the
>>                  * definition of queue_mask needs updating */
>> -               if (WARN_ON(i > (sizeof(queue_mask)*8))) {
>> +               if (WARN_ON(i >= (sizeof(queue_mask)*8))) {
>>                         DRM_ERROR("Invalid KCQ enabled: %d\n", i);
>>                         break;
>>                 }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>> index aa5a50f5eac8..85a79829842e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>> @@ -4564,7 +4564,7 @@ static int gfx_v8_0_kiq_kcq_enable(struct
>> amdgpu_device *adev)
>>                 /* This situation may be hit in the future if a new HW
>>                  * generation exposes more than 64 queues. If so, the
>>                  * definition of queue_mask needs updating */
>> -               if (WARN_ON(i > (sizeof(queue_mask)*8))) {
>> +               if (WARN_ON(i >= (sizeof(queue_mask)*8))) {
>>                         DRM_ERROR("Invalid KCQ enabled: %d\n", i);
>>                         break;
>>                 }
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> index 955aa304ff48..0def783889cd 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> @@ -671,7 +671,7 @@ static int set_sched_resources(struct
>> device_queue_manager *dqm)
>>                 /* This situation may be hit in the future if a new HW
>>                  * generation exposes more than 64 queues. If so, the
>>                  * definition of res.queue_mask needs updating */
>> -               if (WARN_ON(i > (sizeof(res.queue_mask)*8))) {
>> +               if (WARN_ON(i >= (sizeof(res.queue_mask)*8))) {
>>                         pr_err("Invalid queue enabled by amdgpu: %d\n",
>> i);
>>                         break;
>>                 }
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
