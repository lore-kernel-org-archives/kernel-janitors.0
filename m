From: Vasiliy Kulikov <segooon@gmail.com>
Date: Thu, 11 Nov 2010 08:34:08 +0000
Subject: Re: [PATCH] lib: vsprintf: fix invalid arg check
Message-Id: <20101111083408.GA3471@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421490-23950-1-git-send-email-segooon@gmail.com>
 <20101110130834.02496b48.akpm@linux-foundation.org>
 <alpine.DEB.2.00.1011101335410.7756@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.00.1011101335410.7756@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Rientjes <rientjes@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, =?iso-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, Joe Perches <joe@perches.com>, Frederic Weisbecker <fweisbec@gmail.com>, Bjorn Helgaas <bjorn.helgaas@hp.com>, linux-kernel@vger.kernel.org

On Wed, Nov 10, 2010 at 13:38 -0800, David Rientjes wrote:
> On Wed, 10 Nov 2010, Andrew Morton wrote:
> 
> > > "size" is size_t.  If we want to check whether it was underflowed
> > > then we should cast it to ssize_t instead of int.  When
> > > sizeof(size_t) > sizeof(int) the code sees UINT_MAX as underflow,
> > > but it is not.
> > > 
> > 
> > Does this patch fix any actual observed problem?

I don't think so, this fix is more theoretical than practical.
However, maybe there is some crazy driver that fills array of 2GB with
s*printf().

> > >  Compile tested.
> > > 
> > 
> > I guess not.

What do you mean here? 

$ make lib/vsprintf.o
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CC      lib/vsprintf.o

Compiled without warnings.

> > >  	/* Reject out-of-range values early.  Large positive sizes are
> > >  	   used for unknown buffer sizes. */
> > 
> > Thousands of people would find that comment to be utterly mysterious. 
> > I am one.
> > 
[...]
> The changelog is wrong: if sizeof(size_t) > sizeof(int) then the return value overflows.

This comparison is intended for size_t _underflow_, e.g. in such (buggy)
code:

len = snprintf(buf, sizeof(buf), "%s", string);
len += snprintf(buf + len, sizeof(buf) - len, "%s", string2);

If the first snprintf() returns len that is greater than sizeof(buf),
then sizeof(buf)-len is negative; casted to (unsigned!) size_t it
becomes some big value. buf+len points to somewhere after the real buf.

To detect this situation we check whether size is negative (as signed).
But it should be checked as integer of the same size.

> vsprintf() and sprintf() pass INT_MAX for an unbounded buffer length

OK, this should be changed to LONG_MAX.


> The type of interest is not of the passed size, but rather the return value of
> the function.

From vsnprintf comment:

 * The return value is the number of characters which would
 * be generated for the given input, excluding the trailing

If nothing was filled then result is zero.

> 
> > > -	if (WARN_ON_ONCE((int) size < 0))
> > > +	if (WARN_ON_ONCE((ssize_t) size < 0))
> > >  		return 0;
> > >  
> > >  	str = buf;


-- 
Vasiliy
