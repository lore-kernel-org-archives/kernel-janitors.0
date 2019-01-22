From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Tue, 22 Jan 2019 16:53:55 +0000
Subject: Re: [PATCH -next] rtc: sd3078: make symbol 'sd3078_driver' static
Message-Id: <20190122165355.GA16702@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547607681-5873-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1547607681-5873-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Dianlong Li <long17.cool@163.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

On 16/01/2019 03:01:21+0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/rtc/rtc-sd3078.c:218:19: warning:
>  symbol 'sd3078_driver' was not declared. Should it be static?
> 
> Fixes: 1d67a232105b ("rtc: sd3078: new driver.")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/rtc/rtc-sd3078.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
