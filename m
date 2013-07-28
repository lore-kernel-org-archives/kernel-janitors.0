From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 28 Jul 2013 16:43:55 +0000
Subject: Re: [PATCH v2 1/2] staging: lustre: Fix non-ANSI sparse warnings
Message-Id: <20130728164355.GA8320@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1374964736-10863-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1374964736-10863-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jul 28, 2013 at 06:19:29PM +0200, walter harms wrote:
> 
> 
> Am 28.07.2013 00:38, schrieb Emil Goode:
> > This patch fixes a lot of non-ANSI sparse warnings by adding void to
> > parameterless functions.
> > 
> > Signed-off-by: Emil Goode <emilgoode@gmail.com>
> > ---
> > v2: A bit more specific commit message.
> > 
> >  .../lustre/lnet/klnds/socklnd/socklnd_lib-linux.c        |    6 +++---
> >  drivers/staging/lustre/lnet/lnet/api-ni.c                |    2 +-
> >  drivers/staging/lustre/lnet/selftest/console.c           |    2 +-
> >  .../staging/lustre/lustre/libcfs/linux/linux-tracefile.c |   14 +++++++-------
> >  drivers/staging/lustre/lustre/ptlrpc/pack_generic.c      |    2 +-
> >  drivers/staging/lustre/lustre/ptlrpc/pinger.c            |    4 ++--
> >  6 files changed, 15 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c
> > index 3e08fe2..76e442b 100644
> > --- a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c
> > +++ b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd_lib-linux.c
> > @@ -325,20 +325,20 @@ ksocknal_lib_tunables_init ()
> >  }
> >  
> >  void
> > -ksocknal_lib_tunables_fini ()
> > +ksocknal_lib_tunables_fini(void)
> >  {
> >  	if (ksocknal_tunables.ksnd_sysctl != NULL)
> >  		unregister_sysctl_table(ksocknal_tunables.ksnd_sysctl);
> >  }
> 
> this is not needed as unregister_sysctl_table() can handle NULL

There's lots of cleanup needed in this code, but as that's a separate
thing from what the original poster was doing here, it isn't relevant
for this patch.

Follow-on patches are always welcome...

greg k-h
