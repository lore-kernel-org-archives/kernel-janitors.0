From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 12 Jan 2016 09:06:00 +0000
Subject: Re: mfd-dm355evm_msp: One function call less in add_child() after error detection
Message-Id: <20160112090600.GT19803@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <568284D3.3060006@users.sourceforge.net>
 <20160111083108.GC14104@x1>
 <5694BAA0.80004@users.sourceforge.net>
In-Reply-To: <5694BAA0.80004@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Tue, 12 Jan 2016, SF Markus Elfring wrote:

> >> The platform_device_put() function was called in one case by the
> >> add_child() function during error handling even if the passed
> >> variable "pdev" contained a null pointer.
> >>
> >> Implementation details could be improved by the adjustment of jump tar=
gets
> >> according to the Linux coding style convention.
> >>
> >> This issue was detected by using the Coccinelle software.
> >>
> >> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> >> ---
> >>  drivers/mfd/dm355evm_msp.c | 21 ++++++++++-----------
> >>  1 file changed, 10 insertions(+), 11 deletions(-)
> >=20
> > Same comments as before.
>=20
> To which comments do you refer here?
>=20
> Are you interested in any further clarification of open issues?

I'm sure you'll work it out. ;)

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
