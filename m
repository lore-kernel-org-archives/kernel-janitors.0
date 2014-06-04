From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 04 Jun 2014 19:19:13 +0000
Subject: RE: [PATCH 9/10] IB/qib: use safer test on the result of find_first_zero_bit
Message-Id: <alpine.DEB.2.02.1406042118420.1977@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401872880-23685-1-git-send-email-Julia.Lawall@lip6.fr> <1401872880-23685-10-git-send-email-Julia.Lawall@lip6.fr> <32E1700B9017364D9B60AED9960492BC21BE92E6@fmsmsx120.amr.corp.intel.com>
In-Reply-To: <32E1700B9017364D9B60AED9960492BC21BE92E6-RjuIdWtd+YbTXloPLtfHfbfspsVTdybXVpNB7YpNyf8@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Marciniszyn, Mike" <mike.marciniszyn-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, infinipath <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Hefty, Sean" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, 4 Jun 2014, Marciniszyn, Mike wrote:

> > Subject: [PATCH 9/10] IB/qib: use safer test on the result of find_first_zero_bit
> > 
> > From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Thanks for the patch!
> 
> Roland, I'm marking this as stable since a memory corruption can occur in the _set_bit().

No, it's not necessary.  It turns out that the result cannot be greater 
than the requested maximum value.

julia
