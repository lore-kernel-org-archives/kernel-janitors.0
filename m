From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 28 Jul 2020 15:13:23 +0000
Subject: Re: [PATCH] ARM: zx: remove redundant dev_err call in zx296702_pd_probe()
Message-Id: <3b237263-33eb-d7dc-b6cf-d341f35824de@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Qinglang Miao <miaoqinglang@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jun Nie <jun.nie@linaro.org>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>

=E2=80=A6
> +++ b/arch/arm/mach-zx/zx296702-pm-domain.c
> @@ -170,7 +170,6 @@ static int zx296702_pd_probe(struct platform_device *=
pdev)
>
>  	pcubase =3D devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(pcubase)) {
> -		dev_err(&pdev->dev, "ioremap fail.\n");
>  		return -EIO;
>  	}

Would you like to delete also the curly brackets besides the error message?

Regards,
Markus
