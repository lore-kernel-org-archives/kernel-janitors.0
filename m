From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Mon, 14 Aug 2006 04:34:58 +0000
Subject: Re: [KJ] [PATCH] Add poll_event* interfaces (was Re: [patch] fix
Message-Id: <82faac5b0608132134vcefd82cp5f06321d1511a615@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060812062818.GD4919@us.ibm.com>
In-Reply-To: <20060812062818.GD4919@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

G'day,

On 8/14/06, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> On 14.08.2006 [00:42:12 +0200], Pavel Machek wrote:
> > Well, someone will want to do usleep here, right? poll_msec()?
>
> A good point... there is no usleep() that I can see, though. msleep()
> uses schedule_timeout() which is at best jiffy-granularity, meaning
> order of milliseconds for the foreseeable future. I was going to add a
> units suffix to all the macros, but I decided to hold off still for two
> reasons: 1) poll_event_interruptible_timeout() is already pretty long :)
> and 2) the msecs suffix would only apply to interval parameter, not the
> timeout one, which is an absolute time in jiffies. I suppose I could
> rework the macros, since they would mostly be used in drivers, to pass
> in a relative millisecond value as the timeout and covert it in the
> macros to an absolute time in jiffies. Would that be preferred?

I think while you are hiding complexity in a macro, you should hide
the absolute time to jiffies conversion complexity(although not that
complex) too. It _is_ closely related to the interfaces you are
writing and in a lot of cases will probably be the only place the
conversion is used. So I say, bung it in there.


> Updated patch, which is what you changed, Darren, with a small
> difference (checking for !condition, rather than condition) is below.
>
> Thanks,
> Nish

This patch looks much better. Can't see anything wrong with it.

Also after seeing the problems people have had with polling loops
these macro's do seem like a good idea.


Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
