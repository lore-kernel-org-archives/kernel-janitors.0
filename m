From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 21 Sep 2015 22:29:33 +0000
Subject: Re: [patch] IB/hfi1: checking for NULL instead of IS_ERR
Message-Id: <20150921222933.GA21618@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150916062220.GC21542@mwanda>
 <55FC32ED.1000404@redhat.com>
 <20150919030153.GA30373@kroah.com>
 <56002564.6000100@redhat.com>
 <20150921164846.GB27380@kroah.com>
 <56003878.7080409@redhat.com>
In-Reply-To: <56003878.7080409-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

On Mon, Sep 21, 2015 at 01:03:52PM -0400, Doug Ledford wrote:
> On 09/21/2015 12:48 PM, Greg Kroah-Hartman wrote:
> 
> > But, that's already not happening, as is obvious by my inbox.
> 
> Yeah, I see that.
> 
> > So, how about you forward on what you have so far to me, and I'll keep
> > these.  Otherwise you will end up with nasty merge issues very quickly
> > as people will continue to send stuff to me.
> 
> As you wish.  I pulled in a number of patches related to hfi1, but I've
> already sent the pull request to Linus and they made it as of 4.1-rc2.
> So, just start from there and you will have all the patches I've taken.

Sounds good, thanks.

greg k-h
