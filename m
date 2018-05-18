From: Jes Sorensen <jes.sorensen@gmail.com>
Date: Fri, 18 May 2018 14:33:50 +0000
Subject: Re: [PATCH] hippi: fix spelling mistake: "Framming" -> "Framing"
Message-Id: <bdb779e6-1705-3607-7ad8-3b57dfcba31a@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180518100922.28790-1-colin.king@canonical.com>
In-Reply-To: <20180518100922.28790-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/18/2018 06:09 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in printk message text
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/hippi/rrunner.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/hippi/rrunner.c b/drivers/net/hippi/rrunner.c
> index 1ab97d99b9ba..f41116488079 100644
> --- a/drivers/net/hippi/rrunner.c
> +++ b/drivers/net/hippi/rrunner.c
> @@ -867,7 +867,7 @@ static u32 rr_handle_event(struct net_device *dev, u32 prodidx, u32 eidx)
>  			       dev->name);
>  			goto drop;
>  		case E_FRM_ERR:
> -			printk(KERN_WARNING "%s: Framming Error\n",
> +			printk(KERN_WARNING "%s: Framing Error\n",
>  			       dev->name);
>  			goto drop;
>  		case E_FLG_SYN_ERR:
> 

Fine with me! I do wonder if it's time to retire this driver and the
HIPPI code. I haven't had access to hardware for over a decade so I have
no idea if it even works anymore.

Jes
