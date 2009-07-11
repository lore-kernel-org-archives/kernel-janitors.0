From: Julia Lawall <julia@diku.dk>
Date: Sat, 11 Jul 2009 11:58:05 +0000
Subject: Re: [PATCH 5/5] staging/otus: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0907111356400.31089@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907110950510.29592@ask.diku.dk>  <4A584A94.5010105@gmail.com>
 <1247307444.3032.2.camel@hpdv5.satnam> <4A587245.1080304@gmail.com>
 <Pine.LNX.4.64.0907111331170.31089@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907111331170.31089@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>
Cc: Jaswinder Singh Rajput <jaswinder@kernel.org>, gregkh@suse.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 11 Jul 2009, Julia Lawall wrote:

> On Sat, 11 Jul 2009, Jiri Slaby wrote:
> 
> > On 07/11/2009 12:17 PM, Jaswinder Singh Rajput wrote:
> > > On Sat, 2009-07-11 at 10:17 +0200, Jiri Slaby wrote:
> > >> On 07/11/2009 09:51 AM, Julia Lawall wrote:
> > >>> --- a/drivers/staging/otus/wwrap.c
> > >>> +++ b/drivers/staging/otus/wwrap.c
> > >>> @@ -1016,12 +1016,13 @@ void kevent(struct work_struct *work)
> > >>>  {
> > >>>      struct usbdrv_private *macp > > >>>                 container_of(work, struct usbdrv_private, kevent);
> > >>> -    zdev_t *dev = macp->device;
> > >>> +    zdev_t *dev;
> > >>>  
> > >>>      if (macp = NULL)
> > >>>      {
> > >>>          return;
> > >>>      }
> > >>
> > >> The test is rather useless here.
> > >>
> > > 
> > > Why useless, it should be non-null before setting to dev.
> > 
> > Even if work was NULL, macp won't be NULL.
> 
> work could be a small negative number such that calling container_of would 
> return 0.

On the other hand, that does not seem to be possible in this case, since 
work is passed through INIT_WORK, which dereferences the work value.

julia
