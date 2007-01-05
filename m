From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 05 Jan 2007 12:21:07 +0000
Subject: Re: [KJ] replace remaining references to "driverfs" with "sysfs"?
Message-Id: <Pine.LNX.4.64.0701050718540.24645@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701040603110.23689@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701040603110.23689@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 4 Jan 2007, Greg KH wrote:

> On Thu, Jan 04, 2007 at 06:07:17AM -0500, Robert P. J. Day wrote:
> >
> >   given that driverfs has, for quite some time, been superseded by
> > sysfs, i did a quick global replacement in the entire source tree:
> >
> >   s/driverfs/sysfs/g
> >
> > just to see what would happen and, amazingly, the result after "make
> > allyesconfig" seems to be building.
> >
> >   this doesn't mean that every instance of that replacement is
> > entirely meaningful -- perhaps some comments are now a bit off-kilter
> > -- but it *does* seem to suggest that every last vestige of driverfs
> > can now finally be thrown out and the kernel will still build.
> >
> >   i've attached the patch against the latest git pull.  any thoughts?
> > thanks.
> >
>
> No objection from me, care to resend it with a signed-off-by: line?
>
> thanks,
>
> greg k-h

hmmmmmm ... even after applying my patch, it seems there are numerous
remaining references to driverfs.  i'm guessing my pattern match was
not general enough, so ignore that previous patch submission while i
take a second look at this.  sorry.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
