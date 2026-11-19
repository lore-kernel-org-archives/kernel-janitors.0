Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122379;
	b=PeYtPqYv2Z2+tYJxR+vhRaMcff4B68r+nS9r0kQKqa8GfXMQKDOvXduws382grhqRik3
	 sGZ90qWGBh2YauVbFOk/m7KcHEEeZdehH4Z3DzavyfjvOl2uQ6KTC9LpngwS6HgG7K8vY
	 GanPerei7IBqWwWXb6I4q4XNyV8I4sPBZXVbLZQtVizBzUsqpLsAofndBWGxWWYjmOczB
	 O/dtNmxYNgd3WIpPAxFItE79Z8H7C0ZCRypQeh2oIgqzMGS9lFG0/x8/5n83XTH5o6jDU
	 F69zRptD9wbHainxXA+kgE9D/dDRJw0mukMMeibn7+ad+yDeFWCDeCc3aY5WNxD0IaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122379;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=bAoSv+tBU6/V56oBnUvlAkyUpRBXVs9TVLI9K886rME=;
	b=C+VFtcaN05R36rxQXoTSE7lj5RivudftiFkMP+DWy47waY0ypw1aQbahEQMwXF69XWQh
	 TH4AOrfHXh9Sc/5lgu7sp43eq47pYwgj0gnQt4eC59Bvs6OLYzWG6WzOSgdKHSrpyTiFH
	 mXrXdX2MJEX/TobvzpmlR6UAS1r9N+3di8Hgji62X93bnBwdYDF5GUAtukafkLKx8yMJ5
	 O5AweYAcXbw1vUe+Mpf6MMTPEcdJleKc4G7aLHqNDqBECkE+IJS86fCUB00hzhYJ+3T2S
	 YORyhMXXIc2avWZ9gse0wZo72Mpyk2fM5FEgvB59uTW3ICldyTWx8u5nS3k0AmSejcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Oua9v/l4";
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF91F606A326
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 21:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF91F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Oua9v/l4
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so167935a91.0
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 13:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122378; x=1795727178;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bAoSv+tBU6/V56oBnUvlAkyUpRBXVs9TVLI9K886rME=;
        b=c3oSXjF3LJZev/rvadhPSup2vDsQZZg5P+PHSGpF07BoRfIGB/HgjYMpinNT27VeVg
         fGy1t0AcLbMmWei+WfXrZBt/KasWmj45CvNRFWv3wH342waEY/5pgrGqlXalzZO83a7F
         AhBFeqNJGzOEN3B2hGdTnpMkuf7k793qHNVASgn5RZwMS28V6MUF1BKVCMKCHV8HF61z
         aEuOp32IiKmnietpcyElXkcMqWNrkZCjfMu64U5qZvfTXJ7t/bxMFrrQF2J/D9GrsYzE
         L1VRwTJEUmqLZi4jEnmSd3rv7vp8iuFBywmcWJ9X16TgEd92jHB5L78cZSLIMybrfqG8
         2BXg==
X-Forwarded-Encrypted: i=1; AL+hErGRozk05Fo6BuPnWmmu9MwWJGzzgiLdxZoec2W4B8Gk8GDbEA2Zdlk47I0CJvCuWfuVRJJSP4Zn9n8tRwXoLz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T65bH7n4PCYt9FZO+yWVmAZletIw6g0WFvQm/sF4tnYMWt1o2
	w1rRrMLK1FTl6cU8l5KCdOTgaJHtLBc6R2DsIpTG2uSkmpQmLLmclEa6u9VzbtciwUnRWQQFd/d
	Rtx3iLdnKRK/HeN4qwYzhjlE82jmNoaTXoKcxa75CNJj06YZ8RF/g637+r9BScu/N0mA7eNV7y0
	Hdt9fbIV7/WArwi23mVSZxV5n1dc0NW+ZC5vVeuFGsFm/22WW3viQext4woQmGiw8E7qko9BNym
	asfVllpP9irRMsfLpJBIY2gIk04
X-Gm-Gg: AZFdTZcsIlH82Qe4Y7bc/7Dk54g9Uh2CyHoBjgEB60fhAdc5wXEfao4gWpv5RqtkI5c
	vpSw0TPHcaSIvIaJfd0olmcvwdSXo/HElfbp6T18C9lB2kqpEKVNPMF+BqnbKeq3xe0f0+EVOUR
	uJL11kogVqvZt8VcVhWHEwtX5X9uFcnqPv9h1SChWtUyVDfQQnkivoOXAlky50n5gSH/Y8uUqkr
	lGm1ev/FHRA9URGXpTPh/MWj4Bm0hfJmZ3zhNsnt1FmvgdTFtHrpzNn6GCfJWT/rsM0JVp/ZZ0D
	e3C3UHS6QFku6uUuIzr9YN8aedO/DPT8wDfQYZYWHlnLrw9T+i+jeEbjIEQgviVXyyA4rWC/fCg
	6Dx7viadh3biYSir0+8/RT+fpjddCDt5UbAqSaA7olEwlEIZHDgnkULs+KWldqMPMHsNeizd5xB
	VI7z+6PdHLNGxO73a4C6xGD8U9tjq0HmVHvxOBhVvd
