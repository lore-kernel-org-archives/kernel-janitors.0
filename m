From: Srdjan Todorovic <todorovic.s@googlemail.com>
Date: Mon, 12 Feb 2007 01:51:20 +0000
Subject: Re: [KJ] memory zeroing macros
Message-Id: <Pine.LNX.4.63.0702120137330.5352@thor.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702101731480.6852@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702101731480.6852@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 11 Feb 2007, Greg KH wrote:

> On Sun, Feb 11, 2007 at 03:34:34PM -0500, burns.ethan@gmail.com wrote:
> > On Sun, Feb 11, 2007 at 04:32:11AM -0500, Robert P. J. Day wrote:
> > > or maybe this really is just not worth the effort.  who knows?
> > 
> > I don't think its worth the effort.  Changing the name on this wouldn't add
> > any readability.  memset(dest, 0, len) is very clear, in my opinion.  Also,
> > there's nothing really error prone about it...  I see no advantage.
> 
> Not true at all, 0 and len get switched a lot accidentally.  See the
> archives for times people have swept the kernel tree to fix this issue
> up.

I agree with you here, Greg, about accidentally switching the args to
memset(). However just because someone (I've done this in the past,
damn hard to debug since you don't expect to make this silly mistake)
can do:

  if (x = 0)  { }

doesn't mean that we should discourage if statements.

The macros from the wiki page add yet another set of macros/functions
that someone has to learn. memset() should be really well-known to
anyone doing C for a while. Plus with new code, comes the possibility
of abuse and bugs (eg. the macros in the wiki page don't protect the
arguement with brackets).

Thanks,

Srdjan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
