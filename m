From: walter harms <wharms@bfs.de>
Date: Sun, 03 Oct 2010 12:40:01 +0000
Subject: Re: [PATCH v3 01/20] Staging: cx25821: Makefile: cleaned up Makefile
Message-Id: <4CA879A1.3070400@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286037489-28439-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286037489-28439-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tracey Dent <tdent48227@gmail.com>
Cc: greg@kroah.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org



Tracey Dent schrieb:
> Changed to use the proper ccflags-y option
> 
> Signed-off-by: Tracey Dent <tdent48227@gmail.com>
> ---
>  drivers/staging/cx25821/Makefile |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/cx25821/Makefile b/drivers/staging/cx25821/Makefile
> index d0eb16e..6448364 100644
> --- a/drivers/staging/cx25821/Makefile
> +++ b/drivers/staging/cx25821/Makefile
> @@ -7,7 +7,7 @@ cx25821-objs   := cx25821-core.o cx25821-cards.o cx25821-i2c.o \
>  obj-$(CONFIG_VIDEO_CX25821) += cx25821.o
>  obj-$(CONFIG_VIDEO_CX25821_ALSA) += cx25821-alsa.o
>  
> -EXTRA_CFLAGS += -Idrivers/media/video
> -EXTRA_CFLAGS += -Idrivers/media/common/tuners
> -EXTRA_CFLAGS += -Idrivers/media/dvb/dvb-core
> -EXTRA_CFLAGS += -Idrivers/media/dvb/frontends
> +ccflags-y := -Idrivers/media/video
> +ccflags-y += -Idrivers/media/common/tuners
> +ccflags-y += -Idrivers/media/dvb/dvb-core
> +ccflags-y += -Idrivers/media/dvb/frontends

they have invented vpath for this, did they ?
note: I am not familiar with the linux makefile.

re,
 wh
