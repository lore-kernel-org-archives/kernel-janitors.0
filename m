From: Joe Perches <joe@perches.com>
Date: Fri, 22 May 2015 02:46:18 +0000
Subject: Re: [PATCH v4 10/13] staging: lustre: lnet: lnet: checkpatch.pl fixes
Message-Id: <1432262778.20840.79.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
	 <1432237849-53947-11-git-send-email-shuey@purdue.edu>
	 <1432242004.20840.68.camel@perches.com>
	 <alpine.DEB.2.10.1505212328500.5370@hadrien>
	 <CABqvwjuKypiacf3336j-q450FGKaO4wh0Ld7PF8MGz0VPsYBbw@mail.gmail.com>
In-Reply-To: <CABqvwjuKypiacf3336j-q450FGKaO4wh0Ld7PF8MGz0VPsYBbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Shuey <shuey@purdue.edu>
Cc: Julia Lawall <julia.lawall@lip6.fr>, "Drokin, Oleg" <oleg.drokin@intel.com>, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-devel@lists.lustre.org

On Thu, 2015-05-21 at 18:04 -0400, Michael Shuey wrote:
> That's a task (of many) I've been putting on the back burner until the code
> is cleaner.  It's also a HUGE change, since there are debug macros
> everywhere, and they all check a #define'd mask to see if they should fire,
> and the behavior is likely governed by parts of the lustre user land tools
> as well.
> 
> Suggestions are welcome.  Do other parts of the linux kernel define complex
> debugging macros like these, or is this a lustre-ism?  Any suggestions on
> how to handle this more in line with existing drivers?

Yes, many other bits of code use custom debugging macros.

A good general form is to add a either a generic level or bitmask
macro and use a single entry like:

	my_dbg([optional_ptr,] <level|bitmap>, fmt, ...)

so that <level|bitmap> can be tested against some
variable set by MODULE_PARM_DESC controls.

So, CNETERR(...) might be lustre_dbg(ptr, NETERR, fmt, ...)

though I don't know what use the ptr might have.


