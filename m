From: David Daney <ddaney@caviumnetworks.com>
Date: Tue, 23 May 2017 18:59:22 +0000
Subject: Re: [PATCH] MIPS: Octeon: Delete an error message for a failed memory allocation in octeon_irq_init_
Message-Id: <8d364af1-62c0-db76-a912-7e1baf298948@caviumnetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7995eb17-f2ec-54ad-f4d4-7b3dd8337d33@users.sourceforge.net>
 <1495565752.2093.69.camel@perches.com>
In-Reply-To: <1495565752.2093.69.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, SF Markus Elfring <elfring@users.sourceforge.net>, linux-mips@linux-mips.org, Dan Carpenter <dan.carpenter@oracle.com>, David Daney <david.daney@cavium.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, "Steven J. Hill" <steven.hill@cavium.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 05/23/2017 11:55 AM, Joe Perches wrote:
> On Tue, 2017-05-23 at 20:10 +0200, SF Markus Elfring wrote:
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Tue, 23 May 2017 20:00:06 +0200
>>
>> Omit an extra message for a memory allocation failure in this function.
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> ---
>>   arch/mips/cavium-octeon/octeon-irq.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
>> index c1eb1ff7c800..050c08ece5b6 100644
>> --- a/arch/mips/cavium-octeon/octeon-irq.c
>> +++ b/arch/mips/cavium-octeon/octeon-irq.c
>> @@ -1615,7 +1615,6 @@ static int __init octeon_irq_init_gpio(
>>   		irq_domain_add_linear(
>>   			gpio_node, 16, &octeon_irq_domain_gpio_ops, gpiod);
>>   	} else {
>> -		pr_warn("Cannot allocate memory for GPIO irq_domain.\n");
>>   		return -ENOMEM;
>>   	}
> 
> You really should reverse the test here and
> unindent the first block.
> 
> Again:  Don't be mindless.
>          Take the time to improve the code.

Quite right.

For  Markus Elfring's version: NAK

For Joe's version:

Acked-by: David Daney <david.daney@cavium.com>



> ---
> diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octe
> index c1eb1ff7c800..2bdc750f2f2d 100644
> --- a/arch/mips/cavium-octeon/octeon-irq.c
> +++ b/arch/mips/cavium-octeon/octeon-irq.c
> @@ -1609,15 +1609,13 @@ static int __init octeon_irq_init_gpio(
>   	}
>   
>   	gpiod = kzalloc(sizeof(*gpiod), GFP_KERNEL);
> -	if (gpiod) {
> -		/* gpio domain host_data is the base hwirq number. */
> -		gpiod->base_hwirq = base_hwirq;
> -		irq_domain_add_linear(
> -			gpio_node, 16, &octeon_irq_domain_gpio_ops, gpiod);
> -	} else {
> -		pr_warn("Cannot allocate memory for GPIO irq_domain.\n");
> +	if (!gpiod)
>   		return -ENOMEM;
> -	}
> +
> +	/* gpio domain host_data is the base hwirq number. */
> +	gpiod->base_hwirq = base_hwirq;
> +	irq_domain_add_linear(gpio_node, 16,
> +			      &octeon_irq_domain_gpio_ops, gpiod);
>   
>   	/*
>   	 * Clear the OF_POPULATED flag that was set by of_irq_init()
> 

