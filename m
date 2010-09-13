From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Mon, 13 Sep 2010 08:53:43 +0000
Subject: Re: [patch] mtd: sanity check input
Message-Id: <1284368023.27765.179.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100908193956.GB3463@bicker>
In-Reply-To: <20100908193956.GB3463@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>, linux-mtd@lists.infradead.org, Ben Hutchings <bhutchings@solarflare.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, David Woodhouse <dwmw2@infradead.org>

On Wed, 2010-09-08 at 21:39 +0200, Dan Carpenter wrote:
> If "ur_idx" is wrong we could go past the end of the array.  The
> "ur_idx" comes from root so it's not a huge deal, but adding a sanity
> check makes the code more robust.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index a825002..9c00549 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -513,6 +513,9 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
>  		if (get_user(ur_idx, &(ur->regionindex)))
>  			return -EFAULT;
>  
> +		if (ur_idx >= mtd->numeraseregions)
> +			return -EINVAL;
> +

Pushed to l2-mtd-2.6.git with my "Signed-off-by", thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

