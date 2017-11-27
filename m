From: Logan Gunthorpe <logang@deltatee.com>
Date: Mon, 27 Nov 2017 17:20:48 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <a0c147a5-a727-0ce8-a0c3-200fe3b17e4a@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
 <alpine.DEB.2.20.1711260648130.2387@hadrien>
 <1511676085.20482.18.camel@perches.com>
 <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>
 <1511735382.20482.27.camel@perches.com>
 <355029d1-48f5-095e-0d99-bb726d2d56e5@deltatee.com>
 <alpine.DEB.2.20.1711270709390.2369@hadrien>
 <ec39f4f5-cfab-a184-0f27-7f0172e2984f@deltatee.com>
 <alpine.DEB.2.20.1711270732550.2369@hadrien>
 <86f3f594-79f7-c2ce-2cc6-f641bd6f55ae@deltatee.com>
 <1511771322.32426.1.camel@perches.com>
In-Reply-To: <1511771322.32426.1.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On 27/11/17 01:28 AM, Joe Perches wrote:
> checkpatch already reports printks without KERN_<level>
> 
> # printk should use KERN_* levels
> 		if ($line =~ /\bprintk\s*\(\s*(?!KERN_[A-Z]+\b)/) {
> 			WARN("PRINTK_WITHOUT_KERN_LEVEL",
> 			     "printk() should include KERN_<LEVEL> facility level\n" . $herecurr);
> 		}
> 

Yes, but that kind of misses the mark in a similar way a new line 
warning misses the mark. Consider:

printk("blahblah: ");
printk("blah\n");

Check patch will report that both lines are missing a KERN_ level, but 
actually the second line is meant to be a continuation. So someone fixes 
it, naively:

printk(KERN_INFO, "blahblah: ");
printk(KERN_INFO, "blah\n");

Now, checkpatch will not warn on either and it looks like they fixed it, 
even though it's pretty clear that it's not correct either way. With, my 
patch, it will report a missing new line on the first line. If someone 
looked at it, they may realize it's actually missing a KERN_CONT. If we 
use the space heuristic, in this case, the warning might also suggest it 
may be missing a _cont. But the huristic isn't great... maybe the author 
actually meant:

printk(KERN_INFO, "blahblah:\n");
printk(KERN_INFO, "   blah\n");

But I wouldn't say a warning in this case is a bad thing because it 
forces someone to look at something that is obviously wrong in some way.

Logan


