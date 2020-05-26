From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 26 May 2020 10:34:36 +0000
Subject: Re: [v3] workqueue: Fix double kfree for rescuer
Message-Id: <093e5131-fdee-54fd-e2e1-a632435005b7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200525093019.2253-1-qiang.zhang@windriver.com>
 <CAJhGHyC4XcNL8yzWZKZ=73wZJej4JwCaAHGV8qjYn-AqcEAEjQ@mail.gmail.com>
 <9e7c20bd-8161-0790-36de-108c6dae65df@windriver.com>
In-Reply-To: <9e7c20bd-8161-0790-36de-108c6dae65df@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Qiang <qiang.zhang@windriver.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Tejun Heo <tj@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> There is something wrong with my description.  is it feasible to describe as follows:
>
> The resucer is already free in "destroy_workqueue" and
>     "wq->rescuer = NULL" was executed, but in "rcu_free_wq"
>     it's release again (equivalent to kfree(NULL)), this is
>     unnecessary, so should remove.

I find that this suggestion indicates further wording challenges.
Please try another variant.

Regards,
Markus
