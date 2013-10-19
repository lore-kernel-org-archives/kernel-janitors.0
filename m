From: Clemens Ladisch <clemens@ladisch.de>
Date: Sat, 19 Oct 2013 10:24:30 +0000
Subject: Re: [patch] firewire: info leak in ioctl_get_info()
Message-Id: <52625DDE.8010802@ladisch.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131019091020.GE9312@longonot.mountain>
In-Reply-To: <20131019091020.GE9312@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter wrote:
> There is a 4 byte hole in the bus_reset struct at the end of the struct
> after ->generation.

queue_bus_reset_event() uses kzalloc(), and ioctl_get_info() does not copy
the hole.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
> index d7d5c8a..d34adb3 100644
> --- a/drivers/firewire/core-cdev.c
> +++ b/drivers/firewire/core-cdev.c
> @@ -353,6 +353,8 @@ static void fill_bus_reset_event(struct fw_cdev_event_bus_reset *event,
>  {
>  	struct fw_card *card = client->device->card;
>
> +	memset(event, 0, sizeof(*event));
> +
>  	spin_lock_irq(&card->lock);
>
>  	event->closure	     = client->bus_reset_closure;


Regards,
Clemens
