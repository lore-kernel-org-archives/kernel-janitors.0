From: shenghui <crosslonelyover@gmail.com>
Date: Tue, 29 Jun 2010 11:24:17 +0000
Subject: Re: [PATCH] avoid race condition in pick_next_task_fair in
Message-Id: <AANLkTik4PXpgkc_ob-INohfmlTwe3wqDmif_ohXBxHHX@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTin49UHeVhfS-iFwWvPIg29HPhXaP3DorBAa-a0I@mail.gmail.com>
	<1277808215.1868.5.camel@laptop>
In-Reply-To: <1277808215.1868.5.camel@laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, Greg KH <greg@kroah.com>

2010/6/29 Peter Zijlstra <peterz@infradead.org>:
> On Tue, 2010-06-29 at 15:10 +0800, shenghui wrote:
>> I think some lock on the metadata can fix this issue, but we may
>> change plenty of code to add support for lock. I think the easist
>> way is just substacting nr_running before dequing tasks.
>
> But all that is fully serialized by the rq->lock.. so I'm really not
> seeing how this can happen.
>
>
>

I wonder is there any chance set_next_entity() can get NULL for
parameter se if so?
And will you please give me some instructions on where rq->lock
is required?

-- 


Thanks and Best Regards,
shenghui
