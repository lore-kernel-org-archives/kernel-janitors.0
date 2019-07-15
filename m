From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 15 Jul 2019 09:40:58 +0000
Subject: Re: [PATCH] wl3501_cs: remove redundant variable ret
Message-Id: <87zhlfprdh.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190705103732.30568-1-colin.king@canonical.com>
In-Reply-To: <20190705103732.30568-1-colin.king@canonical.com> (Colin King's
        message of "Fri, 5 Jul 2019 11:37:32 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initialized with a value that is never
> read and it is being updated later with a new value that is returned.
> The variable is redundant and can be replaced with a return 0 as
> there are no other return points in this function.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/wireless/wl3501_cs.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/wl3501_cs.c b/drivers/net/wireless/wl3501_cs.c
> index a25b17932edb..007bf6803293 100644
> --- a/drivers/net/wireless/wl3501_cs.c
> +++ b/drivers/net/wireless/wl3501_cs.c
> @@ -1226,7 +1226,6 @@ static int wl3501_init_firmware(struct wl3501_card *this)
>  static int wl3501_close(struct net_device *dev)
>  {
>  	struct wl3501_card *this = netdev_priv(dev);
> -	int rc = -ENODEV;

I'll manually fix the commit log with:

s/variable ret/variable rc/

-- 
Kalle Valo
