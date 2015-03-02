From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Mar 2015 09:10:50 +0000
Subject: Re: [PATCH 1/7] mtd: docg3: drop dead code
Message-Id: <20150302091050.GC5386@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
 <1425117750-22298-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Norris <computersforpeace@gmail.com>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

On Sat, Feb 28, 2015 at 02:02:24AM -0800, Brian Norris wrote:
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 448ce42f951e..01eddea1f0d9 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -2079,8 +2079,6 @@ static int __init docg3_probe(struct platform_device *pdev)
>  	ret = doc_register_sysfs(pdev, cascade);
>  	if (ret)
>  		goto err_probe;
> -	if (!found)
> -		goto notfound;

Just delete the "found" variable because there are no other uses.

regards,
dan carpenter

