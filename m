From: Serge Semin <fancer.lancer@gmail.com>
Date: Thu, 26 Jan 2017 12:37:15 +0000
Subject: Re: [PATCH] eeprom: fix memory leak on buf when failed allocation of csraddr_str
Message-Id: <20170126123715.GA7785@mobilestation>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170124143838.9694-1-colin.king@canonical.com>
In-Reply-To: <20170124143838.9694-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 24, 2017 at 02:38:38PM +0000, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The error return path When csraddr_str fails to free buf, causing a
> memory leak. Fix this by returning via the free_buf label that
> performs the necessary cleanup.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/misc/eeprom/idt_89hpesx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_89hpesx.c
> index 25d47d0..56bc5c2 100644
> --- a/drivers/misc/eeprom/idt_89hpesx.c
> +++ b/drivers/misc/eeprom/idt_89hpesx.c
> @@ -965,8 +965,10 @@ static ssize_t idt_dbgfs_csr_write(struct file *filep, const char __user *ubuf,
>  		csraddr_len = colon_ch - buf;
>  		csraddr_str >  			kmalloc(sizeof(char)*(csraddr_len + 1), GFP_KERNEL);
> -		if (csraddr_str = NULL)
> -			return -ENOMEM;
> +		if (csraddr_str = NULL) {
> +			ret = -ENOMEM;
> +			goto free_buf;
> +		}
>  		/* Copy the register address to the substring buffer */
>  		strncpy(csraddr_str, buf, csraddr_len);
>  		csraddr_str[csraddr_len] = '\0';
> -- 
> 2.10.2
> 

Indeed. Thanks for the patch.

Acked-by: Serge Semin <fancer.lancer@gmail.com>

