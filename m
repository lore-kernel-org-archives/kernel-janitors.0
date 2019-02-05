From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Tue, 05 Feb 2019 21:59:39 +0000
Subject: Re: [PATCH] rtc: rtc-ds1672: fix unintended sign extension
Message-Id: <20190205215939.GJ24598@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190205180449.28749-1-colin.king@canonical.com>
In-Reply-To: <20190205180449.28749-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/02/2019 18:04:49+0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Shifting a u8 by 24 will cause the value to be promoted to an integer. If
> the top bit of the u8 is set then the following conversion to an unsigned
> long will sign extend the value causing the upper 32 bits to be set in
> the result.
> 
> Fix this by casting the u8 value to an unsigned long before the shift.
> 
> Detected by CoverityScan, CID#138801 ("Unintended sign extension")
> 
> Fixes: edf1aaa31fc5 ("[PATCH] RTC subsystem: DS1672 driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/rtc/rtc-ds1672.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
