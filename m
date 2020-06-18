From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 18 Jun 2020 14:38:50 +0000
Subject: Re: [PATCH] drm/arm: fix unintentional integer overflow on left shift
Message-Id: <33bcb868-5202-9a59-b4c6-803097cbe620@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200618100400.11464-1-colin.king@canonical.com>
 <20200618121405.GJ159988@e110455-lin.cambridge.arm.com>
 <5d08fbec-75d8-d9a9-af61-e6ab98e77c80@canonical.com>
 <20200618142106.GK159988@e110455-lin.cambridge.arm.com>
 <CAD16O86ebsDkwbnuw2G04YZWfukqxJ=_Tex5OT07icEpfPdQNw@mail.gmail.com>
In-Reply-To: <CAD16O86ebsDkwbnuw2G04YZWfukqxJ=_Tex5OT07icEpfPdQNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Garrit Franke <garritfranke@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On 18/06/2020 15:36, Garrit Franke wrote:
> Hi all, newbie here.
> Can the BIT macro be safely used on other parts of the kernel as well?
> Just using git grep "1 <<" returns a ton of results where bit shifting
> is used the old fashioned way.

The BIT macro casts the 1 it a UL before shifting so it catches these
type of bugs.  use BIT_ULL when the result is assigned to a long long.

Colin

> 
> Am Do., 18. Juni 2020 um 16:23 Uhr schrieb Liviu Dudau <liviu.dudau@arm.com>:
>>
>> On Thu, Jun 18, 2020 at 01:50:34PM +0100, Colin Ian King wrote:
>>> On 18/06/2020 13:14, Liviu Dudau wrote:
>>>> On Thu, Jun 18, 2020 at 11:04:00AM +0100, Colin King wrote:
>>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> Hi Colin,
>>>>
>>>>>
>>>>> Shifting the integer value 1 is evaluated using 32-bit arithmetic
>>>>> and then used in an expression that expects a long value leads to
>>>>> a potential integer overflow.
>>>>
>>>> I'm afraid this explanation makes no sense to me. Do you care to explain better what
>>>> you think the issue is? If the shift is done as 32-bit arithmetic and then promoted
>>>> to long how does the overflow happen?
>>>
>>> The shift is performed using 32 bit signed math and then assigned to an
>>> unsigned 64 bit long. This if the shift is 31 bits then the signed int
>>> conversion of 0x80000000 to unsigned long becomes 0xffffffff80000000.
>>> If the shift is more than 32 bits then result overflows and becomes 0x0.
>>
>> You are right, I've missed the fact that it is signed math. Not very likely that
>> we are going to ever have 30 or more CRTCs in the driver, but Coverity has no
>> way of knowing that.
>>
>> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
>>
>> I will pull this into drm-misc-next today.
>>
>> Best regards,
>> Liviu
>>
>>>
>>> Colin
>>>
>>>>
>>>> Best regards,
>>>> Liviu
>>>>
>>>>> Fix this by using the BIT macro to
>>>>> perform the shift to avoid the overflow.
>>>>>
>>>>> Addresses-Coverity: ("Unintentional integer overflow")
>>>>> Fixes: ad49f8602fe8 ("drm/arm: Add support for Mali Display Processors")
>>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>>> ---
>>>>>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
>>>>> index 37715cc6064e..ab45ac445045 100644
>>>>> --- a/drivers/gpu/drm/arm/malidp_planes.c
>>>>> +++ b/drivers/gpu/drm/arm/malidp_planes.c
>>>>> @@ -928,7 +928,7 @@ int malidp_de_planes_init(struct drm_device *drm)
>>>>>    const struct malidp_hw_regmap *map = &malidp->dev->hw->map;
>>>>>    struct malidp_plane *plane = NULL;
>>>>>    enum drm_plane_type plane_type;
>>>>> -  unsigned long crtcs = 1 << drm->mode_config.num_crtc;
>>>>> +  unsigned long crtcs = BIT(drm->mode_config.num_crtc);
>>>>>    unsigned long flags = DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_180 |
>>>>>                          DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
>>>>>    unsigned int blend_caps = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>>>>> --
>>>>> 2.27.0.rc0
>>>>>
>>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>> --
>> ==========
>> | I would like to |
>> | fix the world,  |
>> | but they're not |
>> | giving me the   |
>>  \ source code!  /
>>   ---------------
>>     ¯\_(ツ)_/¯
