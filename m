From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Dec 2017 21:56:51 +0000
Subject: Re: Difficulties for compilation without extra optimisation
Message-Id: <bd57d7d5-c8f5-0bc9-c96f-37550557dca3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7f072f78-eef4-6d87-d233-cee71dac5a32@users.sourceforge.net>
 <a2ac6d05-fdd6-82bb-075e-b7eb81b516fe@users.sourceforge.net>
 <1512314250.3673.6.camel@primarydata.com>
 <20171203162256.4ea0750d@vmware.local.home>
In-Reply-To: <20171203162256.4ea0750d@vmware.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Why would you compile the kernel without optimization?

I would like to see how big an effect finally is in such a build configuration
after specific source code adjustments.


> There's many places in the kernel that WILL NOT BUILD without optimization.

I did not really know this detail so far.

I noticed that the optimised build variants worked during my test comparisons.


> In fact, we do a lot of tricks to make sure that things work the way
> we expect it to, because we add broken code that only gets compiled out
> when gcc optimizes the code the way we expect it to be,
> and the kernel build will break otherwise.

Thanks for your information.

Can the software areas distinguished where such special handling matters?

Regards,
Markus
