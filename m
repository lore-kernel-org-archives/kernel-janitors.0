From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 23 Jun 2019 05:00:19 +0000
Subject: Re: [PATCH][next] lkdtm: remove redundant initialization of ret
Message-Id: <20190623050019.GC4812@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190614094311.24024-1-colin.king@canonical.com>
 <20190621140347.GA7011@kroah.com>
 <20190621140509.GB7011@kroah.com>
 <201906210920.E133B26C@keescook>
In-Reply-To: <201906210920.E133B26C@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Colin King <colin.king@canonical.com>, Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 21, 2019 at 09:26:05AM -0700, Kees Cook wrote:
> On Fri, Jun 21, 2019 at 04:05:09PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jun 21, 2019 at 04:03:47PM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Jun 14, 2019 at 10:43:11AM +0100, Colin King wrote:
> > > > From: Colin Ian King <colin.king@canonical.com>
> > > > 
> > > > The variable ret is being initialized with the value -EINVAL however
> > > > this value is never read and ret is being re-assigned later on. Hence
> > > > the initialization is redundant and can be removed.
> > > > 
> > > > Addresses-Coverity: ("Unused value")
> > > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > > Acked-by: Kees Cook <keescook@chromium.org>
> > > > ---
> > > >  drivers/misc/lkdtm/core.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> > > > index bba093224813..92df35fdeab0 100644
> > > > --- a/drivers/misc/lkdtm/core.c
> > > > +++ b/drivers/misc/lkdtm/core.c
> > > > @@ -390,7 +390,7 @@ static int __init lkdtm_module_init(void)
> > > >  {
> > > >  	struct crashpoint *crashpoint = NULL;
> > > >  	const struct crashtype *crashtype = NULL;
> > > > -	int ret = -EINVAL;
> > > > +	int ret;
> > > >  	int i;
> > > >  
> > > >  	/* Neither or both of these need to be set */
> > > > -- 
> > > > 2.20.1
> > > > 
> > > 
> > > With this patch now applied, I get this build warning:
> > > drivers/misc/lkdtm/core.c: In function lkdtm_module_init:
> > > drivers/misc/lkdtm/core.c:467:9: warning: ret may be used uninitialized in this function [-Wmaybe-uninitialized]
> > >   return ret;
> > >          ^~~
> > > 
> > > So are you _sure_ it shouldn't be initialized?
> > 
> > In looking at the code in my tree, ret is used uninitialized with this
> > patch, so maybe coverity is wrong, or I don't have all of the needed
> > patches?
> 
> The path went away when the check for debugfs_create_file() was removed.
> I thought that patch was in your tree already?

Ah, other tree, sorry, my fault.  I'll go queue this up to the place
that patch is...

thanks,

greg k-h
