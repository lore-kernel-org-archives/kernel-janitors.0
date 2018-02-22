From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Feb 2018 08:25:27 +0000
Subject: Re: [PATCH v2] iio:dummy: Replace S_IWUSR by 0200
Message-Id: <20180222082527.wbiztlla4aondbeu@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180221192807.qfyhp7z27f6r6p47@smtp.gmail.com>
 <CAEnQRZBq3G+RPq66ObW+CM2A9BOE_tBn-fC++Ksy+O_nEFfz9Q@mail.gmail.com>
 <20180222074318.qsf7x4jnyhvasq5u@mwanda>
 <1519286013.13463.59.camel@nxp.com>
In-Reply-To: <1519286013.13463.59.camel@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: "daniel.baluta@gmail.com" <daniel.baluta@gmail.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "jic23@kernel.org" <jic23@kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>

> > Also who cares?=A0=A0The commit message is perfectly clear.
>=20
> I do care about newcomers really learning on how to write a proper
> commit message.
>=20
> The commit messsage should really say why the patch is needed, no what th=
e patch does.
>=20

It fixes a checkpatch warning.  The warning was right there in the patch
description!

> After several trivial patches newcomers will get into more serious stuff =
and I wouldn't
> want to see a patch with commit message like this:
>=20
> iio: Change bit 1 of status register
>=20

You seem to be complaining about about an imaginary patch from the
future???  If you've really built a time machine then focus on killing
Hitler instead of complaining about trivial bullshit.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
