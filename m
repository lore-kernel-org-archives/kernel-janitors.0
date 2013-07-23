From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 23 Jul 2013 04:35:10 +0000
Subject: Re: [patch v2] virtio: console: cleanup an error message
Message-Id: <20130723043510.GA26883@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201307191228.41794.arnd@arndb.de>
	<20130722204100.GB22020@elgon.mountain>
In-Reply-To: <20130722204100.GB22020@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amit Shah <amit.shah@redhat.com>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, virtualization@lists.linux-foundation.org

On Mon, Jul 22, 2013 at 11:41:00PM +0300, Dan Carpenter wrote:
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

Rusty handles virtio stuff, please cc: him on these.

thanks,

greg k-h
