From: Sinan Kaya <okaya@kernel.org>
Date: Tue, 28 Apr 2020 16:01:15 +0000
Subject: Re: [PATCH] dmaengine: qcom_hidma: Simplify error handling path in hidma_probe
Message-Id: <1efa0186-7fbe-9cb5-2719-2d7192f99e27@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427111043.70218-1-christophe.jaillet@wanadoo.fr>
 <20200428125426.GE2014@kadam>
In-Reply-To: <20200428125426.GE2014@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 4/28/2020 8:54 AM, Dan Carpenter wrote:
>> @@ -897,7 +897,6 @@ static int hidma_probe(struct platform_device *pdev)
>>  	if (msi)
>             ^^^
> This test doesn't work.  It will call free hidma_free_msis() if the
> hidma_request_msi() call fails.  We should do:
> 
> 	if (msi) {
> 		rc = hidma_request_msi(dmadev, pdev);
> 		msi = false;
> 	}
> 
> 	if (!msi) {
> 		hidma_ll_setup_irq(dmadev->lldev, false);
> 		rc = devm_request_irq(&pdev->dev, chirq, hidma_chirq_handler,
> 				      0, "qcom-hidma", dmadev->lldev);
> 		if (rc)
> 			goto uninit;
> 	}
> 
> 

Let me clarify how this works. MSI capability is not present on all
platforms. Therefore, this is detected by an ACPI/DTS parameter called
HIDMA_MSI_CAP.

msi = hidma_test_capability(&pdev->dev, HIDMA_MSI_CAP);

Therefore,

1. Code will request MSI capability if it is present.
2. Code will fallback to plain IRQ, if MSI allocation also fails.

I hope this helps.

We need both #1 and #2 to be supported.
