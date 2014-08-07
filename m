From: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Date: Thu, 07 Aug 2014 15:33:55 +0000
Subject: Re: [patch] drm/radeon: add a check for allocation failure
Message-Id: <53E39C63.1080102@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140807152736.GA10299@mwanda>
 <CADnq5_Mxw=ZY-7cxj440Df6PG4bFDNBvX=v70i4CR5O-277bJw@mail.gmail.com>
In-Reply-To: <CADnq5_Mxw=ZY-7cxj440Df6PG4bFDNBvX=v70i4CR5O-277bJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexdeucher@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

I'm 100% sure that I've fixed that as well with a follow up patch. Looks 
like that one didn't made it into 3.17

Christian.

Am 07.08.2014 um 17:31 schrieb Alex Deucher:
> On Thu, Aug 7, 2014 at 11:27 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> We can easily return -ENOMEM here if kzalloc() fails.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
>> index ccae4d9..d15d987 100644
>> --- a/drivers/gpu/drm/radeon/radeon_vm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_vm.c
>> @@ -483,6 +483,8 @@ int radeon_vm_bo_set_addr(struct radeon_device *rdev,
>>                          /* add a clone of the bo_va to clear the old address */
>>                          struct radeon_bo_va *tmp;
>>                          tmp = kzalloc(sizeof(struct radeon_bo_va), GFP_KERNEL);
>> +                       if (!tmp)
>> +                               return -ENOMEM;
> We need to drop the lock here too.  I'll apply and fix it up.  Thanks!
>
> Alex
>
>>                          tmp->it.start = bo_va->it.start;
>>                          tmp->it.last = bo_va->it.last;
>>                          tmp->vm = vm;
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel

