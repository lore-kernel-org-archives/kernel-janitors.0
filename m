From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 22 Nov 2018 17:12:42 +0000
Subject: Re: [PATCH v2] rtc: max8997: Fix the returned value in case of error in 'max8997_rtc_read_alarm()'
Message-Id: <20181122171242.GI12656@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181114171951.4137-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181114171951.4137-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: a.zummo@towertech.it, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 14/11/2018 18:19:51+0100, Christophe JAILLET wrote:
> In case of error, we return 0.
> This is spurious and not consistent with the other functions of the driver.
> Propagate the error code instead.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: re-word changelog and remove Fixes tag.
>    (not sure if any should be provided, and which one would be the best)
> ---
>  drivers/rtc/rtc-max8997.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
