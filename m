From: Peter Zijlstra <peterz@infradead.org>
Date: Tue, 29 Jun 2010 10:43:35 +0000
Subject: Re: [PATCH] avoid race condition in pick_next_task_fair in
Message-Id: <1277808215.1868.5.camel@laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTin49UHeVhfS-iFwWvPIg29HPhXaP3DorBAa-a0I@mail.gmail.com>
In-Reply-To: <AANLkTin49UHeVhfS-iFwWvPIg29HPhXaP3DorBAa-a0I@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shenghui <crosslonelyover@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, Greg KH <greg@kroah.com>

On Tue, 2010-06-29 at 15:10 +0800, shenghui wrote:
> I think some lock on the metadata can fix this issue, but we may
> change plenty of code to add support for lock. I think the easist
> way is just substacting nr_running before dequing tasks. 

But all that is fully serialized by the rq->lock.. so I'm really not
seeing how this can happen.


