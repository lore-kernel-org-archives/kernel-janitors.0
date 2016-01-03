From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 03 Jan 2016 18:26:40 +0000
Subject: Re: [PATCH] staging-slicoss: Replace variable initialisations by assignments in slic_if_init()
Message-Id: <20160103182640.GA30692@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56894D2D.1010801@users.sourceforge.net>
 <alpine.DEB.2.02.1601031741080.2074@localhost6.localdomain6>
 <56895EE1.7080808@users.sourceforge.net>
 <20160103175816.GA21611@kroah.com>
 <56896591.2030208@users.sourceforge.net>
In-Reply-To: <56896591.2030208@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Lior Dotan <liodot@gmail.com>, Christopher Harrer <charrer@alacritech.com>

On Sun, Jan 03, 2016 at 07:16:49PM +0100, SF Markus Elfring wrote:
> >> I prefer that assignments for variables like "card" and "slic_regs"
> >> will only be performed immediately before the corresponding content will be
> >> read again (after a few condition checks were executed).
> >>
> >> Another description could be this view:
> >> I suggest to move the variable initialisation a bit.
> > 
> > And like David Miller and others just said, please don't bother us with
> > pointless patches such as this, if you keep it up, I'll have to add you
> > to my killfile as patches like this are a waste of everyone's valuable time.
> 
> I am a bit surprised that you do not like such source code fine-tuning.

It's moving stuff around for no real reason, why would I like it?
Reading and reviewing and applying this type of stuff takes away from
the time I have to spend reviewing and applying actual code fixes from
other developers who are doing real and useful work.

Remember maintainer's time is our most limited resource right now.  You
are abusing that by wasting their time for no valid reason.

> Will related software improvements get another chance later (eventually together
> with other changes)?

Define "improvements".  Did you fix an obvious bug?  Did you speed up
the code in a measurable way?  Did you make the code easier to
understand somehow?  For this patch you did none of these things.

Code in staging needs to be moved out of staging, and this patch does
nothing toward achieving that goal and it wastes people's time reviewing
it to see if it is correct or not.  Please stop or again, you will end
up in some killfiles, if you haven't already been placed there.

thanks,

greg k-h
