From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Dec 2015 08:52:11 +0000
Subject: Re: i2c-core: One function call less in acpi_i2c_space_handler() after error detection
Message-Id: <567E553B.5080005@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201512261449.pmBxYtq3%fengguang.wu@intel.com>
 <567E3CF3.10606@users.sourceforge.net> <20151226074859.GA905@tetsubishi>
In-Reply-To: <20151226074859.GA905@tetsubishi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> The kfree() function was called in one case by the
>> acpi_i2c_space_handler() function during error handling
>> even if the passed variable "client" contained a null pointer.
> 
> This is OK. kfree() is known to be NULL-tolerant and we rely on it in
> various places to keep the code simpler.

I would appreciate if an unnecessary function call can be avoided here
so that the affected exception handling can become also a bit more efficient.

Regards,
Markus
