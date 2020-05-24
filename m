From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 24 May 2020 15:33:02 +0000
Subject: Re: [PATCH] workqueue: Fix double kfree(rescuer) in destroy_workqueue()
Message-Id: <96b49f22-50a7-9c8f-7c9d-f178195de717@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhang Qiang <qiang.zhang@windriver.com>, Lai Jiangshan <jiangshanlai@gmail.com>, Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> When destroy_workqueue if rescuer worker exist,wq->rescuer pointer be
> kfree. if sanity checks passed. the func call_rcu(&wq->rcu, rcu_free_wq)
> will be called if the wq->flags & WQ_UNBOUND is false,in rcu_free_wq
> func wq->rescuer pointer was kfree again.

1. I suggest to improve also this change description.
   Do you try to explain here that a call of the function “free_workqueue_attrs”
   (or “free_percpu”) would perform sufficient clean-up of system resources
   in this use case?

2. You proposed to delete the function call “kfree(wq->rescuer)” from
   the implementation of the function “rcu_free_wq”.
   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/kernel/workqueue.c?id=c11d28ab4a691736e30b49813fb801847bd44e83#n3482
   https://elixir.bootlin.com/linux/v5.7-rc6/source/kernel/workqueue.c#L3482

   This function name should be specified also in the patch subject,
   shouldn't it?

3. Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
