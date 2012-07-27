From: Bryan Wu <bryan.wu@canonical.com>
Date: Fri, 27 Jul 2012 00:19:58 +0000
Subject: Re: [patch 1/2 -next] LEDS: memory leak in blinkm_led_common_set()
Message-Id: <CAK5ve-KWGm2M9MqbQEsNivEcOTg63chVMva+mBqFc5tEJHHQ_w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120726075951.GA10842@elgon.mountain>
In-Reply-To: <20120726075951.GA10842@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Applied to my for-next. Thanks Dan and Jan-Simon,

-Bryan

On Thu, Jul 26, 2012 at 4:03 PM, Jan-Simon M=F6ller
<jansimon.moeller@gmx.de> wrote:
> Ack'ed!
>
> Thanks, Dan!
>
> Regards,
> Jan-Simon
> Am Donnerstag, 26. Juli 2012, 09:59:51 schrieb Dan Carpenter:
>> This can return without freeing the bl_work struct.  Also there was no
>> check for allocation failure.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
>> index 5a9df43..ae6ad63 100644
>> --- a/drivers/leds/leds-blinkm.c
>> +++ b/drivers/leds/leds-blinkm.c
>> @@ -468,8 +468,7 @@ static int blinkm_led_common_set(struct led_classdev
>> *led_cdev, /* led_brightness is 0, 127 or 255 - we just use it here as-is
>> */ struct blinkm_led *led =3D cdev_to_blmled(led_cdev);
>>       struct blinkm_data *data =3D i2c_get_clientdata(led->i2c_client);
>> -     struct blinkm_work *bl_work =3D kzalloc(sizeof(struct blinkm_work),
>> -                                           GFP_ATOMIC);
>> +     struct blinkm_work *bl_work;
>>
>>       switch (color) {
>>       case RED:
>> @@ -511,6 +510,10 @@ static int blinkm_led_common_set(struct led_classdev
>> *led_cdev, return -EINVAL;
>>       }
>>
>> +     bl_work =3D kzalloc(sizeof(*bl_work), GFP_ATOMIC);
>> +     if (!bl_work)
>> +             return -ENOMEM;
>> +
>>       atomic_inc(&led->active);
>>       dev_dbg(&led->i2c_client->dev,
>>                       "#TO_SCHED# next_red =3D %d, next_green =3D %d,"
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Bryan Wu <bryan.wu@canonical.com>
Kernel Developer    +86.186-168-78255 Mobile
Canonical Ltd.      www.canonical.com
Ubuntu - Linux for human beings | www.ubuntu.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
