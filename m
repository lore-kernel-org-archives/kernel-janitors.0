From: walter harms <wharms@bfs.de>
Date: Sun, 03 Oct 2010 13:09:36 +0000
Subject: Re: [PATCH v3 18/20] Staging: vt6656: Makefile: cleaned up Makefile
Message-Id: <4CA88090.2030100@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286037489-28439-1-git-send-email-tdent48227@gmail.com> <1286037489-28439-18-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286037489-28439-18-git-send-email-tdent48227@gmail.com>
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
>  drivers/staging/vt6656/Makefile |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vt6656/Makefile b/drivers/staging/vt6656/Makefile
> index 582a35197..41ed06b 100644
> --- a/drivers/staging/vt6656/Makefile
> +++ b/drivers/staging/vt6656/Makefile
> @@ -1,6 +1,6 @@
>  # TODO: all of these should be removed
> -EXTRA_CFLAGS += -DLINUX -D__KERNEL__ -DEXPORT_SYMTAB -D__NO_VERSION__
> -EXTRA_CFLAGS += -DHOSTAP
> +ccflags-y := -DLINUX -D__KERNEL__ -DEXPORT_SYMTAB -D__NO_VERSION__
> +ccflags-y += -DHOSTAP
>  
>  vt6656_stage-y +=	main_usb.o \
>  			card.o  \


I am wondering what will happen when we remove -DLINUX will it think we are _DOS_ ?
re,
 wh
