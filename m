From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 12 Jan 2016 08:34:40 +0000
Subject: Re: mfd-dm355evm_msp: One function call less in add_child() after error detection
Message-Id: <5694BAA0.80004@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <568284D3.3060006@users.sourceforge.net> <20160111083108.GC14104@x1>
In-Reply-To: <20160111083108.GC14104@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> The platform_device_put() function was called in one case by the
>> add_child() function during error handling even if the passed
>> variable "pdev" contained a null pointer.
>>
>> Implementation details could be improved by the adjustment of jump targets
>> according to the Linux coding style convention.
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> ---
>>  drivers/mfd/dm355evm_msp.c | 21 ++++++++++-----------
>>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> Same comments as before.

To which comments do you refer here?

Are you interested in any further clarification of open issues?

Regards,
Markus
