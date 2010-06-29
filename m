From: Peter Zijlstra <peterz@infradead.org>
Date: Tue, 29 Jun 2010 11:35:16 +0000
Subject: Re: [PATCH] avoid race condition in pick_next_task_fair in
Message-Id: <1277811316.1868.40.camel@laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTin49UHeVhfS-iFwWvPIg29HPhXaP3DorBAa-a0I@mail.gmail.com>
	 <1277808215.1868.5.camel@laptop>
	 <AANLkTik4PXpgkc_ob-INohfmlTwe3wqDmif_ohXBxHHX@mail.gmail.com>
In-Reply-To: <AANLkTik4PXpgkc_ob-INohfmlTwe3wqDmif_ohXBxHHX@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shenghui <crosslonelyover@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, Greg KH <greg@kroah.com>

On Tue, 2010-06-29 at 19:24 +0800, shenghui wrote:

> I wonder is there any chance set_next_entity() can get NULL for
> parameter se if so?

Well, if your machine crashes that way, maybe, but I haven't seen that
happen in a long while.

> And will you please give me some instructions on where rq->lock
> is required?

Pretty much everywhere, if you look at sched.c the only sched_class
method not called with rq->lock held is ::task_fork().

The interesting bits are that schedule()->pre_schedule()/idle_balance()
can drop rq->lock as well as ->select_task_rq().



