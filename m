From: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Date: Fri, 15 Mar 2013 13:43:39 +0000
Subject: RE: [patch] IB/ipath: add a range check before bumping the stats
Message-Id: <32E1700B9017364D9B60AED9960492BC0D5C926B@FMSMSX108.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130312110307.GA22921@longonot.mountain>
In-Reply-To: <20130312110307.GA22921-dZEljifmRObu9KfB+GxooP8+0UxHXcjY@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, infinipath <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Hefty, Sean" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Oddly, I don't see an issue with qib, which masks the opcode.

Would:
opcode = (be32_to_cpu(ohdr->bth[0]) >> 24) & 0x7f;

also correct the issue without adding the if test.   At this point the hardware has already validated the opcode, so there is no value in the fail handling.

What args are you using with smatch?

Mike

> My static checker complains that this could corrupt memory.  It seems valid to
> add a range check here.
> 
