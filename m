From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 06 Dec 2006 08:34:48 +0000
Subject: Re: [KJ] what is best: memcpy or for
Message-Id: <20061206083448.GE24594@rotomalug.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612052335v3688faedj6c64f979d420c078@mail.gmail.com>
In-Reply-To: <80ec54e90612052335v3688faedj6c64f979d420c078@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Daniel Marjam=E4ki (daniel.marjamaki@gmail.com) wrote:
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

Hi,

Perhaps I say mistake, but in kernel terms :

	http://lxr.linux.no/source/include/asm-i386/string.h?v=3D2.6.18#L203

regards,

	Christophe
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
