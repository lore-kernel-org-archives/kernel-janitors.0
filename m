From: Neil Horman <nhorman@tuxdriver.com>
Date: Wed, 06 Dec 2006 15:25:45 +0000
Subject: Re: [KJ] what is best: memcpy or for
Message-Id: <20061206152545.GB23846@hmsreliant.homelinux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612052335v3688faedj6c64f979d420c078@mail.gmail.com>
In-Reply-To: <80ec54e90612052335v3688faedj6c64f979d420c078@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Dec 06, 2006 at 08:35:41AM +0100, Daniel Marjam=E4ki wrote:
> Hello!
>=20
> I am wondering if there is any real difference between "for" and "memcpy"=
..
>=20
>     int i, a[100], b[100];
>=20
>     // method 1
>     for (i =3D 0; i < 100; i++)
>         a[i] =3D b[i];
>=20
>     // method 2
>     memcpy(a, b, sizeof(a));
>=20
> Is there any difference in speed?
>=20
> With a good compiler, the output should be the same for both methods,
> shouldn't it?
>=20
> Best regards,
> Daniel
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors

I'm going to say memcpy is better, as the for loop makes the assumption of
normalized 32 bit registers.  memcpy will copy multiple bytes where it is a=
ble
to and more efficient to do so.  Furhter, on larger machines, where 4 bit
registers are available, memcpy will likely use 64 bit load/store if its as=
sumed
faster.

Neil

--=20
/***************************************************
 *Neil Horman
 *Software Engineer
 *gpg keyid: 1024D / 0x92A74FA1 - http://pgp.mit.edu
 ***************************************************/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
