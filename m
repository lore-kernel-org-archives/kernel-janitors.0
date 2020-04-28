From: Grygorii Strashko <grygorii.strashko@ti.com>
Date: Tue, 28 Apr 2020 07:30:01 +0000
Subject: Re: [PATCH net-next] drivers: net: davinci_mdio: fix potential NULL dereference in davinci_mdio_prob
Message-Id: <68b08143-971a-4607-098c-2cdca9a1b0ba@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6AADFAC011213A4C87B956458587ADB419A6B43E@dggeml532-mbs.china.huawei.com>
In-Reply-To: <6AADFAC011213A4C87B956458587ADB419A6B43E@dggeml532-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "weiyongjun (A)" <weiyongjun1@huawei.com>, David Lechner <david@lechnology.com>, Andrew Lunn <andrew@lunn.ch>
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



On 28/04/2020 06:25, weiyongjun (A) wrote:
>>
>> On 4/27/20 4:40 AM, Wei Yongjun wrote:
>>> platform_get_resource() may fail and return NULL, so we should better
>>> check it's return value to avoid a NULL pointer dereference a bit
>>> later in the code.
>>>
>>> This is detected by Coccinelle semantic patch.
>>>
>>> @@
>>> expression pdev, res, n, t, e, e1, e2; @@
>>>
>>> res = \(platform_get_resource\|platform_get_resource_byname\)(pdev, t, n);
>>> + if (!res)
>>> +   return -EINVAL;
>>> ... when != res = NULL
>>> e = devm_ioremap(e1, res->start, e2);
>>>
>>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>>> ---
>>
>> Could we use devm_platform_ioremap_resource() instead?
> 
> We cannot use devm_platform_ioremap_resource() here, see
> Commit 03f66f067560 ("net: ethernet: ti: davinci_mdio: use devm_ioremap()")

Correct, could you add fixed tag as above commit actually introduced an issue:
devm_ioremap_resource() checks input parameters for null.
  
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
