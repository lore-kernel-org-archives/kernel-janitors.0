From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 19 Apr 2020 13:10:33 +0000
Subject: Re: [PATCH v2] iommu/qcom: Fix local_base status check
Message-Id: <b07d3b02-bf96-fd73-8333-a1104da9ae47@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <73736017-cae3-1c2a-dcf4-d771d0f3bbbf@web.de>
In-Reply-To: <73736017-cae3-1c2a-dcf4-d771d0f3bbbf@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tang Bin <tangbin@cmss.chinamobile.com>, iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>

> …
>> +++ b/drivers/iommu/qcom_iommu.c
>> @@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>>  	qcom_iommu->dev = dev;
>>
>>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
…
>>  		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
…
> Please take another look at a corresponding usage example.

I would like to point another possibility out for desirable software evolution.
How do you think about to call a “known” wrapper function instead?

devm_platform_get_and_ioremap_resource
https://elixir.bootlin.com/linux/v5.7-rc1/source/drivers/base/platform.c#L66
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/base/platform.c

Regards,
Markus
