From: Greg KH <greg@kroah.com>
Date: Wed, 11 Jun 2008 16:23:03 +0000
Subject: Re: Template of what you're after? (Was [ANNOUNCE] linux-staging
Message-Id: <20080611162303.GA22134@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080610190540.GA25066@kroah.com> <1213146346.16146.17.camel@nigel-laptop> <20080611032948.GB4483@kroah.com> <1213157025.16146.40.camel@nigel-laptop>
In-Reply-To: <1213157025.16146.40.camel@nigel-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nigel Cunningham <nigel@tuxonice.net>
Cc: linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, Jun 11, 2008 at 02:03:45PM +1000, Nigel Cunningham wrote:
> Hi again.
> 
> On Tue, 2008-06-10 at 20:29 -0700, Greg KH wrote:
> > Is the patch "stand-alone", only adding new code in discrete chunks like
> > a new driver or filesystem would?
> 
> Just another thought - I should have said that I don't really know what
> patches to add a new driver or filesystem look like. I can only imagine
> a filesystem going in all-in-one-patch, so I'd probably appreciate an
> example/template to work off, as might others.

If you look in the -staging tree, there are 17 "template/example"
patches in there to go off of :)

Basically, one patch per feature.  It sounds like the tuxonice is much
too big for this kind of thing.

Just respin your patches and post them to lkml for review.  You should
be able to set up your own tree for inclusion in linux-next if they are
ready to go in.

thanks,

greg k-h
