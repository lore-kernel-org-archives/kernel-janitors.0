From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 12 Jul 2018 18:17:18 +0000
Subject: Re: [PATCH] rtc: test: make array pdev static
Message-Id: <20180712181718.GG16084@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180624103803.4606-1-colin.king@canonical.com>
In-Reply-To: <20180624103803.4606-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 24/06/2018 11:38:03+0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The array pdev is local to the source and does not need to be in
> global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'pdev' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/rtc/rtc-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
