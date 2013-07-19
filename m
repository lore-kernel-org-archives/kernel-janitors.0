From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 19 Jul 2013 10:28:41 +0000
Subject: Re: [patch] virtio: console: fix error handling for debugfs_create_dir()
Message-Id: <201307191228.41794.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130719055049.GD9729@elgon.mountain>
In-Reply-To: <20130719055049.GD9729@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Friday 19 July 2013, Dan Carpenter wrote:
> debugfs_create_dir() returns ERR_PTR(-ENODEV) if debugfs is disabled.
> Also my static checker doesn't like it when we print the error code, but
> it's always just NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This looks wrong.  debugfs_create_dir intentionally returns non-NULL so
failing to create the directory does not trigger an error condition if
debugfs is disabled.

	Arnd

> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> index 1b456fe..ad2cd6d 100644
> --- a/drivers/char/virtio_console.c
> +++ b/drivers/char/virtio_console.c
> @@ -2215,7 +2215,7 @@ static int __init init(void)
>         }
>  
>         pdrvdata.debugfs_dir = debugfs_create_dir("virtio-ports", NULL);
> -       if (!pdrvdata.debugfs_dir) {
> +       if (IS_ERR_OR_NULL(pdrvdata.debugfs_dir)) {
>                 pr_warning("Error %ld creating debugfs dir for virtio-ports\n",
>                            PTR_ERR(pdrvdata.debugfs_dir));
>         }

