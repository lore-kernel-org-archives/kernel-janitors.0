From: "Winkler, Tomas" <tomas.winkler@intel.com>
Date: Wed, 28 Feb 2018 09:52:42 +0000
Subject: RE: [PATCH] mei: remove dev_err message on an unsupported ioctl
Message-Id: <5B8DA87D05A7694D9FA63FD143655C1B9422AF6C@hasmsx108.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180227162105.14113-1-colin.king@canonical.com>
 <5B8DA87D05A7694D9FA63FD143655C1B9422A4CC@hasmsx108.ger.corp.intel.com>
 <20180227181005.GA19944@kroah.com>
 <5B8DA87D05A7694D9FA63FD143655C1B9422A72C@hasmsx108.ger.corp.intel.com>
 <20180228094958.GA12946@kroah.com>
In-Reply-To: <20180228094958.GA12946@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Colin King <colin.king@canonical.com>, Arnd Bergmann <arnd@arndb.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> 
> On Tue, Feb 27, 2018 at 09:44:41PM +0000, Winkler, Tomas wrote:
> > >
> > > On Tue, Feb 27, 2018 at 05:26:22PM +0000, Winkler, Tomas wrote:
> > > > >
> > > > > From: Colin Ian King <colin.king@canonical.com>
> > > > >
> > > > > Currently the driver spams the kernel log on unsupported ioctls
> > > > > which is unnecessary as the ioctl returns -ENOIOCTLCMD to
> > > > > indicate this
> > > anyway.
> > > > > I suspect this was originally for debugging purposes but it
> > > > > really is not required so remove it.
> > > > >
> > > >
> > > > This is rather strange as most of the legimit applications are
> > > > using one IOCTL from kernel 3.0 Do you have any reference where
> > > > this call is
> > > originated from, frankly this is the first time I got such complain.
> > > >
> > > > In any case it would be maybe better to change it a warn once call.
> > >
> > > Just drop the message, it should not be this easy for userspace to
> > > spam the kernel log.  The patch looks fine to me.
> > >
> > Fair enough, add my ack too.
> >
> > Still I'm curious if this comes from the field.
> 
> fuzzers are "in the field" :)

It's definitely fuzzers season.

Tomas

