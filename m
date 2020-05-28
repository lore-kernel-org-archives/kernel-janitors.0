From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 28 May 2020 15:02:18 +0000
Subject: Re: [v5] workqueue: Remove unnecessary kfree() call in rcu_free_wq()
Message-Id: <68ee7d01-fcec-a0f8-4717-bc940efdbf38@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527075715.36849-1-qiang.zhang@windriver.com>
 <284c7851-4e89-a00f-a2e6-aa8e2e1f3fce@web.de>
 <DM6PR11MB32573F3884A864ECD586235EFF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <DM6PR11MB3257D6E7E93A518392502809FF8E0@DM6PR11MB3257.namprd11.prod.outlook.com>
 <20200528095703.GH30374@kadam>
 <CAJhGHyD1nV=M=ccycqCMt86GMuZGkO9trbJ=4ti4EzP9kta6iA@mail.gmail.com>
In-Reply-To: <CAJhGHyD1nV=M=ccycqCMt86GMuZGkO9trbJ=4ti4EzP9kta6iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lai Jiangshan <jiangshanlai@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Tejun Heo <tj@kernel.org>
Cc: Zhang Qiang <qiang.zhang@windriver.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> I'm also confused why they have been debating about the changelog
> after the patch was queued.

I suggest to take another look at the provided patch review comments.


> My statement was about "the patch is a correct cleanup,
> but the changelog is totally misleading".

The commit message was accordingly adjusted, wasn't it?


> destroy_workqueue(percpu_wq) -> rcu_free_wq()
> or
> destroy_workqueue(unbound_wq) -> put_pwq() ->
> pwq_unbound_release_workfn() -> rcu_free_wq()
>
> So the patch is correct to me. Only can destroy_workqueue()
> lead to rcu_free_wq().
>
> Still, the kfree(NULL) is harmless. But it is cleaner
> to have the patch.

Thanks for such a feedback.


> But the changelog is wrong, even after the lengthened debating,

Do you expect any corresponding improvements?


> and English is not my mother tongue, so I just looked on.

How will the patch review evolve further despite of this information?

Regards,
Markus
