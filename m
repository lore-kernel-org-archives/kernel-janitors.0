From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Oct 2017 16:28:17 +0000
Subject: Re: [PATCH][drm-next] drm/amdgpu: make function uvd_v6_0_enc_get_destroy_msg static
Message-Id: <CADnq5_MzW8_=OyYGvH7xQQKLu-00Pi9mCH3SuiVP2+QxVDymXg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171011092111.16842-1-colin.king@canonical.com>
 <169aed1d-f068-9ae1-1de0-eb14afae3991@gmail.com>
In-Reply-To: <169aed1d-f068-9ae1-1de0-eb14afae3991-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christian Koenig <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ken Wang <Qingqing.Wang-5C7GfCeVMHo@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, James Zhu <James.Zhu-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>

On Wed, Oct 11, 2017 at 6:41 AM, Christian König
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 11.10.2017 um 11:21 schrieb Colin King:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The function uvd_v6_0_enc_get_destroy_msg is local to the source and
>> does not need to be in global scope, so make it static.
>>
>> Cleans up sparse warning:
>> symbol 'uvd_v6_0_enc_get_destroy_msg' was not declared. Should it be
>> static?
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>

Applied.  thanks!

Alex

>> ---
>>   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> index 60af7310a234..71299c67c517 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> @@ -268,8 +268,9 @@ static int uvd_v6_0_enc_get_create_msg(struct
>> amdgpu_ring *ring, uint32_t handle
>>    *
>>    * Close up a stream for HW test or if userspace failed to do so
>>    */
>> -int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t
>> handle,
>> -                                bool direct, struct dma_fence **fence)
>> +static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
>> +                                       uint32_t handle,
>> +                                       bool direct, struct dma_fence
>> **fence)
>>   {
>>         const unsigned ib_size_dw = 16;
>>         struct amdgpu_job *job;
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
