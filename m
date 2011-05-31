From: Jiri Slaby <jirislaby@gmail.com>
Date: Tue, 31 May 2011 09:05:42 +0000
Subject: Re: Janitor-Question: use __set_bit instead of |=
Message-Id: <4DE4AF66.8070001@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201105302323.43979.PeterHuewe@gmx.de>
In-Reply-To: <201105302323.43979.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 05/30/2011 11:23 PM, Peter H=FCwe wrote:
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

Note that you need to define a different set of macros.
E.g. if you have for |=3D:
#define FLAG1 0x01
#define FLAG2 0x02
#define FLAG3 0x40

for set_bit you need:
#define FLAG1 0
#define FLAG2 1
#define FLAG3 6

Also with set_bit you can set only one bit at a time which might make
the code longer and unreadable. For examples, see input layer.

> |> pro:
> - standard C
> - let's the compiler decide
> - no warnings on chars, shorts, ints

regards,
--=20
js
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
