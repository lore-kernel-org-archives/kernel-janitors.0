From: Hans de Goede <hdegoede@redhat.com>
Date: Sun, 23 Feb 2014 21:47:50 +0000
Subject: Re: [patch] [media] gspca_stv06xx: remove an unneeded check
Message-Id: <530A6C86.6010707@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140218150044.GC6914@elgon.mountain>
In-Reply-To: <20140218150044.GC6914@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, Theodore Kilgore <kilgota@banach.math.auburn.edu>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 02/18/2014 04:00 PM, Dan Carpenter wrote:
> "err" is zero here so we don't need to check again.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c b/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c
> index bf3e5c317a26..e60cbb3aa609 100644
> --- a/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c
> +++ b/drivers/media/usb/gspca/stv06xx/stv06xx_vv6410.c
> @@ -178,7 +178,7 @@ static int vv6410_stop(struct sd *sd)
>  
>  	PDEBUG(D_STREAM, "Halting stream");
>  
> -	return (err < 0) ? err : 0;
> +	return 0;
>  }
>  
>  static int vv6410_dump(struct sd *sd)
> 

Thanks I've added this to my gspca tree for 3.15.

Regards,

Hans
