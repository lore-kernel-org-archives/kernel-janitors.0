From: Julia Lawall <julia@diku.dk>
Date: Mon, 05 Jul 2010 20:03:52 +0000
Subject: Re: ERROR: do not initialise externals to 0 or NULL
Message-Id: <Pine.LNX.4.64.1007052202260.2790@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278346615.5396.3.camel@dermezel>
In-Reply-To: <1278346615.5396.3.camel@dermezel>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 5 Jul 2010, Dan Carpenter wrote:

> On Mon, Jul 05, 2010 at 06:16:55PM +0200, Joe Eloff wrote:
> > Hi,
> > 
> > I have searched for results on this and most things I find is that it
> > must be dropped.
> > 
> 
> You mean something like:
> 
> extern int foo = 0;
> 
> initializing an extern doesn't make sense.  It doesn't matter what you
> initialize it to.  Gcc should warn about this.  The initialization should
> go where the actual variable is declared.
> 
> If that doesn't answer your question, can you send some sample code
> that causes the error?

For what it is worth, I didn't find anything with the following semantic 
match:

@@
type T;
identifier x;
expression E;
@@

* extern T x = E;

This, if there actually is such a thing, I would be interested to know 
about it.

julia
