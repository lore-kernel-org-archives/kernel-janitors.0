From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Tue, 07 Apr 2020 06:15:33 +0000
Subject: Re: [PATCH] soc: qcom: smp2p: Delete an error message in qcom_smp2p_probe()
Message-Id: <20200407061533.GA576963@builder.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <eb92fcfb-6181-1f9d-2601-61e5231bd892@web.de>
In-Reply-To: <eb92fcfb-6181-1f9d-2601-61e5231bd892@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>

On Sun 05 Apr 09:12 PDT 2020, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 18:08:13 +0200
>=20
> The function =93platform_get_irq=94 can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks Markus, picked up for 5.8.

Regards,
Bjorn

> ---
>  drivers/soc/qcom/smp2p.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index c7300d54e444..07183d731d74 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -474,10 +474,8 @@ static int qcom_smp2p_probe(struct platform_device *=
pdev)
>  		goto report_read_failure;
>=20
>  	irq =3D platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "unable to acquire smp2p interrupt\n");
> +	if (irq < 0)
>  		return irq;
> -	}
>=20
>  	smp2p->mbox_client.dev =3D &pdev->dev;
>  	smp2p->mbox_client.knows_txdone =3D true;
> --
> 2.26.0
>=20