X-Received: by 2002:a17:90b:3d90:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b41cb42c13mr446524a91.61.1795122378259;
        Thu, 19 Nov 2026 13:06:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ab582a3sm508268a91.0.2026.11.19.13.06.14
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:06:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so128876eec.0
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 13:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795122374; x=1795727174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAoSv+tBU6/V56oBnUvlAkyUpRBXVs9TVLI9K886rME=;
        b=Oua9v/l4DzJjsr/BXrb5jn76kSpLn8EIktY5l7x/3HZPLSBef1Focw1ih1ir7C5BM9
         kLMlTXEMq22Av425MJll+A4bv1KXlpJ5mhgX1BqQQWYvuuv7xAmLyMx7M1jdH/nBQ2Tf
         0fS1BUkhHGB7UHfACHLDGG3eq0sJflvPW+FwE=
X-Forwarded-Encrypted: i=1; AL+hErFx0EvkYGw12XE50mAXapNXWyccXDTq9LJoMD173FOD//InnicOR67ZThTqF6UogLEKYd2DovKTOtm1Qm3+myM=@vger.kernel.org
X-Received: by 2002:a05:693c:3f16:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-3856c5b52eemr520666eec.1.1795122373653;
        Thu, 19 Nov 2026 13:06:13 -0800 (PST)
X-Received: by 2002:a05:693c:3f16:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-3856c5b52eemr520614eec.1.1795122372514;
        Thu, 19 Nov 2026 13:06:12 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm1414862eec.5.2026.11.19.13.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:06:11 -0800 (PST)
Message-ID: <c4715b1f-c2cc-4b4f-8610-dd2e0ec71c45@broadcom.com>
Date: Thu, 19 Nov 2026 13:06:09 -0800
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: dsa: bcm_sf2: Use
 devm_clk_get_optional_enabled() in bcm_sf2_sw_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
 <92093067-f11e-4ce8-af0e-698644dc27ba@wanadoo.fr>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <92093067-f11e-4ce8-af0e-698644dc27ba@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/19/26 12:21, Christophe JAILLET wrote:
> Le 19/11/2026 à 17:37, Markus Elfring a écrit :
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Thu, 19 Nov 2026 17:30:09 +0100
>>
>> Reuse existing functionality from devm_clk_get_optional_enabled()
>> instead of keeping duplicate source code.
>>
>> The source code was transformed by using the Coccinelle software.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> ---
>>   drivers/net/dsa/bcm_sf2.c | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
>> index 1747a1f20c78..011ce79392e8 100644
>> --- a/drivers/net/dsa/bcm_sf2.c
>> +++ b/drivers/net/dsa/bcm_sf2.c
>> @@ -1467,14 +1467,10 @@ static int bcm_sf2_sw_probe(struct 
>> platform_device *pdev)
>>           base++;
>>       }
>> -    priv->clk = devm_clk_get_optional(&pdev->dev, "sw_switch");
>> +    priv->clk = devm_clk_get_optional_enabled(&pdev->dev, "sw_switch");
>>       if (IS_ERR(priv->clk))
>>           return PTR_ERR(priv->clk);
>> -    ret = clk_prepare_enable(priv->clk);
>> -    if (ret)
>> -        return ret;
>> -
>>       priv->clk_mdiv = devm_clk_get_optional(&pdev->dev, 
>> "sw_switch_mdiv");
>>       if (IS_ERR(priv->clk_mdiv)) {
>>           ret = PTR_ERR(priv->clk_mdiv);
> 
> Hi,
> 
> NACK, this patch is wrong because the remove function and the error 
> handling path of the probe need to be updated.

My bad you are right this creates the following regressions: 
devm_clk_get_optional_enabled() registers a devres action that calls 
clk_disable_unprepare() on detach. The patch leaves the manual
clk_disable_unprepare(priv->clk) in two places in 
drivers/net/dsa/bcm_sf2.c: the probe error path (out_clk:) and 
bcm_sf2_sw_remove().

pw-bot: cr
-- 
Florian
