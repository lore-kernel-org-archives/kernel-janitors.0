From: Colin Ian King <colin.king@canonical.com>
Date: Sun, 05 Apr 2020 13:35:43 +0000
Subject: Re: [PATCH] drivers/tty: emove redundant assignment to variable i and rename it to ret
Message-Id: <dd83c6dc-da74-e961-4a25-b6515742052a@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200405133013.380080-1-colin.king@canonical.com>
In-Reply-To: <20200405133013.380080-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Oops, typo on $SUBJECT, can "emove" be replaced with "remove" when this
is applied?

On 05/04/2020 14:30, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable i is being assigned a value that is never read
> and it is being updated later with a new value. The assignment
> is redundant and can be removed.  Also rename i to ret as this new
> name makes makes more sense.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/tty/serial/8250/serial_cs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/serial_cs.c b/drivers/tty/serial/8250/serial_cs.c
> index c8186a05a453..e3d10794dbba 100644
> --- a/drivers/tty/serial/8250/serial_cs.c
> +++ b/drivers/tty/serial/8250/serial_cs.c
> @@ -440,7 +440,7 @@ static int simple_config_check_notpicky(struct pcmcia_device *p_dev,
>  static int simple_config(struct pcmcia_device *link)
>  {
>  	struct serial_info *info = link->priv;
> -	int i = -ENODEV, try;
> +	int ret, try;
>  
>  	/*
>  	 * First pass: look for a config entry that looks normal.
> @@ -472,8 +472,8 @@ static int simple_config(struct pcmcia_device *link)
>  	if (info->quirk && info->quirk->config)
>  		info->quirk->config(link);
>  
> -	i = pcmcia_enable_device(link);
> -	if (i != 0)
> +	ret = pcmcia_enable_device(link);
> +	if (ret != 0)
>  		return -1;
>  	return setup_serial(link, info, link->resource[0]->start, link->irq);
>  }
> 
