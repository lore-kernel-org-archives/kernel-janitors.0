From: Richard Weinberger <richard@nod.at>
Date: Thu, 18 Jan 2018 15:46:17 +0000
Subject: Re: [PATCH -next] mtd: ubi: wl: Fix error return code in ubi_wl_init()
Message-Id: <1565095.G3YoHPv5dZ@blindfold>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516284305-82544-1-git-send-email-weiyongjun1@huawei.com>
 <20180118151132.255e0173@bbrezillon> <20180118163445.5e465f90@bbrezillon>
In-Reply-To: <20180118163445.5e465f90@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Artem Bityutskiy <dedekind1@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

Boris, Wei Yongjun,

Am Donnerstag, 18. Januar 2018, 16:34:45 CET schrieb Boris Brezillon:
> On Thu, 18 Jan 2018 15:11:32 +0100
> 
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> > On Thu, 18 Jan 2018 15:08:01 +0100
> > 
> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> > > On Thu, 18 Jan 2018 14:05:05 +0000
> > > 
> > > Wei Yongjun <weiyongjun1@huawei.com> wrote:
> > > > Fix to return error code -ENOMEM from the kmem_cache_alloc() error
> > > > handling case instead of 0, as done elsewhere in this function.
> > > 
> > > I guess you've used a static analysis code to detect this problem, can
> > > you name it in the commit message, and paste the error/warning message
> > > it reported next time you submit this kind of patch.
> > > 
> > > > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > > 
> > > NAck. I you read the code you'll see that err is initialized to -ENOMEM
> > > here [1], so these changes are actually not needed.
> > 
> > Sorry, just realized I was wrong. It seems that err can be overridden by
> > [2]. So this patch is indeed fixing a real problem.
> > 
> > Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Oh, and you can add:
> 
> Fixes: f78e5623f45b ("ubi: fastmap: Erase outdated anchor PEBs during
> attach")

Good catch!

Thanks,
//richard
