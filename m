From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Sep 2012 11:20:54 +0000
Subject: Re: [Xen-devel] [patch 1/3] xen/privcmd: check for integer overflow in	ioctl
Message-Id: <20120910112053.GW19410@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120908095208.GA608@elgon.mountain> <504DC25F.7000508@citrix.com>
In-Reply-To: <504DC25F.7000508@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Vrabel <david.vrabel@citrix.com>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andres Lagar-Cavilla <andreslc@gridcentric.ca>, kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

On Mon, Sep 10, 2012 at 11:35:11AM +0100, David Vrabel wrote:
> On 08/09/12 10:52, Dan Carpenter wrote:
> > If m.num is too large then the "m.num * sizeof(*m.arr)" multiplication
> > could overflow and the access_ok() check wouldn't test the right size.
> 
> m.num is range checked later on so it doesn't matter that the
> access_ok() checks might be wrong.  A bit subtle, perhaps.
> 

Yeah.  It's too subtle for my static checker but not so subtle for
a human being.  Laziness on my part.

Please drop this patch.

regards,
dan carpenter

