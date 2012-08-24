From: Stefan Roese <sr@denx.de>
Date: Fri, 24 Aug 2012 13:14:32 +0000
Subject: Re: [PATCH] drivers/mtd/devices/spear_smi.c: use devm_ functions consistently
Message-Id: <50377E38.1040701@denx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344112598-1051-1-git-send-email-Julia.Lawall@lip6.fr>
 <1345808104.2848.285.camel@sauron.fi.intel.com>
In-Reply-To: <1345808104.2848.285.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dedekind1@gmail.com
Cc: Shiraz Hashim <shiraz.hashim@st.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>

On 08/24/2012 01:35 PM, Artem Bityutskiy wrote:
>> @@ -1073,21 +1043,13 @@ static int __devexit spear_smi_remove(struct platform_device *pdev)
>>  		ret = mtd_device_unregister(&flash->mtd);
>>  		if (ret)
>>  			dev_err(&pdev->dev, "error removing mtd\n");
>> -
>> -		iounmap(flash->base_addr);
>> -		kfree(flash);
>>  	}
>>  
>>  	irq = platform_get_irq(pdev, 0);
>> -	free_irq(irq, dev);
> 
> I guess 'platform_get_irq()' should be killed as well? Stefan, this is
> strange code - we get irq, without checking for error, and then free it?
> What is the rationale?

Yes, this seems bogus. platform_get_irq() definitely should be removed
from spear_smi_remove().

>>  	clk_disable_unprepare(dev->clk);
>> -	clk_put(dev->clk);
>> -	iounmap(dev->io_base);
>> -	kfree(dev);
>>  
>>  	smi_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	release_mem_region(smi_base->start, resource_size(smi_base));
>>  	platform_set_drvdata(pdev, NULL);
> 
> Why do we set platform data to NULL, is this needed?

It seems to be common practice to use this call to clear the drvdata in
the driver remove function. I have to admit, that I'm not sure if its
really needed though.

Thanks,
Stefan
