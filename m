From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 07 Feb 2019 20:53:50 +0000
Subject: Re: [PATCH] rtc: pm8xxx: fix unintended sign extension
Message-Id: <20190207205350.GM4719@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190206103102.19345-1-colin.king@canonical.com>
In-Reply-To: <20190206103102.19345-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 06/02/2019 10:31:02+0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Shifting a u8 by 24 will cause the value to be promoted to an integer. If
> the top bit of the u8 is set then the following conversion to an unsigned
> long will sign extend the value causing the upper 32 bits to be set in
> the result.
> 
> Fix this by casting the u8 value to an unsigned long before the shift.
> 
> Detected by CoverityScan, CID#1309693 ("Unintended sign extension")
> 
> Fixes: 9a9a54ad7aa2 ("drivers/rtc: add support for Qualcomm PMIC8xxx RTC")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/rtc/rtc-pm8xxx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
