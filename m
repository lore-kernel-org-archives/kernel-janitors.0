From: Logan Gunthorpe <logang@deltatee.com>
Date: Mon, 27 Nov 2017 06:27:54 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <ec39f4f5-cfab-a184-0f27-7f0172e2984f@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
 <alpine.DEB.2.20.1711260648130.2387@hadrien>
 <1511676085.20482.18.camel@perches.com>
 <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>
 <1511735382.20482.27.camel@perches.com>
 <355029d1-48f5-095e-0d99-bb726d2d56e5@deltatee.com>
 <alpine.DEB.2.20.1711270709390.2369@hadrien>
In-Reply-To: <alpine.DEB.2.20.1711270709390.2369@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On 26/11/17 11:11 PM, Julia Lawall wrote:
> I don't have a different warning if the string ends in a space.  I have a
> different warning when one possible control-flow path is fine and another
> control-flow path is not.  The space thing relates to guessing whether
> some other printing API function needs a newline or not.

Understood. For checkpatch, there only is warnings (of various types)
and I was referring to the guessing you mentioned. So if we see that a
call has no new line and the following one isn't a KERN_CONT, then based
on whether there's a space or not we potentially could have one of two
warnings:

WARNING: Log messages should end in a new line (\n)

or

WARNING: Given that your log message ends in a space and not a new line,
did you maybe mean to put a KERN_CONT or pr_cont somewhere in there?? By
the way, though, KERN_CONT use is discouraged and will create its own
warning when you fix it.

Logan
