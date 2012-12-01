From: Willy Tarreau <w@1wt.eu>
Date: Sat, 01 Dec 2012 08:08:06 +0000
Subject: Re: [patch] staging: panel: pass correct lengths to keypad_send_key()
Message-Id: <20121201080806.GB25450@1wt.eu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121129143835.GC12199@elgon.mountain>
In-Reply-To: <20121129143835.GC12199@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On Thu, Nov 29, 2012 at 05:38:35PM +0300, Dan Carpenter wrote:
> We changed the sizeof() statements in 429ccf058b "staging:panel: Fixed
> coding conventions." so that they could fit inside the 80 character
> line limit.  Unfortunately, the new sizeof() statements are a smaller
> size.  This reverts it.
> 
> There isn't a nice way to stay within the 80 character limit without
> a re-work so I've gone over.

Don't bother too much about the limit anyway, it's more of a guideline,
and the first time the code was adapted to fit, it became totally unreadable.

And BTW, I think that the only reason for the bug you found precisely is
the introduction of these repeat_str/release_str local variables that seem
to be there just to reduce line length...

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Untested.  The ->u.kbd.press_str and friends are funny data types.

I agree, it looks like the initial intent was to have the strings
fit well within the union, but this is all but obvious.

> I'm
> not sure how this code, works but the stuff we have is wrong and I've
> reverted it back to the original.

Acked-by: Willy Tarreau <w@1wt.eu>

Willy

