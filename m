From: Joe Perches <joe@perches.com>
Date: Sun, 26 Nov 2017 22:29:42 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <1511735382.20482.27.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
         <alpine.DEB.2.20.1711260648130.2387@hadrien>
         <1511676085.20482.18.camel@perches.com>
         <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>
In-Reply-To: <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Logan Gunthorpe <logang@deltatee.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>

On Sun, 2017-11-26 at 10:38 -0700, Logan Gunthorpe wrote:
> 
> On 25/11/17 11:01 PM, Joe Perches wrote:
> > It doesn't really work.
> 
> That's rather hyperbolic and I don't appreciate the tone.

What I wrote is neither hyperbolic nor tonal.

I'm rather familiar with checkpatch.

High false positive messages are avoided by checkpatch and
new tests with high false positive rates are not accepted.

This proposal has a very high false positive rate.

So, as written.  nack.

Keep at it though.
Maybe something useful will be produced with more effort.

cheers, Joe
