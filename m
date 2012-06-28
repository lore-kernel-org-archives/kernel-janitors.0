From: "Matt Renzelmann" <mjr@cs.wisc.edu>
Date: Thu, 28 Jun 2012 19:39:38 +0000
Subject: RE: [patch -resend] leds-lp5523: BUG() in error handling in probe()
Message-Id: <00ba01cd5565$c4848750$4d8d95f0$@cs.wisc.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627085800.GA3007@mwanda> <20120627091055.GW31212@elgon.mountain> <CAK5ve-J9CgB=uz-09=POPoygWvNs7k_R3tbZVAzi0VLKTpvOqA@mail.gmail.com> <20120627105547.GD3007@mwanda>
In-Reply-To: <20120627105547.GD3007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, 'Bryan Wu' <bryan.wu@canonical.com>
Cc: 'Richard Purdie' <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 'Matt Renzelmann' <mjr@cs.wisc.edu>

> >
> > Just be curious, what's kind of the tool here?
> >
> 
> Sorry I should have CC'd Matt on this.  I think it's something he
> is working on at the University of Wisconsin.  That's all I know.
> 
> regards,
> dan carpenter
> 
> > -Bryan

Dan is correct.  We've submitted the project for publication but whether it will
be accepted is another question.  If it's published I'd be happy to provide a
reference.

In a nutshell, the tool we've developed uses symbolic execution to reduce the
need for device hardware for driver testing and execute real Linux drivers in
the kernel.  It provides symbolic data in place of hardware input.  The tool
allows us to run real drivers even if the hardware is unavailable.  It can't
find all bugs, but it can find many that could manifest in real conditions, e.g.
null pointer dereferences, incorrect kernel API usage, some "panics" and "BUG"
calls, etc.

I'll try to remember to write back when it's published, at which point I'd be
happy to provide more detail.

Thanks for the interest,
Matt

