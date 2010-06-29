From: shenghui <crosslonelyover@gmail.com>
Date: Tue, 29 Jun 2010 12:44:37 +0000
Subject: Re: [PATCH] avoid race condition in pick_next_task_fair in
Message-Id: <AANLkTil26yR6bdPoaH84rOoJfmg8cyS0ScvVeBydZQ25@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTin49UHeVhfS-iFwWvPIg29HPhXaP3DorBAa-a0I@mail.gmail.com>
	<1277808215.1868.5.camel@laptop>
	<AANLkTik4PXpgkc_ob-INohfmlTwe3wqDmif_ohXBxHHX@mail.gmail.com>
	<1277811316.1868.40.camel@laptop>
In-Reply-To: <1277811316.1868.40.camel@laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, Greg KH <greg@kroah.com>

2010/6/29 Peter Zijlstra <peterz@infradead.org>:
> Pretty much everywhere, if you look at sched.c the only sched_class
> method not called with rq->lock held is ::task_fork().
>
> The interesting bits are that schedule()->pre_schedule()/idle_balance()
> can drop rq->lock as well as ->select_task_rq().
>
>
>
>

Thanks for your instructions!


-- 


Thanks and Best Regards,
shenghui
