From: Pavel Machek <pavel@suse.cz>
Date: Tue, 20 Jul 2004 16:24:48 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] nbd: replace schedule_timeout()
Message-Id: <20040720162448.GE10921@atrey.karlin.mff.cuni.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86307476546013373=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
In-Reply-To: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
To: kernel-janitors@vger.kernel.org

--===============86307476546013373==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

> > > >I'm not sure it makes sense.... so it will just spin once more? Exact
> > > >timeout does not seem too critical here.
> > > 
> > > 	So why not use HZ instead of 1000?
> > 
> > Hm, using constant like 1000 probably is not good idea.
> 
> Well, I thought it would be better than adding a #define for the number
> of milliseconds in one second. Also, any rounding conditions or what-not
> are taken care of within msleep() by the call to msecs_to_jiffies().

Sorry, I did not check back the sources. mdelay(1000) is okay.

But I believe replacing schedule-timeout() with mdelay is not good
idea as it is okay to sleep shorter time at this particular place.

							Pavel
-- 
Horseback riding is like software...
...vgf orggre jura vgf serr.

--===============86307476546013373==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86307476546013373==--
