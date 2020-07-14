From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jul 2020 10:59:18 +0000
Subject: Re: [PATCH -next] PM / devfreq: Fix missing unlock on error in devfreq_add_device()
Message-Id: <20200714105918.GB2571@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714063025.118829-1-weiyongjun1@huawei.com>
 <20200714093758.GW2549@kadam>
In-Reply-To: <20200714093758.GW2549@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Tue, Jul 14, 2020 at 12:37:58PM +0300, Dan Carpenter wrote:
> On Tue, Jul 14, 2020 at 06:30:25AM +0000, Wei Yongjun wrote:
> > Add the missing unlock before return from function devfreq_add_device()
> > in the error handling case.
> > 
> > Fixes: d7c46505a7ad ("PM / devfreq: Add support delayed timer for polling mode")
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/devfreq/devfreq.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> > index 5320c3b37f35..2b54a59bb281 100644
> > --- a/drivers/devfreq/devfreq.c
> > +++ b/drivers/devfreq/devfreq.c
> > @@ -788,6 +788,7 @@ struct devfreq *devfreq_add_device(struct device *dev,
> >  
> >  	if (devfreq->profile->timer < 0
> >  		|| devfreq->profile->timer >= DEVFREQ_TIMER_NUM) {
> > +		mutex_unlock(&devfreq->lock);
> >  		goto err_out;
> 
> This should be "goto err_dev;" and the unlock is not required because
> we free "devfreq".

Also the error code needs to be set on this error path.

regards,
dan carpenter
