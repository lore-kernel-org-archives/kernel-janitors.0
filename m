From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jun 2018 20:32:33 +0000
Subject: Re: [PATCH] kdb: Off by one bugs in kdbgetaddrarg()
Message-Id: <20180620203233.5inugjm3fr4lbhiq@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180620110852.oavyzqhsos5fazma@kili.mountain>
In-Reply-To: <20180620110852.oavyzqhsos5fazma@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jun 20, 2018 at 03:24:19PM -0500, Jason Wessel wrote:
> On 06/20/2018 06:08 AM, Dan Carpenter wrote:
> > If "*nextarg = argc" then we end up reading beyond the end of the
> > argv[] array.
> > 
> > Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index 2ddfce8f1e8f..214d09345056 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -522,7 +522,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
> >   	 *  $environment-variable
> >   	 */
> > -	if (*nextarg > argc)
> > +	if (*nextarg >= argc)
> >   		return KDB_ARGCOUNT;
> 
> 
> Did you happen to test what happened if you made this change?
> 

Sorry, no.  I was using a pretty brain dead script and mostly using
manual review to check the output.  I should have been more careful.

I appologize.

I definitely won't publish the check either because I recognize the
risks here.

regards,
dan carpenter

