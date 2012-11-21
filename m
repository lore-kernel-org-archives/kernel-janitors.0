From: "Rafael J. Wysocki" <rjw@sisk.pl>
Date: Wed, 21 Nov 2012 00:44:59 +0000
Subject: Re: [PATCH] acpi_system_write_wakeup_device(): fix error check for unsigned variable.
Message-Id: <1732852.VDXGV3Ao2T@vostro.rjw.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1353117263-6957-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1353117263-6957-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Roelandt <tipecaml@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, lenb@kernel.org, kernel-janitors@vger.kernel.org

On Saturday, November 17, 2012 02:54:23 AM Cyril Roelandt wrote:
> The LEN variable is unsigned, therefore checking whether it is less than 0 is
> useless.
> 
> Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
> ---
>  drivers/acpi/proc.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/acpi/proc.c b/drivers/acpi/proc.c
> index 27adb09..37871a7 100644
> --- a/drivers/acpi/proc.c
> +++ b/drivers/acpi/proc.c
> @@ -366,8 +366,6 @@ acpi_system_write_wakeup_device(struct file *file,
>  
>  	if (len > 4)
>  		len = 4;
> -	if (len < 0)
> -		return -EFAULT;

I would prefer to check if count < 0 instead.

>  
>  	if (copy_from_user(strbuf, buffer, len))
>  		return -EFAULT;

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
