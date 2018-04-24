From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 24 Apr 2018 09:16:19 +0000
Subject: Re: [PATCH -next] drm/amdkfd: Fix the error return code in kfd_ioctl_unmap_memory_from_gpu()
Message-Id: <CAFCwf13=M4LiNh+VK9aVZv4stnJHZ3=Oe7LT6p2E4=2O9tudkA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522376717-136486-1-git-send-email-weiyongjun1@huawei.com>
 <4aac97a5-4efa-8667-3a87-d6f4182dd1e7@amd.com>
In-Reply-To: <4aac97a5-4efa-8667-3a87-d6f4182dd1e7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Wei Yongjun <weiyongjun1@huawei.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Mon, Apr 2, 2018 at 9:02 PM, Felix Kuehling <felix.kuehling@amd.com> wrote:
> Thanks for catching that. I'd use -ENODEV to match what is done a few
> lines below for peer_pdd. With that fixed, this patch is Reviewed-by:
> Felix Kuehling <Felix.Kuehling@amd.com>
>
> Regards,
>   Felix
>
>
> On 2018-03-29 10:25 PM, Wei Yongjun wrote:
>> Passing NULL pointer to PTR_ERR will result in return value of 0
>> indicating success which is clearly not what it is intended here.
>> This patch returns -EINVAL instead.
>>
>> Fixes: 5ec7e02854b3 ("drm/amdkfd: Add ioctls for GPUVM memory management")
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> ---
>>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> index cd679cf..c32a341 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -1421,7 +1421,7 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
>>
>>       pdd = kfd_get_process_device_data(dev, p);
>>       if (!pdd) {
>> -             err = PTR_ERR(pdd);
>> +             err = -EINVAL;
>>               goto bind_process_to_device_failed;
>>       }
>>
>

Thanks!
Applied to -fixes with the -ENODEV return code

Oded
