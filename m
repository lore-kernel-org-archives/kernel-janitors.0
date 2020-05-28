From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 28 May 2020 08:07:48 +0000
Subject: Re: [PATCH v6] workqueue: Remove unnecessary kfree() call in rcu_free_wq()
Message-Id: <4f292007-4da0-3558-4c6b-ca3eaf884193@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528013736.39356-1-qiang.zhang@windriver.com>
In-Reply-To: <20200528013736.39356-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhang Qiang <qiang.zhang@windriver.com>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Thus delete this function call which became unnecessary with the referenced
> software update.
…
> Co-developed-by: Markus Elfring <Markus.Elfring@web.de>

I guess that this tag should usually trigger another consequence like the following.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=b0c3ba31be3e45a130e13b278cf3b90f69bda6f6#n548

Signed-off-by: Markus Elfring <Markus.Elfring@web.de>


Is there a need to tag also the patch review contribution of Lai Jiangshan?
https://lore.kernel.org/lkml/CAJhGHyC4XcNL8yzWZKZ=73wZJej4JwCaAHGV8qjYn-AqcEAEjQ@mail.gmail.com/
https://lore.kernel.org/patchwork/comment/1442889/
https://lkml.org/lkml/2020/5/26/201


I am unsure if such aspects will matter after Tejun Heo responded with the information
“Applied to wq/for-5.8.” to the previous patch version yesterday.
https://lore.kernel.org/lkml/20200527135214.GI83516@mtj.thefacebook.com/
https://lore.kernel.org/patchwork/comment/1443888/


>  v1->v2->v3->v4->v5->v6:
>  Modify weakly submitted information and tag.

I am curious how our imaginations and preferences will evolve further
also for such wording selections.

Regards,
Markus
