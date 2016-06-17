From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Jun 2016 16:34:36 +0000
Subject: Re: [patch v2] drm/amdgpu: missing bounds check in amdgpu_set_pp_force_state()
Message-Id: <CADnq5_MiX4DkzrJiZnhknos8PMgWz0cqBm7nmWs1jPp3pxRaSQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160616083023.GA7046@mwanda> <576265CE.1070809@amd.com>
In-Reply-To: <576265CE.1070809@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Geliang Tang <geliangtang@163.com>, Eric Huang <JinHuiEric.Huang@amd.com>, Rex Zhu <Rex.Zhu@amd.com>

On Thu, Jun 16, 2016 at 4:39 AM, Christian König
<christian.koenig@amd.com> wrote:
> Am 16.06.2016 um 10:30 schrieb Dan Carpenter:
>>
>> There is no limit on high "idx" can go.  It should be less than
>> ARRAY_SIZE(data.states) which is 16.
>>
>> The "data" variable wasn't declared in that scope so I shifted the code
>> around a bit to make it work.  Also I made "idx" unsigned.
>>
>> Fixes: f3898ea12fc1 ('drm/amd/powerplay: add some sysfs interfaces for
>> powerplay.')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>
> Acked-by: Christian König <christian.koenig@amd.com>.
>

Applied.  thanks!

Alex

>
>> ---
>> v2: make idx unsigned
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>> index 589b36e..0e13d80 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>> @@ -270,30 +270,28 @@ static ssize_t amdgpu_set_pp_force_state(struct
>> device *dev,
>>         struct drm_device *ddev = dev_get_drvdata(dev);
>>         struct amdgpu_device *adev = ddev->dev_private;
>>         enum amd_pm_state_type state = 0;
>> -       long idx;
>> +       unsigned long idx;
>>         int ret;
>>         if (strlen(buf) = 1)
>>                 adev->pp_force_state_enabled = false;
>> -       else {
>> -               ret = kstrtol(buf, 0, &idx);
>> +       else if (adev->pp_enabled) {
>> +               struct pp_states_info data;
>>   -             if (ret) {
>> +               ret = kstrtoul(buf, 0, &idx);
>> +               if (ret || idx >= ARRAY_SIZE(data.states)) {
>>                         count = -EINVAL;
>>                         goto fail;
>>                 }
>>   -             if (adev->pp_enabled) {
>> -                       struct pp_states_info data;
>> -                       amdgpu_dpm_get_pp_num_states(adev, &data);
>> -                       state = data.states[idx];
>> -                       /* only set user selected power states */
>> -                       if (state != POWER_STATE_TYPE_INTERNAL_BOOT &&
>> -                               state != POWER_STATE_TYPE_DEFAULT) {
>> -                               amdgpu_dpm_dispatch_task(adev,
>> -
>> AMD_PP_EVENT_ENABLE_USER_STATE, &state, NULL);
>> -                               adev->pp_force_state_enabled = true;
>> -                       }
>> +               amdgpu_dpm_get_pp_num_states(adev, &data);
>> +               state = data.states[idx];
>> +               /* only set user selected power states */
>> +               if (state != POWER_STATE_TYPE_INTERNAL_BOOT &&
>> +                   state != POWER_STATE_TYPE_DEFAULT) {
>> +                       amdgpu_dpm_dispatch_task(adev,
>> +                                       AMD_PP_EVENT_ENABLE_USER_STATE,
>> &state, NULL);
>> +                       adev->pp_force_state_enabled = true;
>>                 }
>>         }
>>   fail:
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
