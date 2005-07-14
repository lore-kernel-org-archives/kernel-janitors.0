From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 14 Jul 2005 19:57:45 +0000
Subject: [KJ] Fwd: Re: [PATCH] i386: Selectable Frequency of the Timer
Message-Id: <200507150000.40137.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Text for TODO entry, anyone?

----------  Forwarded Message  ----------

Subject: Re: [PATCH] i386: Selectable Frequency of the Timer Interrupt
Date: Thursday 14 July 2005 21:21
From: Linus Torvalds

[snip]

A _lot_ of drivers end up caring about absolute time, because a _lot_ of 
drivers have a very simple issue like:

 - poll this port every 10ms until it returns "ready", or until we time
   out after 500ms.

And the thing is, you can do it the stupid way:

	for (i = 0; i < 50; i++) {
		if (ready())
			return 0;
		msleep(10);
	}
	.. timeout ..

or you can do it the _right_ way. The stupid way is simpler, but anybody 
who doesn't see what the problem is has some serious problems in kernel 
programming. Hint: it might not be polling for half a second, it might be 
polling for half a _minute_ for all you know.

In other words, the _right_ way to do this is literally

	unsigned long timeout = jiffies + HZ/2;
	for (;;) {
		if (ready())
			return 0;
		if (time_after(timeout, jiffies))
			break;
		msleep(10);
	}

which is unquestionably more complex, yes, but it's more complex because 
it is CORRECT!

And yes, we have had people "simplifying" drivers and screwing things like 
this up. And you don't even notice, until the machine is under heavy load, 
and then the "simplified" driver ends up being very very broken, and 
people wonder why performance sucks.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
