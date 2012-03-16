From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Fri, 16 Mar 2012 16:57:40 +0000
Subject: Re: [PATCH] [media] staging: Return -EINTR in s2250_probe() if fails to get lock.
Message-Id: <CAOD=uF4pJMousyB2FPrAF-H5nJ7W4p_NEkGdrOpT9xyLVHYQPg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331915038-11231-1-git-send-email-santoshprasadnayak@gmail.com>
	<201203161732.17246.oliver@neukum.org>
In-Reply-To: <201203161732.17246.oliver@neukum.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Oliver Neukum <oliver@neukum.org>
Cc: mchehab@infradead.org, gregkh@linuxfoundation.org, khoroshilov@ispras.ru, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 16, 2012 at 10:02 PM, Oliver Neukum <oliver@neukum.org> wrote:
> Am Freitag, 16. M=E4rz 2012, 17:23:58 schrieb santosh nayak:
>> From: Santosh Nayak <santoshprasadnayak@gmail.com>
>>
>> In s2250_probe(), If locking attempt is interrupted by a signal then
>> it should return -EINTR after unregistering audio device and making free
>> the allocated memory.
>>
>> At present, if locking is interrupted by signal it will display message
>> "initialized successfully" and return success. =A0This is wrong.
>
> Indeed there's a lot wrong here. The idea of having an interruptible
> sleep in probe() is arcane. You need a very, very, very good reason for t=
hat.

Can you please explain why interruptible  sleep  should not be  in probe() ?
I am curious to know.


> The sane fix is using an uninterruptable sleep here.
>
> Second, while you are at it, fix the error case for no initialization
> due to a failing kmalloc(). You need to return -ENOMEM.

Are you talking about kmalloc or kzalloc ?
Because for failing kmalloc -ENOMEM is returned as shown below:

       state =3D kmalloc(sizeof(struct s2250), GFP_KERNEL);
        if (state =3D NULL) {
                i2c_unregister_device(audio);
                return -ENOMEM;     // ENOMEM is returned here.
        }


Regards
Santosh


>
> =A0 =A0 =A0 =A0Regards
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Oliver
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
