From: Greg KH <gregkh@suse.de>
Date: Sat, 11 Jul 2009 17:03:56 +0000
Subject: Re: [PATCH 5/5] staging/otus: Move a dereference below a NULL test
Message-Id: <20090711170356.GA5205@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907110950510.29592@ask.diku.dk>
 <4A584A94.5010105@gmail.com>
In-Reply-To: <4A584A94.5010105@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>
Cc: Julia Lawall <julia@diku.dk>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jul 11, 2009 at 10:17:24AM +0200, Jiri Slaby wrote:
> On 07/11/2009 09:51 AM, Julia Lawall wrote:
> > diff -u -p a/drivers/staging/otus/wwrap.c b/drivers/staging/otus/wwrap.c
> > --- a/drivers/staging/otus/wwrap.c
> > +++ b/drivers/staging/otus/wwrap.c
> > @@ -1016,12 +1016,13 @@ void kevent(struct work_struct *work)
> >  {
> >      struct usbdrv_private *macp > >                 container_of(work, struct usbdrv_private, kevent);
> > -    zdev_t *dev = macp->device;
> > +    zdev_t *dev;
> >  
> >      if (macp = NULL)
> >      {
> >          return;
> >      }
> 
> The test is rather useless here.

Yes it is. 

Julia, if you just remove the NULL check, will that keep your scripts
happy from noticing such a "problem"?

thanks,

greg k-h
