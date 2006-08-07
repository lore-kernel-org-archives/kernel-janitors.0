From: Pavel Machek <pavel@suse.cz>
Date: Mon, 07 Aug 2006 23:34:53 +0000
Subject: Re: [KJ] [patch] fix common mistake in polling loops
Message-Id: <20060807233453.GK2759@elf.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com> <20060805114052.GE4506@ucw.cz> <20060805114547.GA5386@ucw.cz> <82faac5b0608061639v315c6fa9l17cd4bf44b6bbc51@mail.gmail.com>
In-Reply-To: <82faac5b0608061639v315c6fa9l17cd4bf44b6bbc51@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darren Jenkins <darrenrjenkins@gmail.com>, torvalds@osdl.org
Cc: Zed 0xff <zed.0xff@gmail.com>, kernel-janitors@osdl.org, linux-kernel@vger.kernel.org

Hi!

> >> Well, whoever wrote thi has some serious problems (in attitude
> >> department). *Any* loop you design may take half a minute under
> >> streange circumstances.
> 
> 6.
> common mistake in polling loops [from Linus]:

Yes, Linus was wrong here. Or more precisely, he's right original code
is broken, but his suggested "fix" is worse than the original.

	unsigned long timeout = jiffies + HZ/2;
	for (;;) {
		if (ready())
			return 0;
[IMAGINE HALF A SECOND DELAY HERE]	
		if (time_after(timeout, jiffies))
			break;
		msleep(10);
	}

Oops.

> >Actually it may be broken, depending on use. In some cases this loop
> >may want to poll the hardware 50 times, 10msec appart... and your loop
> >can poll it only once in extreme conditions.
> >
> >Actually your loop is totally broken, and may poll only once (without
> >any delay) and then directly timeout :-P -- that will break _any_
> >user.
> 
> The Idea is that we are checking some event in external hardware that
> we know will complete in a given time (This time is not dependant on
> system activity but is fixed). After that time if the event has not
> happened we know something has borked.

But you have to make sure YOU CHECK READY AFTER THE TIMEOUT. Linus'
code does not do that.
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
