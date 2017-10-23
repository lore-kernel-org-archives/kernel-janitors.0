From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Oct 2017 17:39:21 +0000
Subject: Re: dmaengine: ioat: Use common error handling code in ioat_xor_val_self_test()
Message-Id: <ef4d8039-6d5c-5d31-515b-eda9f05faff6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b28f440e-6d11-d37e-e5de-e6dfd6bce2e9@users.sourceforge.net>
 <20171023072745.nh2mrwez2to6nst4@mwanda>
 <3e96d66a-de9c-5b2b-5646-84037a3935f7@intel.com>
 <20171023165617.GK936@localhost>
In-Reply-To: <20171023165617.GK936@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Vinod Koul <vinod.koul@intel.com>, Dave Jiang <dave.jiang@intel.com>, dmaengine@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>, "Williams, Dan J" <dan.j.williams@intel.com>, Geliang Tang <geliangtang@gmail.com>, Krister Johansen <kjlx@templeofstupid.com>, Pan Bian <bianpan2016@163.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> I agree with Dan. I'm ok with not accepting this patch.
> 
> And I have no intention to :)

This is a pity.


> At least they should explain why or how it help,

Do you see useful consequences (like a bit less memory requirements)
if the assignment statement “err = -ENODEV” will be stored only once
behind the jump label “failure_indication” in the suggested update
for the implementation of the function “ioat_xor_val_self_test”
(instead of being duplicated several times)?


> give the Coccinelle scripts..

How can they matter for a better understanding of the concrete
source code adjustment?


> But sadly that is not done ...

I did not include a link for special background information explicitly.
But how do you think about corresponding details from discussions
on a topic like “Comparing statement lists with SmPL”?

https://systeme.lip6.fr/pipermail/cocci/2017-August/004388.html

Regards,
Markus
