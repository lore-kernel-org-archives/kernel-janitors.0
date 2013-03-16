From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 16 Mar 2013 10:25:23 +0000
Subject: Re: [patch] IB/ipath: add a range check before bumping the stats
Message-Id: <20130316102523.GH9189@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130312110307.GA22921@longonot.mountain>
 <32E1700B9017364D9B60AED9960492BC0D5C926B@FMSMSX108.amr.corp.intel.com>
In-Reply-To: <32E1700B9017364D9B60AED9960492BC0D5C926B-AtyAts71sc88Ug9VwtkbtrfspsVTdybXVpNB7YpNyf8@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Marciniszyn, Mike" <mike.marciniszyn-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: infinipath <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Hefty, Sean" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Fri, Mar 15, 2013 at 01:43:39PM +0000, Marciniszyn, Mike wrote:
> Oddly, I don't see an issue with qib, which masks the opcode.
> 
> Would:
> opcode = (be32_to_cpu(ohdr->bth[0]) >> 24) & 0x7f;
> 
> also correct the issue without adding the if test.   At this point
> the hardware has already validated the opcode, so there is no
> value in the fail handling.
> 
> What args are you using with smatch?
> 

Gar sorry, for the noise.  You can just drop this then.

This is some custom stuff that probably has too many false positives
to push.

Doing an "& 0x7f" would silence the warning but if this is validated
by the hardware then we don't need it.

regards,
dan carpenter

