From: Michal Simek <michal.simek@xilinx.com>
Date: Thu, 18 Jun 2020 08:07:09 +0000
Subject: Re: [PATCH] soc: xilinx: Fix error code in zynqmp_pm_probe()
Message-Id: <e827b05b-c2ed-ef93-80ae-7d8bd0f0ac0d@xilinx.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200605110020.GA978434@mwanda>
 <951de328-3647-ea49-ecec-1f0f98ceb4b1@xilinx.com>
In-Reply-To: <951de328-3647-ea49-ecec-1f0f98ceb4b1@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Simek <michal.simek@xilinx.com>, Dan Carpenter <dan.carpenter@oracle.com>, Tejas Patel <tejas.patel@xilinx.com>
Cc: Rajan Vaja <rajan.vaja@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jolly Shah <jolly.shah@xilinx.com>, linux-arm-kernel@lists.infradead.org



On 05. 06. 20 13:07, Michal Simek wrote:
> On 05. 06. 20 13:00, Dan Carpenter wrote:
>> This should be returning PTR_ERR() but it returns IS_ERR() instead.
>>
>> Fixes: ffdbae28d9d1 ("drivers: soc: xilinx: Use mailbox IPI callback")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>  drivers/soc/xilinx/zynqmp_power.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
>> index 31ff49fcd078b..c556623dae024 100644
>> --- a/drivers/soc/xilinx/zynqmp_power.c
>> +++ b/drivers/soc/xilinx/zynqmp_power.c
>> @@ -205,7 +205,7 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
>>  		rx_chan = mbox_request_channel_byname(client, "rx");
>>  		if (IS_ERR(rx_chan)) {
>>  			dev_err(&pdev->dev, "Failed to request rx channel\n");
>> -			return IS_ERR(rx_chan);
>> +			return PTR_ERR(rx_chan);
>>  		}
>>  	} else if (of_find_property(pdev->dev.of_node, "interrupts", NULL)) {
>>  		irq = platform_get_irq(pdev, 0);
>>
> 
> Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Applied.
M
