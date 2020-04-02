From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 02 Apr 2020 16:48:21 +0000
Subject: Re: [PATCH][next] rtc: class: remove redundant assignment to variable err
Message-Id: <20200402164821.GQ3683@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402110411.508534-1-colin.king@canonical.com>
In-Reply-To: <20200402110411.508534-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/04/2020 12:04:11+0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value. The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/rtc/class.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
