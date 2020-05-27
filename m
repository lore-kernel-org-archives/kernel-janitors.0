From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 27 May 2020 06:40:12 +0000
Subject: Re: [PATCH v4] workqueue: Remove unnecessary kfree() call in rcu_free_wq()
Message-Id: <067566d5-9392-c155-fb8e-f2662fb5f60f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527015054.34796-1-qiang.zhang@windriver.com>
In-Reply-To: <20200527015054.34796-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhang Qiang <qiang.zhang@windriver.com>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> The callback function "rcu_free_wq" could be called after memory
> was released for "wq->rescuer" already and assignment is empty. so
> remove unnecessary kfree(NULL).

I have got the impression that also this wording approach contains weaknesses.
How do you think about a wording variant like the following?

   The data structure member “wq->rescuer” was reset to a null pointer
   in one if branch. It was passed to a call of the function “kfree”
   in the callback function “rcu_free_wq” (which was eventually executed).
   The function “kfree” does not perform more meaningful data processing
   for a passed null pointer (besides immediately returning from such a call).
   Thus delete this function call which became unnecessary with the referenced
   software update.


> Fixes: def98c84b6cd ("workqueue: Fix spurious sanity check failures in destroy_workqueue()")

This change triggered another collateral evolution finally.
Would you like to detect similarly questionable function calls
by advanced source code analysis?


> Fixes: 8efe1223d73c ("workqueue: Fix missing kfree(rescuer) in destroy_workqueue()")

Please delete this tag from the change description
(because I find that it is not so relevant here.)


>  v1->v2->v3->v4:
>  Modify wrong submission information.

Will it be nicer to mention the adjustment of the commit message?

Regards,
Markus
