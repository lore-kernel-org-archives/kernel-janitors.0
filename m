From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Fri, 08 Nov 2019 15:56:38 +0000
Subject: Re: [PATCH][next] rtc: bd70528: fix module alias to autoload module
Message-Id: <20191108155638.GG216543@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106083418.159045-1-colin.king@canonical.com>
In-Reply-To: <20191106083418.159045-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 06/11/2019 08:34:18+0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The module alias platform tag contains a spelling mistake. Fix it.
> 
> Fixes: f33506abbcdd ("rtc: bd70528: Add MODULE ALIAS to autoload module")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/rtc/rtc-bd70528.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
