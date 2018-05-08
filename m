From: Lars-Peter Clausen <lars@metafoo.de>
Date: Tue, 08 May 2018 12:10:36 +0000
Subject: Re: [PATCH -next] dmaengine: sprd: Fix potential NULL dereference in sprd_dma_probe()
Message-Id: <ebdbc9bc-d78c-6338-7740-0d42894f917c@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1525657234-88256-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1525657234-88256-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/08/2018 02:05 PM, Vinod Koul wrote:
> On 08-05-18, 13:46, Lars-Peter Clausen wrote:
>> On 05/07/2018 03:40 AM, Wei Yongjun wrote:
>>>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	if (!res)
>>> +		return -EINVAL;
>>>  	sdev->glb_base = devm_ioremap_nocache(&pdev->dev, res->start,
>>>  					      resource_size(res));
>>
>> I think a better improvement would be to replace this with
>> devm_ioremap_resource() which has the NULL pointer check and some other
>> things built-in.
> 
> Sure feel free to send a patch :)
> 

I prefer to inspire others ;)
