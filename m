From: Jiri Slaby <jslaby@suse.com>
Date: Wed, 24 Jul 2019 10:09:06 +0000
Subject: Re: [PATCH] tty/isicom: remove redundant assignment to variable word_count
Message-Id: <90da3a1d-ff0f-937b-d212-bb5428486768@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190723150314.14513-1-colin.king@canonical.com>
In-Reply-To: <20190723150314.14513-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 23. 07. 19, 17:03, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable word_count is being assigned a value that is never read before
> a return, the assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good, it predates git. Maybe the while loop wanted to use
word_count originally.

Acked-by: Jiri Slaby <jslaby@suse.cz>

> ---
>  drivers/tty/isicom.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/tty/isicom.c b/drivers/tty/isicom.c
> index e04a43e89f6b..fc38f96475bf 100644
> --- a/drivers/tty/isicom.c
> +++ b/drivers/tty/isicom.c
> @@ -553,7 +553,6 @@ static irqreturn_t isicom_interrupt(int irq, void *dev_id)
>  
>  	tty = tty_port_tty_get(&port->port);
>  	if (tty = NULL) {
> -		word_count = byte_count >> 1;
>  		while (byte_count > 1) {
>  			inw(base);
>  			byte_count -= 2;
> 


-- 
js
suse labs
