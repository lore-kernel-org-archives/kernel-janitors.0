From: Oleksandr Andrushchenko <andr2000@gmail.com>
Date: Tue, 08 May 2018 11:49:22 +0000
Subject: Re: [PATCH 3/3] drm/xen-front: Fix loop timeout
Message-Id: <5cf5883a-9fd2-6ccf-b2a3-28dc928a9d69@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180508092829.GC661@mwanda>
 <46af16e5-4b59-6071-9f78-95fd4d46f5ed@gmail.com>
In-Reply-To: <46af16e5-4b59-6071-9f78-95fd4d46f5ed@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org

On 05/08/2018 12:37 PM, Oleksandr Andrushchenko wrote:
> On 05/08/2018 12:28 PM, Dan Carpenter wrote:
>> If the loop times out then we want to exit with "to" set to zero, but in
>> the current code it's set to -1.
>>
>> Fixes: c575b7eeb89f ("drm/xen-front: Add support for Xen PV display 
>> frontend")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Thank you,
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Applied to drm-misc-next,
Thank you
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c 
>> b/drivers/gpu/drm/xen/xen_drm_front.c
>> index 378cb7ce0db5..3345ac71b391 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front.c
>> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
>> @@ -778,7 +778,7 @@ static int xen_drv_remove(struct xenbus_device *dev)
>>        */
>>       while ((xenbus_read_unsigned(front_info->xb_dev->otherend, 
>> "state",
>>                        XenbusStateUnknown) != XenbusStateInitWait) &&
>> -                     to--)
>> +                     --to)
>>           msleep(10);
>>         if (!to) {
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

