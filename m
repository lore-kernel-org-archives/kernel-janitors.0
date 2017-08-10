From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Aug 2017 05:34:54 +0000
Subject: Re: [PATCH] drm/amdgpu: Uninitialized variable in amdgpu_ttm_backend_bind()
Message-Id: <CADnq5_O_Hpk4X4wR5Be==C9AytXTX9OzB-fLJ_By4M1QLGS9hA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170809103046.mhj7mhe3qwy5ozvy@mwanda>
 <406505cd-fd17-b87a-0d3f-9adf5376880a@daenzer.net>
In-Reply-To: <406505cd-fd17-b87a-0d3f-9adf5376880a-otUistvHUpPR7s880joybQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>
Cc: Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Felix Kuehling <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Flora Cui <Flora.Cui-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

On Wed, Aug 9, 2017 at 10:16 PM, Michel Dänzer <michel@daenzer.net> wrote:
> On 09/08/17 07:30 PM, Dan Carpenter wrote:
>> My static checker complains that it's possible for "r" to be
>> uninitialized.  It used to be set to zero so this returns it to the old
>> behavior.
>>
>> Fixes: 98a7f88ce9a9 ("drm/amdgpu: bind BOs with GTT space allocated directly v2")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index e6f9a54c959d..b5f2a08757d6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -753,7 +753,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_tt *ttm,
>>                                  struct ttm_mem_reg *bo_mem)
>>  {
>>       struct amdgpu_ttm_tt *gtt = (void*)ttm;
>> -     int r;
>> +     int r = 0;
>>
>>       if (gtt->userptr) {
>>               r = amdgpu_ttm_tt_pin_userptr(ttm);
>
> Reviewed-by: Michel Dänzer <michel.daenzer@amd.com>

Applied.  thanks!

Alex
