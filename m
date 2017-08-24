From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Aug 2017 18:26:11 +0000
Subject: Re: [PATCH][drm-next] drm/amdgpu: remove duplicate return statement
Message-Id: <CADnq5_MyECf9zUr6eA2haDri=99usgmTZeV6zTD3TpZe6BnzKQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170823131740.20930-1-colin.king@canonical.com>
 <8045f72d-34d5-473d-ac9b-56495698dc8f@amd.com>
In-Reply-To: <8045f72d-34d5-473d-ac9b-56495698dc8f-5C7GfCeVMHo@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Kuehling <felix.kuehling-5C7GfCeVMHo@public.gmane.org>
Cc: Oded Gabbay <oded.gabbay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Wed, Aug 23, 2017 at 2:24 PM, Felix Kuehling <felix.kuehling@amd.com> wrote:
> I must have added that accidentally when cherry-picking an internal
> patch for upstreaming. Thanks for catching it.
>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

Applied.  thanks!

Alex

>
> Regards,
>   Felix
>
>
> On 2017-08-23 09:17 AM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Remove a redundant identical return statement, it has no use.
>>
>> Detected by CoverityScan, CID#1454586 ("Structurally dead code")
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
>> index fb6e5dbd5a03..309f2419c6d8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
>> @@ -155,7 +155,6 @@ static const struct kfd2kgd_calls kfd2kgd = {
>>  struct kfd2kgd_calls *amdgpu_amdkfd_gfx_8_0_get_functions(void)
>>  {
>>       return (struct kfd2kgd_calls *)&kfd2kgd;
>> -     return (struct kfd2kgd_calls *)&kfd2kgd;
>>  }
>>
>>  static inline struct amdgpu_device *get_amdgpu_device(struct kgd_dev *kgd)
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
