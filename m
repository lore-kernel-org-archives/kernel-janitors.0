From: Denis Efremov <efremov@linux.com>
Date: Fri, 14 Aug 2020 14:36:34 +0000
Subject: Re: [PATCH] coccinelle: api: add sprintf() support to device_attr_show
Message-Id: <0a9015b6-9037-59c5-31f2-cd2b32c86b50@linux.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ed9a8046-4c21-e849-f68b-9e08991b701d@web.de>
 <8e76e81f-970b-b1f7-840d-10506dc3311a@linux.com>
 <48ffa436-6e73-88b2-07bc-89942f3c6d8e@web.de>
In-Reply-To: <48ffa436-6e73-88b2-07bc-89942f3c6d8e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Coccinelle <cocci@systeme.lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 8/14/20 3:30 PM, Markus Elfring wrote:
>>> You propose to use a nested SmPL disjunction for desired adjustments.
>>> I suggest to start a corresponding case distinction behind
>>> the key word “return” instead of repeating it three times.
>>
>> It doesn't work.
> 
> How do you think about to apply a SmPL rule variant like the following?
> 
> @rp depends on patch@
> identifier show, dev, attr, buf;
> constant str;
> @@
> 
> ssize_t show(struct device *dev, struct device_attribute *attr, char *buf)
> {
> 	<...
> 	return
> (
> -		snprintf
> +		sprintf
> 			(
> 			buf,
> -			\(PAGE_SIZE\|PAGE_SIZE - 1\),
> (			str
> |
> (			"%i"\|"%i\n"\|"%li"\|"%li\n"\|"%lli"\|"%lli\n"\|
> 			"%d"\|"%d\n"\|"%ld"\|"%ld\n"\|"%lld"\|"%lld\n"\|
> 			"%u"\|"%u\n"\|"%lu"\|"%lu\n"\|"%llu"\|"%llu\n"\|
> 			"%x"\|"%x\n"\|"%lx"\|"%lx\n"\|"%llx"\|"%llx\n"\|
> 			"%X"\|"%X\n"\|"%lX"\|"%lX\n"\|"%llX"\|"%llX\n"\|
> 			"0x%x"\|"0x%x\n"\|"0x%lx"\|"0x%lx\n"\|"0x%llx"\|"0x%llx\n"\|
> 			"0x%X"\|"0x%X\n"\|"0x%lX"\|"0x%lX\n"\|"0x%llX"\|"0x%llX\n"\|
> 			"%02x\n"\|"%03x\n"\|"%04x\n"\|"%08x\n"\|
> 			"%02X\n"\|"%03X\n"\|"%04X\n"\|"%08X\n"\|
> 			"0x%02x\n"\|"0x%03x\n"\|"0x%04x\n"\|"0x%08x\n"\|
> 			"0x%02X\n"\|"0x%03X\n"\|"0x%04X\n"\|"0x%08X\n"\|
> 			"%zd"\|"%zd\n"\|"%zu"\|"%zu\n"\|"%zx"\|"%zx\n"\|
> 			"%c"\|"%c\n"\|"%p"\|"%p\n"\|"%pU\n"\|"%pUl\n"\|"%hu\n"
> )			,
> 			...
> )
> 			)
> |
> -		snprintf
> +		scnprintf
> 			(...)
> );
> 	...>
> }
> 

3 levels of nested disjunctions makes this pattern completely unreadable
and gives no comparable benefits. I don't think we should care much about
number of characters in the kernel sources, gzip will do a better job
anyway.


Thanks,
Denis
