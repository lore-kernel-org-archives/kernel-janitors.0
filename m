From: Willy Tarreau <w@1wt.eu>
Date: Sat, 01 Dec 2012 08:13:22 +0000
Subject: Re: [patch] staging: panel: pass correct lengths to keypad_send_key()
Message-Id: <20121201081322.GD25450@1wt.eu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121129143835.GC12199@elgon.mountain>
In-Reply-To: <20121129143835.GC12199@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Nov 30, 2012 at 10:19:06AM +0100, walter harms wrote:
> 
> 
> Am 29.11.2012 15:38, schrieb Dan Carpenter:
> > We changed the sizeof() statements in 429ccf058b "staging:panel: Fixed
> > coding conventions." so that they could fit inside the 80 character
> > line limit.  Unfortunately, the new sizeof() statements are a smaller
> > size.  This reverts it.
> > 
> > There isn't a nice way to stay within the 80 character limit without
> > a re-work so I've gone over.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Untested.  The ->u.kbd.press_str and friends are funny data types.  I'm
> > not sure how this code, works but the stuff we have is wrong and I've
> > reverted it back to the original.
> > 
> > diff --git a/drivers/staging/panel/panel.c b/drivers/staging/panel/panel.c
> > index d9fec5b..dca42ce 100644
> > --- a/drivers/staging/panel/panel.c
> > +++ b/drivers/staging/panel/panel.c
> > @@ -1758,7 +1758,7 @@ static inline int input_state_high(struct logical_input *input)
> >  				char *press_str = input->u.kbd.press_str;
> >  				if (press_str[0])
> >  					keypad_send_key(press_str,
> > -							sizeof(press_str));
> > +							sizeof(input->u.kbd.press_str));
> >  			}
> yep, this looks like the original intention.
> NTL i would like to question the use of  press_str and friends.
> Moving the if (press_str[0]) into keypad_send_key() seems
> more sensible.

Good point, I agree with you.

Willy

