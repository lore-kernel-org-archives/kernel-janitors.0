From: "Bernard Metzler" <BMT@zurich.ibm.com>
Date: Sat, 20 Jul 2019 08:01:59 +0000
Subject: Re: [PATCH -next] infiniband: siw: remove set but not used variables 'rv'
Message-Id: <OF77C0BA7B.17273086-ON0025843D.002C20A5-0025843D.002C20AD@notes.na.collabserv.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190719012938.100628-1-maowenan@huawei.com>
In-Reply-To: <20190719012938.100628-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: dledford@redhat.com, jgg@ziepe.ca, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

-----"Mao Wenan" <maowenan@huawei.com> wrote: -----

>To: <bmt@zurich.ibm.com>, <dledford@redhat.com>, <jgg@ziepe.ca>
>From: "Mao Wenan" <maowenan@huawei.com>
>Date: 07/19/2019 03:24AM
>Cc: <linux-rdma@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
><kernel-janitors@vger.kernel.org>, "Mao Wenan" <maowenan@huawei.com>
>Subject: [EXTERNAL] [PATCH -next] infiniband: siw: remove set but not
>used variables 'rv'
>
>Fixes gcc '-Wunused-but-set-variable' warning:
>
>drivers/infiniband/sw/siw/siw_cm.c: In function siw_cep_set_inuse:
>drivers/infiniband/sw/siw/siw_cm.c:223:6: warning: variable rv set
>but not used [-Wunused-but-set-variable]
>
>It is not used since commit 6c52fdc244b5("rdma/siw: connection
>management")
>
>Signed-off-by: Mao Wenan <maowenan@huawei.com>
>---
> drivers/infiniband/sw/siw/siw_cm.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/infiniband/sw/siw/siw_cm.c
>b/drivers/infiniband/sw/siw/siw_cm.c
>index a7cde98..9ce8a1b 100644
>--- a/drivers/infiniband/sw/siw/siw_cm.c
>+++ b/drivers/infiniband/sw/siw/siw_cm.c
>@@ -220,13 +220,12 @@ static void siw_put_work(struct siw_cm_work
>*work)
> static void siw_cep_set_inuse(struct siw_cep *cep)
> {
> 	unsigned long flags;
>-	int rv;
> retry:
> 	spin_lock_irqsave(&cep->lock, flags);
> 
> 	if (cep->in_use) {
> 		spin_unlock_irqrestore(&cep->lock, flags);
>-		rv = wait_event_interruptible(cep->waitq, !cep->in_use);
>+		wait_event_interruptible(cep->waitq, !cep->in_use);
> 		if (signal_pending(current))
> 			flush_signals(current);
> 		goto retry;
>-- 
>2.7.4
>
>

Mao, many thanks for finding that. So, yes, 'rv'  shall be removed.

Reviewed-by: Bernard Metzler <bmt@zurich.ibm.com>
