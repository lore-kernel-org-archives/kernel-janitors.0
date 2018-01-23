From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 23 Jan 2018 12:55:58 +0000
Subject: Re: [PATCH v2] mfd: omap-usb-tll: Allocate driver data at once
Message-Id: <20180123125558.pcvztj2spuimatdk@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180115202505.GA2628@lenoch>
In-Reply-To: <20180115202505.GA2628@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-omap@vger.kernel.org, SF Markus Elfring <elfring@users.sourceforge.net>, Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@ti.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, 15 Jan 2018, Ladislav Michl wrote:

> Allocating memory to store clk array together with driver
> data simplifies error unwinding and allows deleting memory
> allocation failure message as there is now only single point
> of failure already covered by allocation failure report.
>=20
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> [Markus Elfring: simplified error unwinding, error message removal]
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> Link: https://lkml.org/lkml/2018/1/15/411
> ---
>  Changes:
>  - v2: reindent 'rev' debug message
>        credit Markus Elfring
>=20
>  drivers/mfd/omap-usb-tll.c | 60 +++++++++++++++++++---------------------=
------
>  1 file changed, 25 insertions(+), 35 deletions(-)

Applied, thanks.

--=20
Lee Jones
Linaro Services Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
