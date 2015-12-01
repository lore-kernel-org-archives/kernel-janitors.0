From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 01 Dec 2015 09:24:31 +0000
Subject: Re: MAINTAINERS: update a file name in drivers/acpi/
Message-Id: <alpine.DEB.2.10.1512011023270.2736@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151201085840.GA26852@mwanda>
In-Reply-To: <20151201085840.GA26852@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 1 Dec 2015, Dan Carpenter wrote:

> We renamed drivers/acpi/video.c to drivers/acpi/acpi_video.c in commit
> 14ca7a47d0ab ('acpi-video-detect: video: Make video_detect code part of
> the video module').

Actually, someone asked me recently who is the maintainer of MAINTAINERS,
and it didn't seem obvious.  Is it Andrew?

thanks,
julia

>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f3de001..736a103 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -318,7 +318,7 @@ M:	Zhang Rui <rui.zhang@intel.com>
>  L:	linux-acpi@vger.kernel.org
>  W:	https://01.org/linux-acpi
>  S:	Supported
> -F:	drivers/acpi/video.c
> +F:	drivers/acpi/acpi_video.c
>
>  ACPI WMI DRIVER
>  L:	platform-driver-x86@vger.kernel.org
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
