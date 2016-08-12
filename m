From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Aug 2016 13:05:30 +0000
Subject: Re: staging: ks7010: Replace three printk() calls by pr_err()
Message-Id: <1ae7a67e-8fd4-3b37-7045-e60707df11d0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <901acc3c-ff1b-6f0c-b744-2bfb36de18d8@users.sourceforge.net>
 <1468787163.1900.1.camel@perches.com> <20160720155500.GG1688@katana>
 <5911a2e6-6862-7b72-b69a-dcc32658b85b@users.sourceforge.net>
 <20160811070502.GA1665@katana>
In-Reply-To: <20160811070502.GA1665@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>>> Can't we use dev_* on the SDIO device?
>>
>> How should a connection be constructed from the data structure "sdio_device_id"
>> to the corresponding device information for such an use case?
> 
> What did you try so far?

Nothing what I would find noteworthy for increasing the usage of a function
like "dev_err".

Are you on "a mission" to improve software around logging calls a bit more?

Regards,
Markus
