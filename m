From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Dec 2019 06:32:40 +0000
Subject: Re: [PATCH -next] power: supply: ab8500: Drop pointless static qualifier in ab8500_btemp_batctrl_vol
Message-Id: <20191204063240.GJ1787@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204010506.159128-1-maowenan@huawei.com>
 <20191204063058.GE1765@kadam>
In-Reply-To: <20191204063058.GE1765@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: sre@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Wed, Dec 04, 2019 at 09:30:58AM +0300, Dan Carpenter wrote:
> On Wed, Dec 04, 2019 at 09:05:06AM +0800, Mao Wenan wrote:
> > There is no need to have the 'T *v' variable static
> > since new value always be assigned before use it.
> > 
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Mao Wenan <maowenan@huawei.com>
> > ---
> >  drivers/power/supply/ab8500_btemp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/power/supply/ab8500_btemp.c b/drivers/power/supply/ab8500_btemp.c
> > index 909f0242bacb..d3d4f7327d1b 100644
> > --- a/drivers/power/supply/ab8500_btemp.c
> > +++ b/drivers/power/supply/ab8500_btemp.c
> > @@ -180,7 +180,7 @@ static int ab8500_btemp_batctrl_volt_to_res(struct ab8500_btemp *di,
> >  static int ab8500_btemp_read_batctrl_voltage(struct ab8500_btemp *di)
> >  {
> >  	int vbtemp, ret;
> > -	static int prev;
> > +	int prev;
> 
> No.  We use it first on linux-next (yesterday).  It needs to be static.
> 

It's surprising that your patch didn't cause an uninitialized variable
compile warning for you.

regards,
dan carpenter
