From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 19 Sep 2019 10:50:28 +0000
Subject: Re: [PATCH] mtd: st_spi_fsm: Use devm_platform_ioremap_resource() in stfsm_probe()
Message-Id: <17a1fccd-0ac3-f257-dec9-228b33a18cfa@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e1d32aa4-7c82-64e0-b7c4-33c94d9a2769@web.de>
 <20190919111014.6c569cf3@xps13>
In-Reply-To: <20190919111014.6c569cf3@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Armijn Hemel <armijn@tjaldur.nl>, Himanshu Jha <himanshujha199640@gmail.com>, Richard Weinberger <richard@nod.at>, Lee Jones <lee.jones@linaro.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>

>> +++ b/drivers/mtd/devices/st_spi_fsm.c
>> @@ -2034,13 +2034,7 @@ static int stfsm_probe(struct platform_device *pdev)
>>
>>  	platform_set_drvdata(pdev, fsm);
>>
>> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	if (!res) {
>> -		dev_err(&pdev->dev, "Resource not found\n");
>> -		return -ENODEV;
>> -	}
>> -
>> -	fsm->base = devm_ioremap_resource(&pdev->dev, res);
>> +	fsm->base = devm_platform_ioremap_resource(pdev, 0);
>>  	if (IS_ERR(fsm->base)) {
>>  		dev_err(&pdev->dev,
>>  			"Failed to reserve memory region %pR\n", res);
>> --
>> 2.23.0
>>
>
>
> Is this even compiled tested? 'res' is not initialized anymore so you
> can't use it in the error trace. I suppose you should even drop it from
> the stack parameters.

Would you accept to reduce the error message another bit?

Regards,
Markus
