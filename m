From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 25 May 2020 10:01:59 +0000
Subject: Re: [PATCH v3] workqueue: Fix double kfree for rescuer
Message-Id: <167233e4-a389-5627-f5ad-3b21f337b7f7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200525093019.2253-1-qiang.zhang@windriver.com>
In-Reply-To: <20200525093019.2253-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhang Qiang <qiang.zhang@windriver.com>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> The callback function "rcu_free_wq" could be called after memory
> was released for "rescuer" already, Thus delete a misplaced call
> of the function "kfree".

I got into the mood to follow your interpretation of the
software situation for a moment.

I have taken another look also at the implementation of the function “destroy_workqueue”.

* The function call “kfree(rescuer)” can be performed there in an if branch
  after the statement “wq->rescuer = NULL” was executed.

* This data processing is independent from a possible call of the
  function “call_rcu(&wq->rcu, rcu_free_wq)” in another if branch.
  Thus it seems that a null pointer is intentionally passed by a data structure
  member to this callback function on demand.
  The corresponding call of the function “kfree” can tolerate this special case.


Now I find that the proposed change can be inappropriate.
I'm sorry for undesirable confusion because of this patch review.

Regards,
Markus
