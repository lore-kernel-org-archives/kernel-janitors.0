From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 12 Jul 2018 19:18:07 +0000
Subject: Re: [PATCH] rtc: m48t59: remove redundant pointer 'name'
Message-Id: <20180712191807.GK16084@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180711083312.5483-1-colin.king@canonical.com>
In-Reply-To: <20180711083312.5483-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/07/2018 09:33:12+0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'name' is being assigned but is never used hence it is redundant
> and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'name' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/rtc/rtc-m48t59.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
