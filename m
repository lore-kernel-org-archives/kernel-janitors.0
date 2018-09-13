From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 13 Sep 2018 12:55:57 +0000
Subject: Re: [PATCH] firmware: vpd: fix spelling mistake "partion" -> "partition"
Message-Id: <20180913125557.GA25003@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180911165858.3015-1-colin.king@canonical.com>
 <50220bc9-326f-7a93-fecb-9b67fbac98b9@roeck-us.net>
 <20180912052448.GA8481@kroah.com>
 <20180912211011.GA20199@roeck-us.net>
In-Reply-To: <20180912211011.GA20199@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Colin King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 12, 2018 at 02:10:11PM -0700, Guenter Roeck wrote:
> On Wed, Sep 12, 2018 at 07:24:48AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Sep 11, 2018 at 09:58:48PM -0700, Guenter Roeck wrote:
> > > On 09/11/2018 09:58 AM, Colin King wrote:
> > > > From: Colin Ian King <colin.king@canonical.com>
> > > > 
> > > > Trivial fix to spelling mistake in comment
> > > > 
> > > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > 
> > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > > 
> > > Interesting - drivers/firmware/google/ does not have a maintainer.
> > > Greg - is it correct to assume that you are the de-facto maintainer ?
> > 
> > Yeah, I am :(
> > 
> 
> Hmm .. the :( doesn't sound too happy. Do you think we should have one ?

It's no fun when a driver ends up in the tree and no maintainer is
assigned to it, as that means I need to manage it myself.  I've been
doing so since 2011, so it's not exactly a new experience, but as I have
no hardware for this, and honestly don't care at all about these
drivers, it's a very low priority for me to do anything with patches for
these files...

thanks,

greg k-h
