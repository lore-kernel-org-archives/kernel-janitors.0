From: Oliver Neukum <oliver@neukum.org>
Date: Fri, 16 Mar 2012 17:59:35 +0000
Subject: Re: [PATCH] [media] staging: Return -EINTR in s2250_probe() if fails to get lock.
Message-Id: <201203161859.35104.oliver@neukum.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331915038-11231-1-git-send-email-santoshprasadnayak@gmail.com> <201203161732.17246.oliver@neukum.org> <CAOD=uF4pJMousyB2FPrAF-H5nJ7W4p_NEkGdrOpT9xyLVHYQPg@mail.gmail.com>
In-Reply-To: <CAOD=uF4pJMousyB2FPrAF-H5nJ7W4p_NEkGdrOpT9xyLVHYQPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: santosh prasad nayak <santoshprasadnayak@gmail.com>
Cc: mchehab@infradead.org, gregkh@linuxfoundation.org, khoroshilov@ispras.ru, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Freitag, 16. M=E4rz 2012, 17:56:20 schrieb santosh prasad nayak:
> On Fri, Mar 16, 2012 at 10:02 PM, Oliver Neukum <oliver@neukum.org> wrote:
> >
> > Indeed there's a lot wrong here. The idea of having an interruptible
> > sleep in probe() is arcane. You need a very, very, very good reason for=
 that.
>=20
> Can you please explain why interruptible  sleep  should not be  in probe(=
) ?
> I am curious to know.

-EINTR is supposed to be returned to user space, so that it can repeat
an interrupted syscall.

- There is no user space for probe()
- probe() cannot be easily repeated from user space
- there is no syscall for probe
>=20
>=20
> > The sane fix is using an uninterruptable sleep here.
> >
> > Second, while you are at it, fix the error case for no initialization
> > due to a failing kmalloc(). You need to return -ENOMEM.
>=20
> Are you talking about kmalloc or kzalloc ?
> Because for failing kmalloc -ENOMEM is returned as shown below:

                data =3D kzalloc(16, GFP_KERNEL);
                if (data !=3D NULL) {
                        int rc;
                        rc =3D go7007_usb_vendor_request(go, 0x41, 0, 0,
                                                       data, 16, 1);
                        if (rc > 0) {
                                u8 mask;
                                data[0] =3D 0;
                                mask =3D 1<<5;
                                data[0] &=3D ~mask;
                                data[1] |=3D mask;
                                go7007_usb_vendor_request(go, 0x40, 0,
                                                          (data[1]<<8)
                                                          + data[1],
                                                          data, 16, 0);
                        }
                        kfree(data);
                }
                mutex_unlock(&usb->i2c_lock)

This code has no error handling.

	Regards
		Oliver
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
