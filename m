From: Pavel Machek <pavel@suse.cz>
Date: Tue, 15 Aug 2006 10:08:09 +0000
Subject: Re: [KJ] [PATCH] Add poll_event* interfaces (was Re: [patch] fix
Message-Id: <20060815100809.GF7496@elf.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060812062818.GD4919@us.ibm.com>
In-Reply-To: <20060812062818.GD4919@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi!

> > I think while you are hiding complexity in a macro, you should hide
> > the absolute time to jiffies conversion complexity(although not that
> > complex) too. It _is_ closely related to the interfaces you are
> > writing and in a lot of cases will probably be the only place the
> > conversion is used. So I say, bung it in there.
> 
> Ok, below is my attempt at incorporating this. Also fixed a typo in
> poll_event_interruptible_timeout() and made a similar fix as 2) for
> the interruptible variants, where the condition takes precendence over a
> signal.

Agreed, looks okay to me.
								Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
