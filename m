From: Jens Axboe <jens.axboe@oracle.com>
Date: Thu, 22 Apr 2010 12:27:19 +0000
Subject: Re: [patch] drbd: fix memory leak
Message-Id: <20100422122719.GH27497@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100422095641.GR29647@bicker>
In-Reply-To: <20100422095641.GR29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 22 2010, Dan Carpenter wrote:
> We leak memory if "--dry-run" is not supported by the peer.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
> index 67e0fc5..93d1f9b 100644
> --- a/drivers/block/drbd/drbd_main.c
> +++ b/drivers/block/drbd/drbd_main.c
> @@ -1695,6 +1695,7 @@ int drbd_send_protocol(struct drbd_conf *mdev)
>  			cf |= CF_DRY_RUN;
>  		else {
>  			dev_err(DEV, "--dry-run is not supported by peer");
> +			kfree(p);
>  			return 0;
>  		}
>  	}

Yep, that's a leak. I have applied it for 2.6.34.

-- 
Jens Axboe

