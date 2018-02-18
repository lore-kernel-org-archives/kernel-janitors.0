From: Tejun Heo <tj@kernel.org>
Date: Sun, 18 Feb 2018 13:22:56 +0000
Subject: Re: [PATCH] sata_dwc_460ex: Delete an error message for a failed memory allocation in sata_dwc_port_
Message-Id: <20180218132256.GC695913@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3ba388af-286a-df63-e78f-c82c1d084439@users.sourceforge.net>
 <1518773953.22495.366.camel@linux.intel.com>
In-Reply-To: <1518773953.22495.366.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-ide@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Feb 16, 2018 at 11:39:13AM +0200, Andy Shevchenko wrote:
> On Thu, 2018-02-15 at 22:22 +0100, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 15 Feb 2018 22:15:25 +0100
> > 
> > Omit an extra message for a memory allocation failure in this
> > function.
> > 
> > This issue was detected by using the Coccinelle software.
> 
> Tejun, it's up to you. In case you are fine with the change,

Yeah, these are marginal at best and one may be able to argue that
emitting a message with device identifier is still useful but these
allocations are order-zero and can't fail to begin with, so...

Thanks.

-- 
tejun
