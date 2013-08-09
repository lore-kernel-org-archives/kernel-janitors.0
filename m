From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 Aug 2013 07:21:58 +0000
Subject: Re: Thoughts on removing this declaration
Message-Id: <20130809072158.GG5502@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201308082332.r78NWRBq272176@rivendell.pollux.laing>
In-Reply-To: <201308082332.r78NWRBq272176@rivendell.pollux.laing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 08, 2013 at 05:32:27PM -0600, Shaun Laing wrote:
> Hello -- what are your thoughts on this patch?  SBE_INCLUDE_SYMBOLS came out
> easily... too easily really.  Was it there on purpose?
> 

Yeah.  It's unfortunately a common thing.  :/  I'm not sure how it
is useful.

> 
> Removed the unused SBE_INCLUDE_SYMBOLS #define, and the associated STATIC
> #define, and replaced all occurances of STATIC with 'static'.  This was in
> response to sparse warnings of the form "symbol 'XYZ' was not declared. Should
> it be static?". 
> 

It is unneeded but it's not unused, it's always defined for
everything.  When SBE_INCLUDE_SYMBOLS is defined it makes the STATIC
disappear.

> Also had to add #ifdef around a function prototype as the 'static' declaration
> produced a new gcc warning, as the actual function was not defined.

The function is defined, of course, as you know.  The forward
declaration isn't needed.  Just remove it instead of adding the
ifdef.

Looks good, though.  Could you tweak the changelog, and remove the
prototype and resend?

regards,
dan carpenter

