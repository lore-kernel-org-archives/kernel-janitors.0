From: Jaswinder Singh Rajput <jaswinder@kernel.org>
Date: Sat, 11 Jul 2009 10:44:03 +0000
Subject: Re: [PATCH 5/5] staging/otus: Move a dereference below a NULL test
Message-Id: <1247308323.3032.5.camel@hpdv5.satnam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907110950510.29592@ask.diku.dk>
	 <4A584A94.5010105@gmail.com>  <1247307444.3032.2.camel@hpdv5.satnam>
In-Reply-To: <1247307444.3032.2.camel@hpdv5.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>, "Luis R. Rodriguez" <lrodriguez@atheros.com>
Cc: Julia Lawall <julia@diku.dk>, gregkh@suse.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2009-07-11 at 15:47 +0530, Jaswinder Singh Rajput wrote:
> On Sat, 2009-07-11 at 10:17 +0200, Jiri Slaby wrote:
> > On 07/11/2009 09:51 AM, Julia Lawall wrote:
> > > diff -u -p a/drivers/staging/otus/wwrap.c b/drivers/staging/otus/wwrap.c
> > > --- a/drivers/staging/otus/wwrap.c
> > > +++ b/drivers/staging/otus/wwrap.c
> > > @@ -1016,12 +1016,13 @@ void kevent(struct work_struct *work)
> > >  {
> > >      struct usbdrv_private *macp > > >                 container_of(work, struct usbdrv_private, kevent);
> > > -    zdev_t *dev = macp->device;
> > > +    zdev_t *dev;
> > >  
> > >      if (macp = NULL)
> > >      {
> > >          return;
> > >      }
> > 
> > The test is rather useless here.
> > 
> 
> Why useless, it should be non-null before setting to dev.
> 
> But issue is why function name like kevent() is global and who is using
> it.
> 
> > > +    dev = macp->device;
> > 
> > 
> 

And more funny thing is that all functions are global in this file.

Greg, can you please check the scope of these function, why all are
global.

Thanks,
--
JSR

