From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 04 Jun 2015 10:24:37 +0000
Subject: Re: [patch] [media] gspca: sn9c2028: remove an unneeded condition
Message-Id: <55702765.5080401@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150604085226.GA22838@mwanda>
In-Reply-To: <20150604085226.GA22838@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 04-06-15 10:52, Dan Carpenter wrote:
> We already know status is negative because of the earlier check so there
> is no need to check again.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Makes sense:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Mauro, can you pick this one up directly please?

Regards,

Hans


>
> diff --git a/drivers/media/usb/gspca/sn9c2028.c b/drivers/media/usb/gspca/sn9c2028.c
> index c75b738..4f2050a 100644
> --- a/drivers/media/usb/gspca/sn9c2028.c
> +++ b/drivers/media/usb/gspca/sn9c2028.c
> @@ -140,7 +140,7 @@ static int sn9c2028_long_command(struct gspca_dev *gspca_dev, u8 *command)
>   		status = sn9c2028_read1(gspca_dev);
>   	if (status < 0) {
>   		pr_err("long command status read error %d\n", status);
> -		return (status < 0) ? status : -EIO;
> +		return status;
>   	}
>
>   	memset(reading, 0, 4);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
