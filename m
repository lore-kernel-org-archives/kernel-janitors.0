From: Vinod Koul <vinod.koul@intel.com>
Date: Mon, 23 Oct 2017 16:51:59 +0000
Subject: Re: [PATCH] dmaengine: ioat: Use common error handling code in ioat_xor_val_self_test()
Message-Id: <20171023165617.GK936@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b28f440e-6d11-d37e-e5de-e6dfd6bce2e9@users.sourceforge.net>
 <20171023072745.nh2mrwez2to6nst4@mwanda>
 <3e96d66a-de9c-5b2b-5646-84037a3935f7@intel.com>
In-Reply-To: <3e96d66a-de9c-5b2b-5646-84037a3935f7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jiang <dave.jiang@intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, SF Markus Elfring <elfring@users.sourceforge.net>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, "Williams, Dan J" <dan.j.williams@intel.com>, Geliang Tang <geliangtang@gmail.com>, Krister Johansen <kjlx@templeofstupid.com>, Pan Bian <bianpan2016@163.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Oct 23, 2017 at 08:59:19AM -0700, Dave Jiang wrote:
> On 10/23/2017 12:27 AM, Dan Carpenter wrote:
> > These patches hurt readability.
> > 
> > regards,
> > dan carpenter
> > 
> 
> I agree with Dan. I'm ok with not accepting this patch.

And I have no intention to :)

At least they should explain why or how it help, give the Coccinelle
scripts.. But sadly that is not done ...

-- 
~Vinod
