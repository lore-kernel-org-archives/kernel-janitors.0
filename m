From: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Date: Wed, 04 Jun 2014 20:03:58 +0000
Subject: RE: [PATCH 9/10] IB/qib: use safer test on the result of find_first_zero_bit
Message-Id: <32E1700B9017364D9B60AED9960492BC21BE939B@fmsmsx120.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401872880-23685-1-git-send-email-Julia.Lawall@lip6.fr>
 <1401872880-23685-10-git-send-email-Julia.Lawall@lip6.fr>
 <32E1700B9017364D9B60AED9960492BC21BE92E6@fmsmsx120.amr.corp.intel.com>
 <alpine.DEB.2.02.1406042118420.1977@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1406042118420.1977-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: infinipath <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Hefty, Sean" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

> 
> No, it's not necessary.  It turns out that the result cannot be greater than the
> requested maximum value.
> 
> Julia

Ok. 

No stable then.

Mike
