From: Logan Gunthorpe <logang@deltatee.com>
Date: Mon, 27 Nov 2017 22:56:57 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <3ddea7e4-24bd-eadc-18ff-ab5aa5d81e58@deltatee.com>
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
 <a0c147a5-a727-0ce8-a0c3-200fe3b17e4a@deltatee.com>
 <1511803686.32426.54.camel@perches.com>
 <322acd87-7708-cc90-c3d1-caad7bd023e5@deltatee.com>
 <1511804568.32426.56.camel@perches.com>
 <f2f5622f-5c5f-3dbf-1d7e-bc49e9c57dae@deltatee.com>
 <1511809027.32426.62.camel@perches.com>
 <993ca1c1-6d27-2ee1-94ed-41e8249755bd@deltatee.com>
 <alpine.DEB.2.20.1711272146310.2405@hadrien>
In-Reply-To: <alpine.DEB.2.20.1711272146310.2405@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On 27/11/17 01:49 PM, Julia Lawall wrote:
> Perhaps if there is a possible flow from one print to another within a
> single function and in both cases the format string is at least say 25
> characters (completely random value), then it is pretty likely that a
> newline is intended.

This is on the edge of what I think could be done with checkpatch. I did 
a quick look through some of the cases I've noticed and haven't found 
any that this wouldn't pass. I'm not sure how you'd pick an appropriate 
threshold though. I do think it's quite clever, though.

> Alternatively, if the first format string doesn't end in a space and the
> second one doesn't begin with a space, then a newline is also likely
> intended.

This makes more sense to me but I don't expect it to be 100% accurate 
either. See, for example, drivers/char/dtlk.c:640 which has no space in 
either printk. You could maybe expand the rule to include ':' and '(' as 
the last character.

Logan
