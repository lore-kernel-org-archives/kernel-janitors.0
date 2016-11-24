From: Lubomir Rintel <lkundrak@v3.sk>
Date: Thu, 24 Nov 2016 10:48:01 +0000
Subject: Re: [patch] char/pcmcia: add some error checking in scr24x_read()
Message-Id: <1479984481.8204.0.camel@v3.sk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161124104623.GA17225@mwanda>
In-Reply-To: <20161124104623.GA17225@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Thu, 2016-11-24 at 13:46 +0300, Dan Carpenter wrote:
> The "ret = " assignment seems to have accidentally been left off.
> 
> Fixes: f2ed287bcc90 ("char/pcmcia: add scr24x_cs chip card interface
> driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/char/pcmcia/scr24x_cs.c
> b/drivers/char/pcmcia/scr24x_cs.c
> index 4f215ce..8523ec5 100644
> --- a/drivers/char/pcmcia/scr24x_cs.c
> +++ b/drivers/char/pcmcia/scr24x_cs.c
> @@ -157,7 +157,7 @@ static ssize_t scr24x_read(struct file *filp,
> char __user *buf, size_t count,
>  		ret = -EIO;
>  		goto out;
>  	}
> -	read_chunk(dev, CCID_HEADER_SIZE, len);
> +	ret = read_chunk(dev, CCID_HEADER_SIZE, len);
>  	if (ret < 0)
>  		goto out;


Acked-by: Lubomir Rintel <lkundrak@v3.sk>

Thank you,
Lubo
