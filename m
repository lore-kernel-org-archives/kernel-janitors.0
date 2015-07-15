From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Jul 2015 14:40:43 +0000
Subject: Re: [patch] vhost: NULL vs ERR_PTR bug
Message-Id: <20150715144042.GF5835@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150715111659.GA22854@mwanda>
	<20150715142420-mutt-send-email-mst@redhat.com>
	<55A64574.1090907@bfs.de>
	<alpine.DEB.2.10.1507151020460.2919@hadrien>
In-Reply-To: <alpine.DEB.2.10.1507151020460.2919@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org, Igor Mammedov <imammedo@redhat.com>, walter harms <wharms@bfs.de>

On Wed, Jul 15, 2015 at 10:21:12AM -0400, Julia Lawall wrote:
> At least it looks like one could return the result of vzalloc directly?
> 
> julia

That's a true...  I was tempted to re-write it a bit.  I think one of
the Lustre people are eventually going to export this function and we
will delete this one.

regards,
dan carpenter

