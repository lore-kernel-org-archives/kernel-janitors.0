From: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>
Date: Thu, 10 Aug 2017 09:19:50 +0000
Subject: Re: [PATCH] drm/amdgpu: Uninitialized variable in amdgpu_ttm_backend_bind()
Message-Id: <78b974b6-199a-cbf7-b1a5-74e7799be9cc@vodafone.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170809103046.mhj7mhe3qwy5ozvy@mwanda>
 <406505cd-fd17-b87a-0d3f-9adf5376880a@daenzer.net>
 <CADnq5_O_Hpk4X4wR5Be==C9AytXTX9OzB-fLJ_By4M1QLGS9hA@mail.gmail.com>
In-Reply-To: <CADnq5_O_Hpk4X4wR5Be==C9AytXTX9OzB-fLJ_By4M1QLGS9hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alex Deucher <alexdeucher@gmail.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Flora Cui <Flora.Cui@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>

Am 10.08.2017 um 07:34 schrieb Alex Deucher:
> On Wed, Aug 9, 2017 at 10:16 PM, Michel Dänzer <michel@daenzer.net> wrote:
>> On 09/08/17 07:30 PM, Dan Carpenter wrote:
>>> My static checker complains that it's possible for "r" to be
>>> uninitialized.  It used to be set to zero so this returns it to the old
>>> behavior.
>>>
>>> Fixes: 98a7f88ce9a9 ("drm/amdgpu: bind BOs with GTT space allocated directly v2")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index e6f9a54c959d..b5f2a08757d6 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -753,7 +753,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_tt *ttm,
>>>                                   struct ttm_mem_reg *bo_mem)
>>>   {
>>>        struct amdgpu_ttm_tt *gtt = (void*)ttm;
>>> -     int r;
>>> +     int r = 0;
>>>
>>>        if (gtt->userptr) {
>>>                r = amdgpu_ttm_tt_pin_userptr(ttm);
>> Reviewed-by: Michel Dänzer <michel.daenzer@amd.com>
> Applied.  thanks!

For what's worth Reviewed-by: Christian König <christian.koenig@amd.com> 
as well.

Might as well explain some fallout people reported about this patch, 
going to ping them for testing.

Christian.

>
> Alex
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


