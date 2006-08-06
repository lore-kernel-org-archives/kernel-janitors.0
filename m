From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Sun, 06 Aug 2006 23:39:54 +0000
Subject: Re: [KJ] [patch] fix common mistake in polling loops
Message-Id: <82faac5b0608061639v315c6fa9l17cd4bf44b6bbc51@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com>
	 <20060805114052.GE4506@ucw.cz> <20060805114547.GA5386@ucw.cz>
In-Reply-To: <20060805114547.GA5386@ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Zed 0xff <zed.0xff@gmail.com>, kernel-janitors@osdl.org, linux-kernel@vger.kernel.org

G'day

On 8/5/06, Pavel Machek <pavel@ucw.cz> wrote:

> > Well, whoever wrote thi has some serious problems (in attitude
> > department). *Any* loop you design may take half a minute under
> > streange circumstances.

6.
common mistake in polling loops [from Linus]:


>
> Actually it may be broken, depending on use. In some cases this loop
> may want to poll the hardware 50 times, 10msec appart... and your loop
> can poll it only once in extreme conditions.
>
> Actually your loop is totally broken, and may poll only once (without
> any delay) and then directly timeout :-P -- that will break _any_
> user.

The Idea is that we are checking some event in external hardware that
we know will complete in a given time (This time is not dependant on
system activity but is fixed). After that time if the event has not
happened we know something has borked.
So in the loop, after the time period has expired without the event
happening we can go and clean up and get ready to go again, without
bothering to poll any more, because we already know something has
borked.

What does this give you ? Well it can improve performance by speeding
up re-try's when under heavy system load. The cost of cause is code
complexity.



Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
