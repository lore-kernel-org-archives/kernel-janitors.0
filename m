From: Boris Brezillon <boris.brezillon@bootlin.com>
Date: Thu, 08 Nov 2018 09:09:24 +0000
Subject: Re: [PATCH][i3c-next] i3c: fix incorrect update to max_read_ds
Message-Id: <20181108100924.2381e9f0@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181107204208.7411-1-colin.king@canonical.com>
In-Reply-To: <20181107204208.7411-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed,  7 Nov 2018 20:42:08 +0000
Hi Colin,

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently max_read_ds is being updated twice, which is incorrect.
> The second assignment should be to max_write_ds instead. Fix this.
> 
> Detected by CoverityScan, CID#1475379 ("Unused value")
> 
> Fixes: 50cacdabeae1 ("i3c: Add core I3C infrastructure")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/i3c/master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 68d6553dbd75..0ea7bb045fad 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1093,7 +1093,7 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
>  	}
>  
>  	info->max_read_ds = getmaxds->maxrd;
> -	info->max_read_ds = getmaxds->maxwr;
> +	info->max_write_ds = getmaxds->maxwr;

Thanks for the fix.

Since the I3C driver is not merged yet, would you mind if I squash your
changes in the commit introducing the bug?

Regards,

Boris
