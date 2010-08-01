From: Sergei Shtylyov <sshtylyov@mvista.com>
Date: Sun, 01 Aug 2010 10:06:38 +0000
Subject: Re: [PATCH 5/7] usb: omap_udc: check return value of proc_create()
Message-Id: <4C55472E.6000307@ru.mvista.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280597965-8525-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280597965-8525-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, Tony Lindgren <tony@atomide.com>, Cory Maccarrone <darkstar6262@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Hello.

Kulikov Vasiliy wrote:

> proc_create() may fail, if so return -ENOMEM.

> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
[...]
> diff --git a/drivers/usb/gadget/omap_udc.c b/drivers/usb/gadget/omap_udc.c
> index f81e4f0..1083216 100644
> --- a/drivers/usb/gadget/omap_udc.c
> +++ b/drivers/usb/gadget/omap_udc.c
> @@ -2544,9 +2544,9 @@ static const struct file_operations proc_ops = {
>  	.release	= single_release,
>  };
>  
> -static void create_proc_file(void)
> +static int create_proc_file(void)
>  {
> -	proc_create(proc_filename, 0, NULL, &proc_ops);
> +	return (proc_create(proc_filename, 0, NULL, &proc_ops) = NULL);

    Parens not needed around the *return* expression.

WBR, Sergei
