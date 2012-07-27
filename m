From: Bryan Wu <bryan.wu@canonical.com>
Date: Fri, 27 Jul 2012 00:20:11 +0000
Subject: Re: [patch 2/2 -next] LEDS: propagate error codes in blinkm_detect()
Message-Id: <CAK5ve-KsbC3Z7DHfhAJCTTHjLz5q0CRbREnUh_L22SxPRet6zw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120726080025.GB10842@elgon.mountain>
In-Reply-To: <20120726080025.GB10842@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Applied to my for-next. Thanks Dan and Jan-Simon,

-Bryan


On Thu, Jul 26, 2012 at 4:05 PM, Jan-Simon M=F6ller
<jansimon.moeller@gmx.de> wrote:
> Ack'ed.
>
> Regards,
> Jan-Simon
> Am Donnerstag, 26. Juli 2012, 10:00:25 schrieb Dan Carpenter:
>> Use the error codes from the lower levels instead of -ENODEV.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
>> index ae6ad63..f7c3d7f 100644
>> --- a/drivers/leds/leds-blinkm.c
>> +++ b/drivers/leds/leds-blinkm.c
>> @@ -617,11 +617,11 @@ static int blinkm_detect(struct i2c_client *client,
>> struct i2c_board_info *info) /* Step 1: Read BlinkM address back  -
>> cmd_char 'a' */
>>       ret =3D blinkm_write(client, BLM_GET_ADDR, NULL);
>>       if (ret < 0)
>> -             return -ENODEV;
>> +             return ret;
>>       usleep_range(20000, 30000);     /* allow a small delay */
>>       ret =3D blinkm_read(client, BLM_GET_ADDR, tmpargs);
>>       if (ret < 0)
>> -             return -ENODEV;
>> +             return ret;
>>
>>       if (tmpargs[0] !=3D 0x09) {
>>               dev_err(&client->dev, "enodev DEV ADDR =3D 0x%02X\n", tmpa=
rgs[0]);
>



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
