From: Logan Gunthorpe <logang@deltatee.com>
Date: Sun, 26 Nov 2017 16:55:59 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <85bdbab8-8b7e-91a9-7199-a0e39041aef1@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
 <alpine.DEB.2.20.1711260648130.2387@hadrien>
In-Reply-To: <alpine.DEB.2.20.1711260648130.2387@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>



On 25/11/17 10:51 PM, Julia Lawall wrote:
> I don't understand at all the second sentence.  Are you staying with the
> same call, or moving on to other calls?  Also, it would be the call that
> is split over multiple lines, not the function split over multiple lines.

Yes, you are correct it should be "call" instead of "function".

> I think this would have been much easier with Cocccinelle where the code
> is parsed and the control-flow graph is available to see whether there is
> a pr_cont afterwards.  But if it works, then it is surely good enough.

I don't disagree at all. However, to my knowledge, not a lot of kernel
developers run a set of coccinelle scripts on their change sets. The
point is to catch these mistakes before the patch is submitted.

Logan
