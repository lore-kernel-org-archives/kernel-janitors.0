From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Fri, 11 May 2018 20:17:14 +0000
Subject: Re: [PATCH] drm/amdkfd: Integer overflows in ioctl
Message-Id: <CAFCwf11bEc=BF=3M=7gzmA6iDJpG0uJnXS5K5EP2i48XEOaesw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180424133549.GB10167@mwanda>
 <e2b7b3c1-cadb-330f-53a8-57568d4bc877@amd.com>
In-Reply-To: <e2b7b3c1-cadb-330f-53a8-57568d4bc877@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Tue, Apr 24, 2018 at 9:58 PM, Felix Kuehling <felix.kuehling@amd.com> wrote:
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>
> We could probably add a sanity check for n_devices to avoid user mode
> causing excessive memory allocations in the kernel. There is no good
> reason for this to be bigger than the number of GPUs in the system. The
> maximum number of GPUs supported due to device minor limit in DRM is 128.
>
> Regards,
>   Felix
>
>
> On 2018-04-24 09:35 AM, Dan Carpenter wrote:
>> args->n_devices is a u32 that comes from the user.  The multiplication
>> could overflow on 32 bit systems possibly leading to privilege
>> escalation.
>>
>> Fixes: 5ec7e02854b3 ("drm/amdkfd: Add ioctls for GPUVM memory management")
>> Signed-off-by: Dan Carpenter dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> index cd679cf1fd30..ce36e556da38 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -1295,8 +1295,8 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
>>               return -EINVAL;
>>       }
>>
>> -     devices_arr = kmalloc(args->n_devices * sizeof(*devices_arr),
>> -                           GFP_KERNEL);
>> +     devices_arr = kmalloc_array(args->n_devices, sizeof(*devices_arr),
>> +                                 GFP_KERNEL);
>>       if (!devices_arr)
>>               return -ENOMEM;
>>
>> @@ -1404,8 +1404,8 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
>>               return -EINVAL;
>>       }
>>
>> -     devices_arr = kmalloc(args->n_devices * sizeof(*devices_arr),
>> -                           GFP_KERNEL);
>> +     devices_arr = kmalloc_array(args->n_devices, sizeof(*devices_arr),
>> +                                 GFP_KERNEL);
>>       if (!devices_arr)
>>               return -ENOMEM;
>>
>

Thanks!
Patch applied to amdkfd-fixes

Oded
