From: Jiri Slaby <jslaby@suse.cz>
Date: Mon, 06 Apr 2020 04:33:09 +0000
Subject: Re: [PATCH][V2] drivers/tty: remove redundant assignment to variable i and rename it to ret
Message-Id: <c8b99419-856d-b557-9dd7-f61baea2fdb9@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200405135423.383466-1-colin.king@canonical.com>
In-Reply-To: <20200405135423.383466-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05. 04. 20, 15:54, Colin King wrote:
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
> V2: fix typo in subject line
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

LGTM, so
Acked-by: Jiri Slaby <jslaby@suse.cz>

But it would be worth to change this function and its callers to accept
and propagate real errors too. I.e. "return ret" here.

thanks,
-- 
js
suse labs
