From: Logan Gunthorpe <logang@deltatee.com>
Date: Mon, 27 Nov 2017 16:40:42 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <26cef4df-1876-ed37-7d0c-620acc638295@deltatee.com>
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
 <alpine.DEB.2.20.1711270951450.3445@hadrien>
In-Reply-To: <alpine.DEB.2.20.1711270951450.3445@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On 27/11/17 01:52 AM, Julia Lawall wrote:
> I meant why not only suggest pr_cont?

You could. Not much difference though, both are discouraged.

Logan
