From: Florian Fainelli <f.fainelli@gmail.com>
Date: Thu, 11 Jan 2018 20:03:37 +0000
Subject: Re: [PATCH net-next] net: phy: mdio-bcm-unimac: fix potential NULL dereference in unimac_mdio_probe(
Message-Id: <a641ff1c-9530-791b-b1c0-3c81407d0f56@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1515669711-126459-1-git-send-email-weiyongjun1@huawei.com>
 <20180111.135726.1299937792649052032.davem@davemloft.net>
In-Reply-To: <20180111.135726.1299937792649052032.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, weiyongjun1@huawei.com
Cc: andrew@lunn.ch, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01/11/2018 10:57 AM, David Miller wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> Date: Thu, 11 Jan 2018 11:21:51 +0000
> 
>> platform_get_resource() may fail and return NULL, so we should
>> better check it's return value to avoid a NULL pointer dereference
>> a bit later in the code.
>>
>> This is detected by Coccinelle semantic patch.
>>
>> @@
>> expression pdev, res, n, t, e, e1, e2;
>> @@
>>
>> res = platform_get_resource(pdev, t, n);
>> + if (!res)
>> +   return -EINVAL;
>> ... when != res = NULL
>> e = devm_ioremap(e1, res->start, e2);
>>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Applied, thank you.

Sorry, being really lagging behind lately:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

> 
>> diff --git a/drivers/net/phy/mdio-bcm-unimac.c b/drivers/net/phy/mdio-bcm-unimac.c
>> index 08e0647..8d37066 100644
>> --- a/drivers/net/phy/mdio-bcm-unimac.c
>> +++ b/drivers/net/phy/mdio-bcm-unimac.c
>> @@ -205,6 +205,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
>>  		return -ENOMEM;
>>  
>>  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!r)
>> +		return -EINVAL;
>>  
>>  	/* Just ioremap, as this MDIO block is usually integrated into an
>>  	 * Ethernet MAC controller register range
>>
> 
> I have to say, the devm_*() routines may make it easier to write drivers and probe
> routines, but it makes patches much harder to review.
> 
> I couldn't figure out if you were leaking resources here without going into the
> source file and looking at all of the relevant context.
> 
> Just though I'd make this meta-comment...

Agreed, what appears to be worse is that the kitchen sync routine like
devm_ioremap_resource() properly protects against NULL resource pointer
whereas simpler routines like devm_ioremap() do not because it usually
is called from a caller that did the check for us.

Thanks Wei!
--
Florian
