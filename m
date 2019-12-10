From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Tue, 10 Dec 2019 15:44:56 +0000
Subject: Re: [PATCH -next] rtc: mt6397: drop free_irq of devm_ allocated irq
Message-Id: <20191210154456.GQ1463890@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113021720.9527-1-weiyongjun1@huawei.com>
In-Reply-To: <20191113021720.9527-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Josef Friedl <josef.friedl@speed.at>, Sean Wang <sean.wang@mediatek.com>, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org

On 13/11/2019 02:17:20+0000, Wei Yongjun wrote:
> The devm_request_threaded_irq function allocates irq that is
> released when a driver detaches. Thus, there is no reason to
> explicitly call free_irq in probe function.
> 
> Fixes: 851b87148aa2 ("rtc: mt6397: improvements of rtc driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
