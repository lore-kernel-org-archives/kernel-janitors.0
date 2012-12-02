From: Willy Tarreau <w@1wt.eu>
Date: Sun, 02 Dec 2012 11:53:06 +0000
Subject: Re: [patch] staging: panel: pass correct lengths to keypad_send_key()
Message-Id: <20121202115306.GP25450@1wt.eu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121129143835.GC12199@elgon.mountain>
In-Reply-To: <20121129143835.GC12199@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On Sun, Dec 02, 2012 at 02:22:13PM +0300, Dan Carpenter wrote:
> On Fri, Nov 30, 2012 at 10:19:06AM +0100, walter harms wrote:
> > >  				if (press_str[0])
> > >  					keypad_send_key(press_str,
> > > -							sizeof(press_str));
> > > +							sizeof(input->u.kbd.press_str));
> > >  			}
> > yep, this looks like the original intention.
> > NTL i would like to question the use of  press_str and friends.
> > Moving the if (press_str[0]) into keypad_send_key() seems
> > more sensible.
> > 
> > just my two cents,
> > 
> 
> Greg had already applied my patch by the you sent this email.
> 
> What you're saying sounds like it should be a good cleanup, but when
> I actually look at it, the callers still have to test repeat_str[0]
> so it's not as useful as one would hope.
> 
> Really this stuff is really confusing.  I'm not sure what is
> actually stored in press_str.  Is it a pointer or just chars?  If
> it's a pointer then why are we only checking the first bit instead
> of checking the pointer?  I think it's characters but why is it
> declared as "char press_str[sizeof(void *) + sizeof(int)];"?

It's just chars. It was declared this way so that it did not
inflate the union it's declared in. This is totally ugly and
should be cleaned. But it dates 13 years ago when we were trying
to shrink everything to have full-featured kernels in less than
500kB to boot from floppies...

Regards,
Willy

