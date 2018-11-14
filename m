From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Wed, 14 Nov 2018 11:03:01 +0000
Subject: Re: [PATCH] rtc: max77686: Fix the returned value in case of error in 'max77686_rtc_read_time()'
Message-Id: <20181114110301.GX29768@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181113233645.9118-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181113233645.9118-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: cw00.choi@samsung.com, krzk@kernel.org, b.zolnierkie@samsung.com, a.zummo@towertech.it, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 14/11/2018 00:36:45+0100, Christophe JAILLET wrote:
> In case of error, we return 0.
> This is spurious and not consistent with the other functions of the driver.
> Commit e115a2bf1426 has modified more than what is said in the commit
> message. Reverse part of it znd return an error when needed, as it was
> previously.
> 
> Fixes: e115a2bf1426 ("rtc: max77686: stop validating rtc_time in .read_time")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/rtc/rtc-max77686.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
