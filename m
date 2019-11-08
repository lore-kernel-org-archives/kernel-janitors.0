From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2019 10:05:40 +0000
Subject: Re: [PATCH -next] coresight: replicator: Fix missing spin_lock_init()
Message-Id: <20191108100540.GQ10409@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106115651.113943-1-weiyongjun1@huawei.com>
 <CANLsYkxKAC9FLYkFjuehj_oFHTVyd=8_R8bAKjPxTXQyAGkwYw@mail.gmail.com>
In-Reply-To: <CANLsYkxKAC9FLYkFjuehj_oFHTVyd=8_R8bAKjPxTXQyAGkwYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Thu, Nov 07, 2019 at 11:47:11AM -0700, Mathieu Poirier wrote:
> On Wed, 6 Nov 2019 at 04:57, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> >
> > The driver allocates the spinlock but not initialize it.
> > Use spin_lock_init() on it to initialize it correctly.
> >
> > This is detected by Coccinelle semantic patch.
> >
> > Fixes: 0093875ad129 ("coresight: Serialize enabling/disabling a link device.")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-replicator.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> > index 43304196a1a6..e7dc1c31d20d 100644
> > --- a/drivers/hwtracing/coresight/coresight-replicator.c
> > +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> > @@ -248,6 +248,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
> >         }
> >         dev->platform_data = pdata;
> >
> > +       spin_lock_init(&drvdata->spinlock);
> 
> I have applied both patches but removed the "Fixes" line since the
> commit is only visible in my local coresight next tree.
> 

Unless you rebase the tree, then the Fixes tag will still be valid.
(Probably local implies you rebase it I guess).

regards,
dan carpenter
