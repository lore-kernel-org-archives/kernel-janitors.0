From: Oleksandr Andrushchenko <andr2000@gmail.com>
Date: Tue, 08 May 2018 11:50:57 +0000
Subject: Re: [PATCH 1/3] drm/xen-front: checking for NULL instead of IS_ERR
Message-Id: <1d60df53-8c37-0830-951c-ec0b34b5af53@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180508092650.GA661@mwanda>
 <0d0ce12b-5dbc-dc36-b57b-6d93e98f3f04@gmail.com>
In-Reply-To: <0d0ce12b-5dbc-dc36-b57b-6d93e98f3f04@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org

On 05/08/2018 12:34 PM, Oleksandr Andrushchenko wrote:
> On 05/08/2018 12:26 PM, Dan Carpenter wrote:
>> drm_dev_alloc() returns error pointers, it never returns NULL.
>>
>> Fixes: c575b7eeb89f ("drm/xen-front: Add support for Xen PV display 
>> frontend")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Thank you,
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Applied to drm-misc-next,
Thank you
>>
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c 
>> b/drivers/gpu/drm/xen/xen_drm_front.c
>> index 1b0ea9ac330e..8615e8522c7a 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front.c
>> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
>> @@ -543,8 +543,8 @@ static int xen_drm_drv_init(struct 
>> xen_drm_front_info *front_info)
>>       front_info->drm_info = drm_info;
>>         drm_dev = drm_dev_alloc(&xen_drm_driver, dev);
>> -    if (!drm_dev) {
>> -        ret = -ENOMEM;
>> +    if (IS_ERR(drm_dev)) {
>> +        ret = PTR_ERR(drm_dev);
>>           goto fail;
>>       }
>>   _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

