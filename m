From: Joe Eloff <kagen101@gmail.com>
Date: Mon, 05 Jul 2010 20:53:37 +0000
Subject: Re: ERROR: do not initialise externals to 0 or NULL
Message-Id: <1278363217.5396.40.camel@dermezel>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278346615.5396.3.camel@dermezel>
In-Reply-To: <1278346615.5396.3.camel@dermezel>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 2010-07-05 at 22:45 +0200, Dan Carpenter wrote:
> On Mon, Jul 05, 2010 at 10:19:29PM +0200, Joe Eloff wrote:
> > Hi Dan,
> > 
> > Here is the line of code:
> > /* Error variable.  Zero means no error. */
> > int dt3155_errno = 0;
> > 
> > no extern results in following error:
> > ERROR: do not initialise externals to 0 or NULL
> > 
> > It is declared in the globals scope at the top of the file just after
> > includes not in any function.
> > 
> > Have no idea why or how to make it go away??
> 
> Wouldn't "global" be a better word than "external"?  Anyway, global
> variables default to being zero so they don't need to be initialized.
> 
> /* Error variable.  Zero means no error. */
> int dt3155_errno;
> 
> But really this global variable is pretty ugly.  It would be better to
> eliminate it.  You would have to modify wait_ibsyclr() somehow...
> 
> regards,
> dan carpenter
> 
> 

Ah thanks...

Will look into it and fix it up.

Who will ever know why the result and the cause can't have the correct
message. Personally I would have said "global" but we didn't write the
message did we :(!


