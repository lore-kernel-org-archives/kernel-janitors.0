From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 24 Apr 2018 09:13:35 +0000
Subject: Re: [PATCH -next] drm/amdkfd: Make function kfd_dev_is_large_bar() static
Message-Id: <CAFCwf13NW33eX4T9hYyLJ1Q8Yk+1hdmyfkDTaD2AY=05Ce6VaA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522376727-136554-1-git-send-email-weiyongjun1@huawei.com>
 <623cef28-530e-21af-e90c-64905f5c84b5@amd.com>
In-Reply-To: <623cef28-530e-21af-e90c-64905f5c84b5-5C7GfCeVMHo@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Kuehling <felix.kuehling-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Mon, Apr 2, 2018 at 9:03 PM, Felix Kuehling <felix.kuehling@amd.com> wrote:
> This patch is Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>
>
> On 2018-03-29 10:25 PM, Wei Yongjun wrote:
>> Fixes the following sparse warning:
>>
>> drivers/gpu/drm/amd/amdkfd/kfd_chardev.c:1150:6: warning:
>>  symbol 'kfd_dev_is_large_bar' was not declared. Should it be static?
>>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> ---
>>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> index cd679cf..fb5d997 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -1147,7 +1147,7 @@ static int kfd_ioctl_acquire_vm(struct file *filep, struct kfd_process *p,
>>       return ret;
>>  }
>>
>> -bool kfd_dev_is_large_bar(struct kfd_dev *dev)
>> +static bool kfd_dev_is_large_bar(struct kfd_dev *dev)
>>  {
>>       struct kfd_local_mem_info mem_info;
>>
>
Thanks, already applied the fix from the kbuild robot.
Oded
