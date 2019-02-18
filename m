From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 18 Feb 2019 15:57:33 +0000
Subject: Re: [PATCH -next] rtc: wilco_ec: Make some functions static
Message-Id: <CAFqH_52DG+2=O5YQuOpJ3VMdAAu+UwjJ0_oyEthbbYZ9XgG8Zg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216013603.117969-1-weiyongjun1@huawei.com> <20190218144827.GU10129@piout.net>
In-Reply-To: <20190218144827.GU10129@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Alessandro Zummo <a.zummo@towertech.it>, Nick Crews <ncrews@chromium.org>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

Missatge de Alexandre Belloni <alexandre.belloni@bootlin.com> del dia
dl., 18 de febr. 2019 a les 15:48:
>
> Enric,
>
> You should take that one or squash it with the original commit.
>

Ok, thanks. If Wei doesn't mind I'd like to squash as this is still for-next.

> On 16/02/2019 01:36:03+0000, Wei Yongjun wrote:
> > Fixes the following sparse warnings:
> >
> > drivers/rtc/rtc-wilco-ec.c:72:5: warning:
> >  symbol 'wilco_ec_rtc_read' was not declared. Should it be static?
> > drivers/rtc/rtc-wilco-ec.c:106:5: warning:
> >  symbol 'wilco_ec_rtc_write' was not declared. Should it be static?
> >
> > Fixes: 79c4ec4869b5 ("platform/chrome: wilco_ec: Add RTC driver")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/rtc/rtc-wilco-ec.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-wilco-ec.c b/drivers/rtc/rtc-wilco-ec.c
> > index 35cc56114c1c..e62bda0cb53e 100644
> > --- a/drivers/rtc/rtc-wilco-ec.c
> > +++ b/drivers/rtc/rtc-wilco-ec.c
> > @@ -69,7 +69,7 @@ struct ec_rtc_write {
> >       u8 weekday;
> >  } __packed;
> >
> > -int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
> > +static int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
> >  {
> >       struct wilco_ec_device *ec = dev_get_drvdata(dev->parent);
> >       u8 param = EC_CMOS_TOD_READ;
> > @@ -103,7 +103,7 @@ int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
> >       return 0;
> >  }
> >
> > -int wilco_ec_rtc_write(struct device *dev, struct rtc_time *tm)
> > +static int wilco_ec_rtc_write(struct device *dev, struct rtc_time *tm)
> >  {
> >       struct wilco_ec_device *ec = dev_get_drvdata(dev->parent);
> >       struct ec_rtc_write rtc;
> >
> >
> >
>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
