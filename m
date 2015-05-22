From: Joe Perches <joe@perches.com>
Date: Fri, 22 May 2015 15:42:17 +0000
Subject: Re: [PATCH v4 10/13] staging: lustre: lnet: lnet: checkpatch.pl fixes
Message-Id: <1432309337.29657.16.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
	 <1432237849-53947-11-git-send-email-shuey@purdue.edu>
	 <1432242004.20840.68.camel@perches.com>
	 <alpine.DEB.2.10.1505212328500.5370@hadrien>
	 <CABqvwjuKypiacf3336j-q450FGKaO4wh0Ld7PF8MGz0VPsYBbw@mail.gmail.com>
	 <alpine.DEB.2.10.1505220704541.2672@hadrien>
	 <15C0AFDB-CA69-40E5-B65E-C559A5B5CE47@intel.com>
In-Reply-To: <15C0AFDB-CA69-40E5-B65E-C559A5B5CE47@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Drokin, Oleg" <oleg.drokin@intel.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Michael Shuey <shuey@purdue.edu>, "<devel@driverdev.osuosl.org>" <devel@driverdev.osuosl.org>, "<gregkh@linuxfoundation.org>" <gregkh@linuxfoundation.org>, "<kernel-janitors@vger.kernel.org>" <kernel-janitors@vger.kernel.org>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, "<HPDD-discuss@ml01.01.org>" <HPDD-discuss@ml01.01.org>, "<lustre-devel@lists.lustre.org>" <lustre-devel@lists.lustre.org>

On Fri, 2015-05-22 at 08:08 +0000, Drokin, Oleg wrote:
> On May 22, 2015, at 1:06 AM, Julia Lawall wrote:
> 
> > On Thu, 21 May 2015, Michael Shuey wrote:
> > 
> >> That's a task (of many) I've been putting on the back burner until the code
> >> is cleaner.  It's also a HUGE change, since there are debug macros
> >> everywhere, and they all check a #define'd mask to see if they should fire,
> >> and the behavior is likely governed by parts of the lustre user land tools
> >> as well.
> >> 
> >> Suggestions are welcome.  Do other parts of the linux kernel define complex
> >> debugging macros like these, or is this a lustre-ism?  Any suggestions on
> >> how to handle this more in line with existing drivers?
> > 
> > Once you decide what to do, you can use Coccinelle to make the changes for
> > you.  So you shouldn't be put off by the number of code sites to change.
> > 
> > The normal functions are pr_err, pr_warn, etc.  Perhaps you can follow
> > Joe's suggestions if you really need something more complicated.
> 
> Ideally leaving CERROR/CDEBUG in Lustre would be desirable from my perspective.

My issue with CERROR is the name is little misleading.
It's actually a debugging message.
#define CERROR(format, ...)  CDEBUG_LIMIT(D_ERROR, format, ## __VA_ARGS__)

I think it'd be clearer as
	lustre_debug(ERROR, ...
even if the name and use style is a little longer.

> It allows you fine grained control about what to collect and what to output
> into a (quite finite) kernel buffer (and over a quite slow serial console)
> and at the same time if you need more info, there's a buffer you can fetch
> separately that can grow much bigger and there's even a way to run a special
> daemon to scrub the buffer eagerly so none of it is lost.


