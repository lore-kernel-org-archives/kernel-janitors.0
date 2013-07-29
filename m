From: Amit Shah <amit.shah@redhat.com>
Date: Mon, 29 Jul 2013 07:23:31 +0000
Subject: Re: [patch v2] virtio: console: cleanup an error message
Message-Id: <20130729071131.GD15142@amit-x200.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201307191228.41794.arnd@arndb.de>
	<20130722204100.GB22020@elgon.mountain>
In-Reply-To: <20130722204100.GB22020@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, virtualization@lists.linux-foundation.org

On (Mon) 22 Jul 2013 [23:41:00], Dan Carpenter wrote:
> The PTR_ERR(NULL) here is not useful.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: completely different
> 
> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> index 1b456fe..4cf46d8 100644
> --- a/drivers/char/virtio_console.c
> +++ b/drivers/char/virtio_console.c
> @@ -2215,10 +2215,8 @@ static int __init init(void)
>  	}
>  
>  	pdrvdata.debugfs_dir = debugfs_create_dir("virtio-ports", NULL);
> -	if (!pdrvdata.debugfs_dir) {
> -		pr_warning("Error %ld creating debugfs dir for virtio-ports\n",
> -			   PTR_ERR(pdrvdata.debugfs_dir));
> -	}
> +	if (!pdrvdata.debugfs_dir)
> +		pr_warning("Error creating debugfs dir for virtio-ports\n");

When debugfs is enabled and creating the dir fails, we'll print this
warning message.

When debugfs is disabled, we'll get an error return, and not print any
message.

Seems OK to me.

Reviewed-by: Amit Shah <amit.shah@redhat.com>

Rusty, please pick this up.

		Amit
