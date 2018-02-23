From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Feb 2018 07:32:05 +0000
Subject: Re: [PATCH 2/2] crypto: omap: Improve a size determination in three functions
Message-Id: <3916c49d-f74a-97a0-9240-de9a727bece9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <28780631-d093-a581-8690-3868f8fa327e@users.sourceforge.net>
 <0a45e47f-5ed0-5dd6-7545-adc8df2d7972@users.sourceforge.net>
 <20180222133813.GB28447@gondor.apana.org.au>
In-Reply-To: <20180222133813.GB28447@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Joel Fernandes <joelf@ti.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> @@ -1032,14 +1032,13 @@ static int omap_aes_get_res_pdev(struct omap_aes_dev *dd,
>>  static int omap_aes_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> -	struct omap_aes_dev *dd;
>>  	struct crypto_alg *algp;
>>  	struct aead_alg *aalg;
>>  	struct resource res;
>>  	int err = -ENOMEM, i, j, irq = -1;
>>  	u32 reg;
>> +	struct omap_aes_dev *dd = devm_kzalloc(dev, sizeof(*dd), GFP_KERNEL);
>>  
>> -	dd = devm_kzalloc(dev, sizeof(struct omap_aes_dev), GFP_KERNEL);
> 
> I'm fine with sizeof(*dd)

Thanks for your feedback.


> but please don't combine the allocation with the declaration.

Why do you not like such an implementation detail?

Regards,
Markus
