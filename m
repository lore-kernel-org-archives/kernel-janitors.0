From: walter harms <wharms@bfs.de>
Date: Tue, 31 May 2011 07:11:35 +0000
Subject: Re: Janitor-Question: use __set_bit instead of |=
Message-Id: <4DE494A7.60703@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201105302323.43979.PeterHuewe@gmx.de>
In-Reply-To: <201105302323.43979.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org



Am 30.05.2011 23:23, schrieb Peter H=FCwe:
> Hi Janitors, staging-list
>=20
> what is your opinion on using set_bit instead of using |=3D to set a bit?
> Is it worth the effort to convert  existing |=3D to set_bit?
>=20
> __set_bit
> pro:
> - often implemented in optimized assembly (e.g. for x86)
> - intention might be clearer
> - less error prone
> - "they are the only portable way to set a specific bit"
> according to  Robert Love's Linux Kernel Development third edition, p.183
>=20
> cons:
> uses unsigned longs
>=20
>=20
> |> pro:
> - standard C
> - let's the compiler decide
> - no warnings on chars, shorts, ints
>=20
>=20

Personaly i do not like it, but to be fair
|=3D must not be obvious but it depends on the situation.

It is std C and the compiler should handle it.

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
