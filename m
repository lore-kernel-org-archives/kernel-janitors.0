From: Pavel Machek <pavel@ucw.cz>
Date: Sat, 05 Aug 2006 11:45:47 +0000
Subject: Re: [KJ] [patch] fix common mistake in polling loops
Message-Id: <20060805114547.GA5386@ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com> <20060805114052.GE4506@ucw.cz>
In-Reply-To: <20060805114052.GE4506@ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zed 0xff <zed.0xff@gmail.com>
Cc: kernel-janitors@osdl.org, linux-kernel@vger.kernel.org

Hi!

> > task taken from http://kerneljanitors.org/TODO:
> > 
> > A _lot_ of drivers end up caring about absolute time, 
> > because a _lot_ of
> > drivers have a very simple issue like:
> > 
> > - poll this port every 10ms until it returns "ready", or 
> > until we time
> >   out after 500ms.
> > 
> > And the thing is, you can do it the stupid way:
> > 
> > 	for (i = 0; i < 50; i++) {
> > 		if (ready())
> > 			return 0;
> > 		msleep(10);
> > 	}
> > 	.. timeout ..
> > 
> > or you can do it the _right_ way. The stupid way is 
> > simpler, but anybody
> > who doesn't see what the problem is has some serious 
> > problems in kernel
> > programming. Hint: it might not be polling for half a 
> 
> Well, whoever wrote thi has some serious problems (in attitude
> department). *Any* loop you design may take half a minute under
> streange circumstances.
> 
> > second, it might be
> > polling for half a _minute_ for all you know.
> > 
> > In other words, the _right_ way to do this is literally
> > 
> > 	unsigned long timeout = jiffies + 
> > 	msecs_to_jiffies(500);
> > 	for (;;) {
> > 		if (ready())
> > 			return 0;
> > 		if (time_after(timeout, jiffies))
> > 			break;
> > 		msleep(10);
> > 	}
> > 
> > which is unquestionably more complex, yes, but it's more 
> > complex because
> > it is CORRECT!

Actually it may be broken, depending on use. In some cases this loop
may want to poll the hardware 50 times, 10msec appart... and your loop
can poll it only once in extreme conditions.

Actually your loop is totally broken, and may poll only once (without
any delay) and then directly timeout :-P -- that will break _any_
user.
							Pavel
-- 
Thanks for all the (sleeping) penguins.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
