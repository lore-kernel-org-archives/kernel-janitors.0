From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Sun, 18 Mar 2012 16:16:53 +0000
Subject: Re: [PATCH] [media] staging: use mutex_lock() in s2250_probe().
Message-Id: <CAOD=uF52G=csMXQMoL7dGPdTv16S9WKsfqpooA+y=ha9RNib1w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1332005817-10762-1-git-send-email-santoshprasadnayak@gmail.com>
	<4F65F476.70002@bfs.de>
In-Reply-To: <4F65F476.70002@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: wharms@bfs.de
Cc: mchehab@infradead.org, oliver@neukum.org, gregkh@linuxfoundation.org, khoroshilov@ispras.ru, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Mar 18, 2012 at 8:13 PM, walter harms <wharms@bfs.de> wrote:
>
>
> Am 17.03.2012 18:36, schrieb santosh nayak:
>> From: Santosh Nayak <santoshprasadnayak@gmail.com>
>>
>> Use uninterruptable sleep lock =A0'mutex_lock()' =A0in place of
>> mutex_lock_interruptible() because there is no userspace
>> for s2250_probe().
>>
>> Return -ENOMEM =A0 if kzalloc() fails to allocate and initialize.
>>
>> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
>> ---
>> =A0drivers/staging/media/go7007/s2250-board.c | =A0 43 +++++++++++++++--=
----------
>> =A01 files changed, 24 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/staging/media/go7007/s2250-board.c b/drivers/stagin=
g/media/go7007/s2250-board.c
>> index 014d384..1406a37 100644
>> --- a/drivers/staging/media/go7007/s2250-board.c
>> +++ b/drivers/staging/media/go7007/s2250-board.c
>> @@ -637,27 +637,32 @@ static int s2250_probe(struct i2c_client *client,
>> =A0 =A0 =A0 state->audio_input =3D 0;
>> =A0 =A0 =A0 write_reg(client, 0x08, 0x02); /* Line In */
>>
>> - =A0 =A0 if (mutex_lock_interruptible(&usb->i2c_lock) =3D 0) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 data =3D kzalloc(16, GFP_KERNEL);
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (data !=3D NULL) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int rc;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rc =3D go7007_usb_vendor_reque=
st(go, 0x41, 0, 0,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data, 16, 1);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (rc > 0) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u8 mask;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data[0] =3D 0;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1<<5;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data[0] &=3D ~=
mask;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data[1] |=3D m=
ask;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 go7007_usb_ven=
dor_request(go, 0x40, 0,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (data[1]<<8)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + data[1],
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data, 16, 0);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(data);
>> - =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 mutex_lock(&usb->i2c_lock);
>> + =A0 =A0 data =3D kzalloc(16, GFP_KERNEL);
>> + =A0 =A0 if (data =3D NULL) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 i2c_unregister_device(audio);
>> + =A0 =A0 =A0 =A0 =A0 =A0 kfree(state);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 mutex_unlock(&usb->i2c_lock);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> + =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 int rc;
>> + =A0 =A0 =A0 =A0 =A0 =A0 rc =3D go7007_usb_vendor_request(go, 0x41, 0, =
0,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0data, 16, 1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (rc > 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u8 mask;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data[0] =3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1<<5;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data[0] &=3D ~mask;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data[1] |=3D mask;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 go7007_usb_vendor_request(go, =
0x40, 0,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 (data[1]<<8)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 + data[1],
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 data, 16, 0);
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 kfree(data);
>> =A0 =A0 =A0 }
>> + =A0 =A0 mutex_unlock(&usb->i2c_lock);
>> +
>>
>> =A0 =A0 =A0 v4l2_info(sd, "initialized successfully\n");
>> =A0 =A0 =A0 return 0;
>
> hi,
> You can drop the else
> 1. there is no 3. way
> 2. you can save 1 indent level

ok. I will do it.

>
> just one question: the (data[1]<<8)+ data[1] is intended ? always data[1]=
 ?
> (i have no clue, it is the original code, it just feels .. strange )

I just added mutex_lock and error handling for kzalloc .
Rest of the things were there before. No change done by me.

regards
Santosh

> re,
> =A0wh
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
