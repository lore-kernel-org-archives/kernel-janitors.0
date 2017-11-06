From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 06 Nov 2017 21:30:42 +0000
Subject: Re: [PATCH] drm/amd/display: checking for NULL instead of IS_ERR()
Message-Id: <CADnq5_OhFBvmVzpkhJ8p_FM9i29-5pozmyj9esfFsoPj_pBa8A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171106114340.w6li3f4iltg24bdp@mwanda>
 <823814f1-4133-bffa-fe34-c676a2466d1d@amd.com>
In-Reply-To: <823814f1-4133-bffa-fe34-c676a2466d1d-5C7GfCeVMHo@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Cc: Tom St Denis <tom.stdenis-5C7GfCeVMHo@public.gmane.org>, Andrey Grodzovsky <Andrey.Grodzovsky-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Tony Cheng <Tony.Cheng-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Leo (Sunpeng) Li" <sunpeng.li-5C7GfCeVMHo@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

On Mon, Nov 6, 2017 at 6:51 AM, Christian König
<christian.koenig@amd.com> wrote:
> Am 06.11.2017 um 12:43 schrieb Dan Carpenter:
>>
>> backlight_device_register() never returns NULL, it returns error
>> pointers on error so the check here is wrong.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>
> Acked-by: Christian König <christian.koenig@amd.com>

Applied.  thanks!

Alex

>
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 33a15a1d818c..75f9383f5b9b 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -1296,7 +1296,7 @@ amdgpu_dm_register_backlight_device(struct
>> amdgpu_display_manager *dm)
>>                         &amdgpu_dm_backlight_ops,
>>                         &props);
>>   -     if (NULL == dm->backlight_dev)
>> +       if (IS_ERR(dm->backlight_dev))
>>                 DRM_ERROR("DM: Backlight registration failed!\n");
>>         else
>>                 DRM_DEBUG_DRIVER("DM: Registered Backlight device: %s\n",
>> bl_name);
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
