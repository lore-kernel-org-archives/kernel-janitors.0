From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Jul 2015 11:41:06 +0000
Subject: Re: [patch] vhost: NULL vs ERR_PTR bug
Message-Id: <20150715114106.GD5784@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150715111659.GA22854@mwanda>
	<20150715142420-mutt-send-email-mst@redhat.com>
	<55A64574.1090907@bfs.de>
In-Reply-To: <55A64574.1090907@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Igor Mammedov <imammedo@redhat.com>, virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>

On Wed, Jul 15, 2015 at 01:35:16PM +0200, walter harms wrote:
> Is this function needed at all ?
> 

It tries to kmalloc() memory and if it can't then it tries to vmalloc()
it.  There are a bunch of these functions.  Eventually someone should
put one in a common header.

regards,
dan carpenter
