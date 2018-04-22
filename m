From: Boris Brezillon <boris.brezillon@bootlin.com>
Date: Sun, 22 Apr 2018 17:13:34 +0000
Subject: Re: [PATCH 29/61] mtd: devices: simplify getting .drvdata
Message-Id: <20180422191334.784f7723@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-30-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-30-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org

On Thu, 19 Apr 2018 16:05:59 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to mtd/next.

Thanks,

Boris

> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/mtd/devices/docg3.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index c594fe5eac08..802d8f159e90 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -1470,8 +1470,7 @@ static struct docg3 *sysfs_dev2docg3(struct device *dev,
>  				     struct device_attribute *attr)
>  {
>  	int floor;
> -	struct platform_device *pdev = to_platform_device(dev);
> -	struct mtd_info **docg3_floors = platform_get_drvdata(pdev);
> +	struct mtd_info **docg3_floors = dev_get_drvdata(dev);
>  
>  	floor = attr->attr.name[1] - '0';
>  	if (floor < 0 || floor >= DOC_MAX_NBFLOORS)

