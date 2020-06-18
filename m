From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 18 Jun 2020 12:50:34 +0000
Subject: Re: [PATCH] drm/arm: fix unintentional integer overflow on left shift
Message-Id: <5d08fbec-75d8-d9a9-af61-e6ab98e77c80@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200618100400.11464-1-colin.king@canonical.com>
 <20200618121405.GJ159988@e110455-lin.cambridge.arm.com>
In-Reply-To: <20200618121405.GJ159988@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On 18/06/2020 13:14, Liviu Dudau wrote:
> On Thu, Jun 18, 2020 at 11:04:00AM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
> 
> Hi Colin,
> 
>>
>> Shifting the integer value 1 is evaluated using 32-bit arithmetic
>> and then used in an expression that expects a long value leads to
>> a potential integer overflow.
> 
> I'm afraid this explanation makes no sense to me. Do you care to explain better what
> you think the issue is? If the shift is done as 32-bit arithmetic and then promoted
> to long how does the overflow happen?

The shift is performed using 32 bit signed math and then assigned to an
unsigned 64 bit long. This if the shift is 31 bits then the signed int
conversion of 0x80000000 to unsigned long becomes 0xffffffff80000000.
If the shift is more than 32 bits then result overflows and becomes 0x0.

Colin

> 
> Best regards,
> Liviu
> 
>> Fix this by using the BIT macro to
>> perform the shift to avoid the overflow.
>>
>> Addresses-Coverity: ("Unintentional integer overflow")
>> Fixes: ad49f8602fe8 ("drm/arm: Add support for Mali Display Processors")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
>> index 37715cc6064e..ab45ac445045 100644
>> --- a/drivers/gpu/drm/arm/malidp_planes.c
>> +++ b/drivers/gpu/drm/arm/malidp_planes.c
>> @@ -928,7 +928,7 @@ int malidp_de_planes_init(struct drm_device *drm)
>>  	const struct malidp_hw_regmap *map = &malidp->dev->hw->map;
>>  	struct malidp_plane *plane = NULL;
>>  	enum drm_plane_type plane_type;
>> -	unsigned long crtcs = 1 << drm->mode_config.num_crtc;
>> +	unsigned long crtcs = BIT(drm->mode_config.num_crtc);
>>  	unsigned long flags = DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_180 |
>>  			      DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
>>  	unsigned int blend_caps = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> -- 
>> 2.27.0.rc0
>>
> 
