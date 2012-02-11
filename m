From: =?UTF-8?B?w4JuZ2Vsbw==?= Arrifano (miknix) <miknix@gentoo.org>
Date: Sat, 11 Feb 2012 01:21:25 +0000
Subject: Re: [PATCH v2 02/17] Staging: quickstart: Prefix remaining functions names with quickstart_
Message-Id: <20120211022125.00817241@blau64.ninho.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-3-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-3-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 10 Feb 2012 19:58:23 +0100
Szymon Janc <szymon@janc.net.pl> wrote:

> Hi,
> 
> > > I'll take this, but you do know there is no reason for this, as these
> > > are static functions.  I'd recommend keeping them as short as possible,
> > > but hey, it's not my code...
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > I agree with Greg on this one. At the time I didn't prefix these
> > functions with the module name because I wanted to make them clear they
> > were different. The difference lies in the fact that those functions
> > are only used to implement the sysfs interface.
> 
> Yeah, maybe you are right. I thought it was just an oversight. I can send a 
> patch that will get orig names back if you prefer.

Well, if the patch is already applied, then no need to revert, as Greg said
the relevant functions are static, so the patch ends up being just cosmetic. :)

Thanks for pushing this out of staging.
- Angelo
> 
> 
> -- 
> Szymon K. Janc
> szymon@janc.net.pl
> 
