From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Oct 2016 05:45:17 +0000
Subject: Re: [media] RedRat3: Use kcalloc() in two functions?
Message-Id: <e98cbba5-8254-af1e-5405-428f61c8433e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <81cef537-4ad0-3a74-8bde-94707dcd03f4@users.sourceforge.net>
 <21c57b39-25ac-2df1-030d-11c243a11ebc@users.sourceforge.net>
 <1476376177.2164.10.camel@perches.com>
In-Reply-To: <1476376177.2164.10.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>, linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, Wolfram Sang <wsa-dev@sang-engineering.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> Markus, please stop being _so_ mechanical and use your
> brain a little too.  By definition, sizeof(char) =3D 1.
>=20
> This _really_ should be kzalloc(RR3_FW_VERSION_LEN + 1,...)

Do you expect that function call examples like the following will be equiva=
lent?

	zbuffer =3D kzalloc(123, =85);
	cbuffer =3D kcalloc(123, 1, =85);

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
