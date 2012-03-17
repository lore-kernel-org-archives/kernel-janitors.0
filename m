From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Sat, 17 Mar 2012 16:12:36 +0000
Subject: Re: [PATCH] [media] staging: Return -EINTR in s2250_probe() if fails to get lock.
Message-Id: <CAOD=uF6wD1sx2=Rk3ZaxtykBR32_GMsHmiuXuAQP2U_=c-Ytbw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331915038-11231-1-git-send-email-santoshprasadnayak@gmail.com>
	<201203161732.17246.oliver@neukum.org>
	<CAOD=uF4pJMousyB2FPrAF-H5nJ7W4p_NEkGdrOpT9xyLVHYQPg@mail.gmail.com>
	<201203161859.35104.oliver@neukum.org>
In-Reply-To: <201203161859.35104.oliver@neukum.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Oliver Neukum <oliver@neukum.org>
Cc: mchehab@infradead.org, gregkh@linuxfoundation.org, khoroshilov@ispras.ru, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Oliver,

The following changes are for review only  not a formal patch.

---------------------------------------------------------------------------=
----------------------------------
-       if (mutex_lock_interruptible(&usb->i2c_lock) =3D 0) {
+       mutex_lock(&usb->i2c_lock);
                data =3D kzalloc(16, GFP_KERNEL);
-               if (data !=3D NULL) {
+               if(data =3D NULL) {
+                       i2c_unregister_device(audio);
+                       kfree(state);
+                       return -ENOMEM;
+               } else {
                        int rc;
                        rc =3D go7007_usb_vendor_request(go, 0x41, 0, 0,
                                                       data, 16, 1);
@@ -657,7 +661,7 @@ static int s2250_probe(struct i2c_client *client,
                        kfree(data);
                }
                mutex_unlock(&usb->i2c_lock);
-       }
+

----------------------------------------------------------------------


Is it ok ?


regards
Santosh


On Fri, Mar 16, 2012 at 11:29 PM, Oliver Neukum <oliver@neukum.org> wrote:
> Am Freitag, 16. M=E4rz 2012, 17:56:20 schrieb santosh prasad nayak:
>> On Fri, Mar 16, 2012 at 10:02 PM, Oliver Neukum <oliver@neukum.org> wrot=
e:
>> >
>> > Indeed there's a lot wrong here. The idea of having an interruptible
>> > sleep in probe() is arcane. You need a very, very, very good reason fo=
r that.
>>
>> Can you please explain why interruptible =A0sleep =A0should not be =A0in=
 probe() ?
>> I am curious to know.
>
> -EINTR is supposed to be returned to user space, so that it can repeat
> an interrupted syscall.
>
> - There is no user space for probe()
> - probe() cannot be easily repeated from user space
> - there is no syscall for probe
>>
>>
>> > The sane fix is using an uninterruptable sleep here.
>> >
>> > Second, while you are at it, fix the error case for no initialization
>> > due to a failing kmalloc(). You need to return -ENOMEM.
>>
>> Are you talking about kmalloc or kzalloc ?
>> Because for failing kmalloc -ENOMEM is returned as shown below:
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data =3D kzalloc(16, GFP_KERNEL);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (data !=3D NULL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int rc;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rc =3D go7007_usb_vendor_r=
equest(go, 0x41, 0, 0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data, 16, 1);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (rc > 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u8 mask;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data[0] =
=3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mask =3D 1=
<<5;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data[0] &=
=3D ~mask;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data[1] |=
=3D mask;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0go7007_usb=
_vendor_request(go, 0x40, 0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(data[1]<<8)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+ data[1],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data, 16, 0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(data);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mutex_unlock(&usb->i2c_lock)
>
> This code has no error handling.
>
> =A0 =A0 =A0 =A0Regards
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Oliver
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
