From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 21 Aug 2006 23:53:38 +0000
Subject: Re: [KJ] [PATCH] Unhandled return values in acpi/video.c
Message-Id: <20060821235338.GC5220@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1156181320.10063.8.camel@localhost.localdomain>
In-Reply-To: <1156181320.10063.8.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 21, 2006 at 08:28:40PM +0300, ville palo wrote:
> Is there any particular reason not to care about return values of
> the acpi_remove_notify_handler()? If there is some reason,
> status variable is declared for nothing. If there aren't any reasons,
> this patch should solve the issue.

The thing is that all of this kinda pointless because mentioned return
values will be forgotten on upper layers.

> --- a/drivers/acpi/video.c
> +++ b/drivers/acpi/video.c
> @@ -1569,7 +1569,7 @@ static int acpi_video_bus_put_one_device
>                                             ACPI_DEVICE_NOTIFY,
>                                             acpi_video_device_notify);
>
> -       return 0;
> +       return status;
>  }


Assume, this happened. Then type of acpi_video_bus_put_one_device()
will be changed to acpi_status and check at the beginning dropped.
What a single caller of it do with return value? It spams logs and
forgetting it. Assume we return status even from
acpi_video_bus_put_devices() (and change return type). It will again be
forgotten since both callers don't bother with it.

The real question is at which point return values should be dropped?

>  static int acpi_video_bus_put_devices(struct acpi_video_bus *video)
> @@ -1771,7 +1771,7 @@ static int acpi_video_bus_remove(struct
>         kfree(video->attached_array);
>         kfree(video);
>
> -       return 0;
> +       return status;
>  }

Ditto: acpi_video_bus_remove() is ->remove method which is called (and
probably should be called) without checking at all.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
