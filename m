From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Fri, 16 Feb 2018 23:52:32 +0000
Subject: Re: [PATCH][V2] rtc: tx4939: avoid unintended sign extension on a 24 bit shift
Message-Id: <20180216235232.GI14177@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180215193614.28684-1-colin.king@canonical.com>
In-Reply-To: <20180215193614.28684-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 15/02/2018 at 19:36:14 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The shifting of buf[5] by 24 bits to the left will be promoted to
> a 32 bit signed int and then sign-extended to an unsigned long. If
> the top bit of buf[5] is set then all then all the upper bits sec
> end up as also being set because of the sign-extension. Fix this by
> casting buf[5] to an unsigned long before the shift.
> 
> Detected by CoverityScan, CID#1465292 ("Unintended sign extension")
> 
> Fixes: 0e1492330cd2 ("rtc: add rtc-tx4939 driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/rtc/rtc-tx4939.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
