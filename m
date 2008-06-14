From: Greg KH <greg@kroah.com>
Date: Sat, 14 Jun 2008 00:28:02 +0000
Subject: Re: [ANNOUNCE] linux-staging tree created
Message-Id: <20080614002802.GD25585@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080610190540.GA25066@kroah.com> <43e72e890806130714k535b041evaf750209ea492c47@mail.gmail.com> <20080613143328.GA16506@tuxdriver.com>
In-Reply-To: <20080613143328.GA16506-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Fri, Jun 13, 2008 at 10:33:29AM -0400, John W. Linville wrote:
> On Fri, Jun 13, 2008 at 07:14:32AM -0700, Luis R. Rodriguez wrote:
> 
> > This is great. To let this be useful for wireless we'll need
> > wireless-testing.git merged as we rely on it for the latest and
> > greatest. Is this a possibility?
> 
> > We have a few drivers which are not yet ready for
> > wireless-testing.git. Airgo is one.
> > 
> > Anyway, good stuff. Let me know what you think about letting this work
> > for wireless too.
> 
> I don't think directly pulling wireless-testing is a good idea of
> -staging for process-related reasons.  However I think we can arrange
> to send something for the new tree.  at76, airgo, and mrv8k are all
> decent candidates.

Sounds good to me.

> Greg, how does the -staging tree get managed?  Is it periodically
> rebuilt (like -next)?  Or would I need to send you pull requests?

Just send me patches, it's a quilt tree.

thanks,

greg k-h
