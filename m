From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Jun 2013 15:57:32 +0000
Subject: Re: [patch] FMC: NULL dereference on allocation failure
Message-Id: <20130619155731.GA4957@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130619144904.GA10484@elgon.mountain>
 <20130619152528.GA16430@mail.gnudd.com>
In-Reply-To: <20130619152528.GA16430@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Rubini <rubini@gnudd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 19, 2013 at 05:25:28PM +0200, Alessandro Rubini wrote:
> > If we don't allocate "arr" then the cleanup path will dereference it and
> > oops.
> 
> You are right, thanks (acked).
> 
> How is the procedure here? I don't have my own git tree on
> kernel.org for pull requests. Can this go through the janitors?
> 
> (if it makes sense, I can try the procedure to have a tree, but last
> time I checked it was strictly denied to anyone).


Apparently these are going through Greg K-H.  I'll resend, with Greg
CC'd so he can pick it up from the mailing list.

Could you add an entry to the MAINTAINERS file so that Greg will be
CC'd automatically using get_maintainer.pl?  Is there a dedicated
list for FMC development?  That would go in the MAINTAINERS file as
well.

regards,
dan carpenter

