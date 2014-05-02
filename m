From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 May 2014 23:56:16 +0000
Subject: Re: [patch] RDMA/cxgb4: info leak in c4iw_alloc_ucontext()
Message-Id: <20140502235616.GJ4963@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140328082428.GH25192@mwanda>
 <1396002468.3297.63.camel@localhost.localdomain>
In-Reply-To: <1396002468.3297.63.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yann Droneaud <ydroneaud-RlY5vtjFyJ3QT0dZR+AlfA@public.gmane.org>
Cc: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, roland-BHEL68pLQRGGvPXPguhicg@public.gmane.org, dm-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org, leedom-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org, santosh-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org, kumaras-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org, nirranjan-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org, hariprasad-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org, Steve Wise <swise-7bPotxP6k4+P2YhJcF5u+vpXobYPEAuW@public.gmane.org>

On Fri, Mar 28, 2014 at 11:27:48AM +0100, Yann Droneaud wrote:
> Unfortunately, it's not the only structure which has this problem. I'm
> currently preparing a report on this issue for this driver (cxgb4) and
> another.
> 

This information leak is still present in linux-next.  These days we
count those things as security vulnerabilities with CVEs and everything.

When is it likely to get fixed?

regards,
dan carpenter
