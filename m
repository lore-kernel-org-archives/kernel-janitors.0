From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 03 Apr 2020 17:20:35 +0000
Subject: Re: [PATCH v2] iommu/qcom: Fix local_base status check
Message-Id: <084eb9b2-3f5f-4e87-08aa-fe57ed3f5d35@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tang Bin <tangbin@cmss.chinamobile.com>, iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Release resources when exiting on error.

I have got doubts that such a change description fits to
the proposed source code adjustment.


…
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	qcom_iommu->dev = dev;
>
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res)
> +	if (res) {
>  		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(qcom_iommu->local_base))
> +			return PTR_ERR(qcom_iommu->local_base);
> +	}
>
>  	qcom_iommu->iface_clk = devm_clk_get(dev, "iface");
…

Will the commit message be improved any further?

Would you like to add the tag “Fixes”?

Regards,
Markus
