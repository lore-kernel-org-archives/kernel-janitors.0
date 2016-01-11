From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 11 Jan 2016 08:08:50 +0000
Subject: Re: [PATCH 0/2] mfd: smsc-ece1099: Fine-tuning for smsc_i2c_probe()
Message-Id: <20160111080850.GR3331@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5682957F.5000604@users.sourceforge.net>
In-Reply-To: <5682957F.5000604@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

This set is confusing.

Why do you have a cover letter specifying this as a 2 patch set, yet
there are 4 patches attached to it?

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 29 Dec 2015 15:10:48 +0100

What format is this?

> A few update suggestions were taken into account
> from static source code analysis.
>=20
> Markus Elfring (2):
>   Delete an unnecessary variable initialisation
>   Refactoring
>=20
>  drivers/mfd/smsc-ece1099.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
