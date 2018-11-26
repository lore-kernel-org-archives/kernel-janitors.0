From: Boris Brezillon <boris.brezillon@bootlin.com>
Date: Mon, 26 Nov 2018 08:46:43 +0000
Subject: Re: [PATCH 2/2] ic3: master: off by one in mode_show()
Message-Id: <20181126094643.6b1f05cd@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181123071505.ahhh7xqvt4eb7tt2@kili.mountain>
In-Reply-To: <20181123071505.ahhh7xqvt4eb7tt2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 23 Nov 2018 10:15:05 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This should be >= ARRAY_SIZE() to avoid reading one element beyond the
> end of the array.
> 
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued to i3c/next.

Thanks,

Boris

> ---
>  drivers/i3c/master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index bda4b9613e53..c39f89d2deba 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -475,7 +475,7 @@ static ssize_t mode_show(struct device *dev,
>  
>  	i3c_bus_normaluse_lock(i3cbus);
>  	if (i3cbus->mode < 0 ||
> -	    i3cbus->mode > ARRAY_SIZE(i3c_bus_mode_strings) ||
> +	    i3cbus->mode >= ARRAY_SIZE(i3c_bus_mode_strings) ||
>  	    !i3c_bus_mode_strings[i3cbus->mode])
>  		ret = sprintf(buf, "unknown\n");
>  	else
