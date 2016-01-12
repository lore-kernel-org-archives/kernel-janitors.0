From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 12 Jan 2016 12:20:33 +0000
Subject: Re: mfd-dm355evm_msp: One function call less in add_child() after error detection
Message-Id: <5694EF91.70609@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <568284D3.3060006@users.sourceforge.net> <20160112115906.GD27358@x1>
In-Reply-To: <20160112115906.GD27358@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> The subject format is wrong

Which format do you expect?


> and the summary itself isn't very informative.

Which wording do you find more useful?


>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Tue, 29 Dec 2015 13:56:42 +0100
> 
> This patch format is wrong,

You might find the use of additional fields in the message body unusual.
I have got an other impression from the canonical patch format.


> please consider using `git format-patch` and `git send-email`.

Thanks for your suggestion.


>> The platform_device_put() function was called in one case by the
>> add_child() function during error handling even if the passed
>> variable "pdev" contained a null pointer.
>>
>> Implementation details could be improved by the adjustment of jump targets
>> according to the Linux coding style convention.

I am going to integrate the source code changes that you requested a bit later.


>> +report_failure:
>> +	dev_err(&client->dev, "can't add %s dev\n", name);
> 
> This isn't a very friendly error message.  Better to convert the
> dev_dbg() calls to dev_err() and tell the user what the problem was.

Which information display would be more appropriate here?

Regards,
Markus
