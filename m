From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Wed, 15 Apr 2020 07:59:23 +0000
Subject: Re: [PATCH] rtc: rc5t619: Fix an ERR_PTR vs NULL check
Message-Id: <20200415075923.GN34509@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407092852.GI68494@mwanda>
In-Reply-To: <20200407092852.GI68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Andreas Kemnade <andreas@kemnade.info>, Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/04/2020 12:28:52+0300, Dan Carpenter wrote:
> The devm_kzalloc() function returns NULL on error, it doesn't return
> error pointers so this check doesn't work.
> 
> Fixes: 540d1e15393d ("rtc: rc5t619: Add Ricoh RC5T619 RTC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/rtc/rtc-rc5t619.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
