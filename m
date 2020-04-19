From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 19 Apr 2020 12:32:20 +0000
Subject: Re: [PATCH v2] iommu/qcom: Fix local_base status check
Message-Id: <73736017-cae3-1c2a-dcf4-d771d0f3bbbf@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <084eb9b2-3f5f-4e87-08aa-fe57ed3f5d35@web.de>
In-Reply-To: <084eb9b2-3f5f-4e87-08aa-fe57ed3f5d35@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Tang Bin <tangbin@cmss.chinamobile.com>, iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> The function qcom_iommu_device_probe() does not perform sufficient
> error checking after executing devm_ioremap_resource(), which can
> result in crashes if a critical error path is encountered.

Your update suggestion will be rechecked once more.

* Can it be that the patch would need a higher version number
  according to previous review comments?

* Would you like to adjust the patch subject?


=E2=80=A6
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct platform_d=
evice *pdev)
>  	qcom_iommu->dev =3D dev;
>
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res)

I find the deletion of this check appropriate.


> +	if (res) {
>  		qcom_iommu->local_base =3D devm_ioremap_resource(dev, res);

But I do not see a need to preserve such a check because this function
performs input parameter validation.
https://elixir.bootlin.com/linux/v5.7-rc1/source/lib/devres.c#L116
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib=
/devres.c?id=3D50cc09c18985eacbbd666acfd7be2391394733f5#n116

Please take another look at a corresponding usage example.

Regards,
Markus
