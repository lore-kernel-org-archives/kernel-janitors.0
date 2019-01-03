From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Thu, 03 Jan 2019 20:07:56 +0000
Subject: Re: [PATCH -next] hwspinlock: fix return value check in stm32_hwspinlock_probe()
Message-Id: <20190103200755.GD31596@builder>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1546498950-105456-1-git-send-email-weiyongjun1@huawei.com>
 <16205f0c-3514-731c-e948-38695e3a525d@st.com>
In-Reply-To: <16205f0c-3514-731c-e948-38695e3a525d@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu 03 Jan 02:06 PST 2019, Benjamin GAIGNARD wrote:

> 
> On 1/3/19 8:02 AM, Wei Yongjun wrote:
> > In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> > and never returns NULL. The NULL test in the return value check should
> > be replaced with IS_ERR().
> >
> > Fixes: f24fcff1d267 ("hwspinlock: add STM32 hwspinlock device")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Acked-by: Benjamin Gaignard <benjamin.gaignard@gmail.com>

Thanks for the fix and the review!

Regards,
Bjorn

> > ---
> >   drivers/hwspinlock/stm32_hwspinlock.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
> > index 34a8e00..4418392 100644
> > --- a/drivers/hwspinlock/stm32_hwspinlock.c
> > +++ b/drivers/hwspinlock/stm32_hwspinlock.c
> > @@ -57,8 +57,8 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
> >   
> >   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >   	io_base = devm_ioremap_resource(&pdev->dev, res);
> > -	if (!io_base)
> > -		return -ENOMEM;
> > +	if (IS_ERR(io_base))
> > +		return PTR_ERR(io_base);
> >   
> >   	array_size = STM32_MUTEX_NUM_LOCKS * sizeof(struct hwspinlock);
> >   	hw = devm_kzalloc(&pdev->dev, sizeof(*hw) + array_size, GFP_KERNEL);
> >
> >
> >
