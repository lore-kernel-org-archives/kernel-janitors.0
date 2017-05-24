From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 May 2017 16:01:39 +0000
Subject: Re: [PATCH] MIPS: Octeon: Delete an error message for a failed memory allocation in octeon_irq_init_
Message-Id: <71a2ce6a-968c-b13c-95b0-610f0c1bab03@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7995eb17-f2ec-54ad-f4d4-7b3dd8337d33@users.sourceforge.net>
 <1495565752.2093.69.camel@perches.com>
In-Reply-To: <1495565752.2093.69.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: linux-mips@linux-mips.org, Dan Carpenter <dan.carpenter@oracle.com>, David Daney <david.daney@cavium.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, "Steven J. Hill" <steven.hill@cavium.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> +++ b/arch/mips/cavium-octeon/octeon-irq.c
>> @@ -1615,7 +1615,6 @@ static int __init octeon_irq_init_gpio(
>>  		irq_domain_add_linear(
>>  			gpio_node, 16, &octeon_irq_domain_gpio_ops, gpiod);
>>  	} else {
>> -		pr_warn("Cannot allocate memory for GPIO irq_domain.\n");
>>  		return -ENOMEM;
>>  	}
> 
> You really should reverse the test here and
> unindent the first block.

Thanks for your improved source code transformation.

I am curious if I will stumble on a similar change possibility once more
for remaining update candidates in other software areas.

Regards,
Markus
