From: David Rientjes <rientjes@google.com>
Date: Wed, 10 Nov 2010 21:38:25 +0000
Subject: Re: [PATCH] lib: vsprintf: fix invalid arg check
Message-Id: <alpine.DEB.2.00.1011101335410.7756@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421490-23950-1-git-send-email-segooon@gmail.com> <20101110130834.02496b48.akpm@linux-foundation.org>
In-Reply-To: <20101110130834.02496b48.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Goddard_Rosa?= <andre.goddard@gmail.com>, Joe Perches <joe@perches.com>, Frederic Weisbecker <fweisbec@gmail.com>, Bjorn Helgaas <bjorn.helgaas@hp.com>, linux-kernel@vger.kernel.org

On Wed, 10 Nov 2010, Andrew Morton wrote:

> > "size" is size_t.  If we want to check whether it was underflowed
> > then we should cast it to ssize_t instead of int.  When
> > sizeof(size_t) > sizeof(int) the code sees UINT_MAX as underflow,
> > but it is not.
> > 
> 
> Does this patch fix any actual observed problem?
> 
> >  Compile tested.
> > 
> 
> I guess not.
> 
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -1290,7 +1290,7 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
> >  
> >  	/* Reject out-of-range values early.  Large positive sizes are
> >  	   used for unknown buffer sizes. */
> 
> Thousands of people would find that comment to be utterly mysterious. 
> I am one.
> 

vsprintf() and sprintf() pass INT_MAX for an unbounded buffer length, so 
the cast to int here in the original code is correct.  The type of 
interest is not of the passed size, but rather the return value of the 
function.   The changelog is wrong: if sizeof(size_t) > sizeof(int) then 
the return value overflows.

> > -	if (WARN_ON_ONCE((int) size < 0))
> > +	if (WARN_ON_ONCE((ssize_t) size < 0))
> >  		return 0;
> >  
> >  	str = buf;
