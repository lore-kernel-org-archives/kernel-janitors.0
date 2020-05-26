From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 26 May 2020 09:11:40 +0000
Subject: Re: [v3] workqueue: Fix double kfree for rescuer
Message-Id: <5e1582ac-2f89-80cb-283d-57ba5003890f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200525093019.2253-1-qiang.zhang@windriver.com>
 <CAJhGHyC4XcNL8yzWZKZ=73wZJej4JwCaAHGV8qjYn-AqcEAEjQ@mail.gmail.com>
In-Reply-To: <CAJhGHyC4XcNL8yzWZKZ=73wZJej4JwCaAHGV8qjYn-AqcEAEjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lai Jiangshan <jiangshanlai@gmail.com>, Zhang Qiang <qiang.zhang@windriver.com>
Cc: Tejun Heo <tj@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> wq->rescuer is guaranteed to be NULL in rcu_free_wq()

I was unsure about this data processing detail.


> The patch is a cleanup to remove a "kfree(NULL);".

I would prefer also an improved commit message according to
the understanding of the software situation in this direction.

Regards,
Markus
