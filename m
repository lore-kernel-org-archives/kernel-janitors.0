From: Joe Perches <joe@perches.com>
Date: Sat, 23 May 2015 18:13:31 +0000
Subject: Re: [PATCH] checkpatch: Categorize some long line length checks
Message-Id: <1432404811.2846.4.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
	 <1432237849-53947-11-git-send-email-shuey@purdue.edu>
	 <1432242004.20840.68.camel@perches.com>
	 <1432362494.29657.40.camel@perches.com>
	 <alpine.DEB.2.10.1505231331050.2554@hadrien>
	 <1432402012.29657.52.camel@perches.com> <20150523180729.GZ22558@mwanda>
In-Reply-To: <20150523180729.GZ22558@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Andrew Morton <akpm@linux-foundation.org>, oleg.drokin@intel.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org, Mike Shuey <shuey@purdue.edu>

On Sat, 2015-05-23 at 21:07 +0300, Dan Carpenter wrote:
> I feel like the lustre headers could be fit into 80 characters without
> losing very much.

Maybe.

> No one uses the complicated options on checkpatch anyway, they just grep
> away the warnings they don't like.

That'd be false.  Other projects like u-boot do.

> Newbies especially don't use them.

True, but capability exclusion doesn't seem the
right path.

