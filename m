From: Logan Gunthorpe <logang@deltatee.com>
Date: Sun, 26 Nov 2017 18:33:35 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <e22b6039-0696-c9f7-7585-4597c40c1846@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
 <alpine.DEB.2.20.1711260648130.2387@hadrien>
 <85bdbab8-8b7e-91a9-7199-a0e39041aef1@deltatee.com>
 <alpine.DEB.2.20.1711261807590.2111@hadrien>
 <3fc88c02-b9b6-80a3-0c41-63e0806d34aa@deltatee.com>
 <alpine.DEB.2.20.1711261912150.2111@hadrien>
In-Reply-To: <alpine.DEB.2.20.1711261912150.2111@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>



On 26/11/17 11:17 AM, Julia Lawall wrote:
> The main limitation that is likely to remain in my script is that
> Coccinelle doesn't always understand ifdefs properly.  So
> #ifdef
> printk("xxx");
> #else
> printk("yyy");
> #endif
> pr_cont("zzz");
> 
> may give a warning about the first printk.

Yes, that's another clever corner case I didn't think of. My patch will
have the same issue. But that's terrible style[1] and I should hope it's
quite rare.

> 0-day only runs on changed files and only reports on changed code, to
> the best of my understanding, so I don't think it is a problem.

Oh, cool.

Logan

[1]
https://www.kernel.org/doc/html/latest/process/coding-style.html#conditional-compilation
