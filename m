From: Logan Gunthorpe <logang@deltatee.com>
Date: Mon, 27 Nov 2017 17:42:55 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <bed3039c-ad26-1252-2e67-79fa961b6858@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
 <alpine.DEB.2.20.1711260648130.2387@hadrien>
 <1511676085.20482.18.camel@perches.com>
 <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>
 <1511735382.20482.27.camel@perches.com>
 <alpine.DEB.2.20.1711262334370.2111@hadrien>
 <1511745165.20482.34.camel@perches.com>
 <alpine.DEB.2.20.1711270704420.2369@hadrien>
 <1511774737.32426.29.camel@perches.com>
 <6d424a99-7c3a-9d15-5651-030f52367749@deltatee.com>
 <1511803565.32426.52.camel@perches.com>
 <0d316f3a-bcb7-439c-fad3-90ffaad73e59@deltatee.com>
 <1511804476.32426.55.camel@perches.com>
In-Reply-To: <1511804476.32426.55.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On 27/11/17 10:41 AM, Joe Perches wrote:
> It can't be determined if the vaf.fmt contains a \n termination.

Yes, that's why we aren't warning. This could potentially be a false 
negative which you haven't said is a problem up until now. If we have to 
worry about false negatives too then your standards of perfection are 
impossible.

Logan

