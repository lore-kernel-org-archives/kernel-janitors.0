From: walter harms <wharms@bfs.de>
Date: Sun, 03 Oct 2010 12:47:37 +0000
Subject: Re: [PATCH v3 09/20] Staging: rtl8187se: Makefile: cleaned up Makefile
Message-Id: <4CA87B69.3060105@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286037489-28439-1-git-send-email-tdent48227@gmail.com> <1286037489-28439-9-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286037489-28439-9-git-send-email-tdent48227@gmail.com>
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
>  drivers/staging/rtl8187se/Makefile |   14 +++++++-------
>  1 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8187se/Makefile b/drivers/staging/rtl8187se/Makefile
> index e6adf91..adc3849 100644
> --- a/drivers/staging/rtl8187se/Makefile
> +++ b/drivers/staging/rtl8187se/Makefile
> @@ -4,17 +4,17 @@
>  #EXTRA_CFLAGS += -O2
>  #CC            = gcc
>  
> -EXTRA_CFLAGS += -DSW_ANTE
> -EXTRA_CFLAGS += -DTX_TRACK
> -EXTRA_CFLAGS += -DHIGH_POWER
> -EXTRA_CFLAGS += -DSW_DIG
> -EXTRA_CFLAGS += -DRATE_ADAPT
> +ccflags-y := -DSW_ANTE
> +ccflags-y += -DTX_TRACK
> +ccflags-y += -DHIGH_POWER
> +ccflags-y += -DSW_DIG
> +ccflags-y += -DRATE_ADAPT
>  
>  #enable it for legacy power save, disable it for leisure  power save
> -EXTRA_CFLAGS += -DENABLE_LPS
> +ccflags-y += -DENABLE_LPS
>  
>  
> -#EXTRA_CFLAGS += -mhard-float -DCONFIG_FORCE_HARD_FLOAT=y
> +#ccflags-y := -mhard-float -DCONFIG_FORCE_HARD_FLOAT=y
>  

so every time someone selects "my cpu does not have hard-float
they will try it again, and to make sure that it will cause max
confusion it sets CONFIG_FORCE_HARD_FLOAT to yes.

re,
 wh





>  r8187se-objs :=			\
>  		r8180_core.o		\
