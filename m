From: Vignesh Raghavendra <vigneshr@ti.com>
Date: Tue, 28 Apr 2020 16:27:51 +0000
Subject: Re: [PATCH -next] PCI: dwc: pci-dra7xx: Fix potential NULL dereference in dra7xx_pcie_probe()
Message-Id: <ebb4db96-08ef-64fe-5331-291f054562ed@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427111044.162618-1-weiyongjun1@huawei.com>
 <cad871c8-0915-9dda-2c61-30dfb5504d23@ti.com> <20200428130734.GF2014@kadam>
In-Reply-To: <20200428130734.GF2014@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org



On 28/04/20 6:37 pm, Dan Carpenter wrote:
> On Mon, Apr 27, 2020 at 05:29:50PM +0530, Vignesh Raghavendra wrote:
>> Hi,
>>
>> On 27/04/20 4:40 pm, Wei Yongjun wrote:
>>> platform_get_resource() may fail and return NULL, so we should
>>> better check it's return value to avoid a NULL pointer dereference
>>> a bit later in the code.
>>>
>>> This is detected by Coccinelle semantic patch.
>>>
>>> @@
>>> expression pdev, res, n, t, e, e1, e2;
>>> @@
>>>
>>> res = \(platform_get_resource\|platform_get_resource_byname\)(pdev, t, n);
>>> + if (!res)
>>> +   return -EINVAL;
>>> ... when != res = NULL
>>> e = devm_ioremap(e1, res->start, e2);
>>>
>>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>>> ---
>>>  drivers/pci/controller/dwc/pci-dra7xx.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
>>> index 3b0e58f2de58..7a3d12f7e7d9 100644
>>> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
>>> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
>>> @@ -878,6 +878,9 @@ static int __init dra7xx_pcie_probe(struct platform_device *pdev)
>>>  	}
>>>  
>>>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ti_conf");
>                                            ^^^^
> 
>>> +	if (!res)
>>> +		return -EINVAL;
>>> +
>>>  	base = devm_ioremap(dev, res->start, resource_size(res));
>                             ^^^
>>
>> I don't see why this should be devm_ioremap(). It should also have been
>> devm_ioremap_resource() which does the NULL check.
> 
> It's different device pointers.
> 

Sorry, I don't understand this comment... Currently we have:

static int __init dra7xx_pcie_probe(struct platform_device *pdev)
{
        struct device *dev = &pdev->dev;
	...
	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ti_conf");
        base = devm_ioremap(dev, res->start, resource_size(res));
        if (!base)
                return -ENOMEM;

Instead of the proposed patch, what I am asking is:

	base = devm_platform_ioremap_resource_byname(pdev, "ti_conf");
	if (IS_ERR(base))
		return PTR_ERR(base);




> regards,
> dan carpenter
> 
