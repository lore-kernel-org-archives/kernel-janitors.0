From: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Date: Wed, 19 Feb 2014 20:46:23 +0000
Subject: RE: [patch] IB/qib: cleanup qib_register_observer()
Message-Id: <32E1700B9017364D9B60AED9960492BC211F6211@FMSMSX107.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140130121231.GA17753@elgon.mountain>
In-Reply-To: <20140130121231.GA17753-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, infinipath <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Hefty, Sean" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

> Subject: [patch] IB/qib: cleanup qib_register_observer()
> 
> Returning directly is easier to read than do-nothing gotos.  Remove the
> duplicative check on "olp" and pulled the code in one indent level.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
