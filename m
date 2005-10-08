From: a.othieno@bluewin.ch (Arthur Othieno)
Date: Sat, 08 Oct 2005 00:37:47 +0000
Subject: Re: [KJ] Spelling
Message-Id: <20051008003747.GC11630@mars>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============033563675725353459=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050703180846.13599.qmail@dns.toxicfilms.tv>
In-Reply-To: <20050703180846.13599.qmail@dns.toxicfilms.tv>
To: kernel-janitors@vger.kernel.org

--===============033563675725353459==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 03, 2005 at 06:09:02PM -0000, solt@dns.toxicfilms.tv wrote:
> Hello Janitors!
> 
> This is a small patchlet that fixes 3 common spelling mistakes I found
> using grep on 2.6.13-rc1-git5
> 
> These are:
> - "to big" instead of "too big"
> - "to much" instead of "too much"
> - "to many" instead of "too many"
 
[snip]

> diff -ru /var/tmp/linux-2.6.12.orig/arch/arm/common/locomo.c /usr/src/1/linux-2.6.12/arch/arm/common/locomo.c
> --- /var/tmp/linux-2.6.12.orig/arch/arm/common/locomo.c	2005-07-03 19:24:20.000000000 +0200
> +++ /usr/src/1/linux-2.6.12/arch/arm/common/locomo.c	2005-07-03 19:42:24.000000000 +0200
> @@ -127,7 +127,7 @@
>  
>  
>  /** LoCoMo interrupt handling stuff.
> - * NOTE: LoCoMo has a 1 to many mapping on all of its IRQs.
> + * NOTE: LoCoMo has a 1 too many mapping on all of its IRQs.

That was actually correct.

>   * that is, there is only one real hardware interrupt
>   * we determine which interrupt it is by reading some IO memory.
>   * We have two levels of expansion, first in the handler for the

[snip]

> diff -ru /var/tmp/linux-2.6.12.orig/drivers/usb/media/se401.c /usr/src/1/linux-2.6.12/drivers/usb/media/se401.c
> --- /var/tmp/linux-2.6.12.orig/drivers/usb/media/se401.c	2005-07-03 19:25:52.000000000 +0200
> +++ /usr/src/1/linux-2.6.12/drivers/usb/media/se401.c	2005-07-03 19:38:19.000000000 +0200
> @@ -720,7 +720,7 @@
>  		return;
>  	}
>  
> -	/* Check if we have to much data */
> +	/* Check if we have too much data */
>  	if (frame->curpix+len > datasize) {
>  		len=datasize-frame->curpix;
>  	}
> @@ -829,7 +829,7 @@
>  		);
>  		if (se401->nullpackets > SE401_MAX_NULLPACKETS) {
>  			se401->nullpackets=0;
> -			info("to many null length packets, restarting capture");
> +			info("too many null length packets, restarting capture");
>  			se401_stop_stream(se401);
>  			se401_start_stream(se401);			
>  		} else {
> @@ -849,7 +849,7 @@
>  				se401->scratch_use=0;
>  			if (errors > SE401_MAX_ERRORS) {
>  				errors=0;
> -				info("to much errors, restarting capture");
> +				info("too much errors, restarting capture");

"too many"

>  				se401_stop_stream(se401);
>  				se401_start_stream(se401);
>  			}

[snip]

> diff -ru /var/tmp/linux-2.6.12.orig/net/irda/ircomm/ircomm_tty_attach.c /usr/src/1/linux-2.6.12/net/irda/ircomm/ircomm_tty_attach.c
> --- /var/tmp/linux-2.6.12.orig/net/irda/ircomm/ircomm_tty_attach.c	2005-07-03 19:24:13.000000000 +0200
> +++ /usr/src/1/linux-2.6.12/net/irda/ircomm/ircomm_tty_attach.c	2005-07-03 19:40:23.000000000 +0200
> @@ -610,7 +610,7 @@
>  /*
>   * Function ircomm_tty_watchdog_timer_expired (data)
>   *
> - *    Called when the connect procedure have taken to much time.
> + *    Called when the connect procedure have taken too much time.

"has taken"

>   *
>   */
>  static void ircomm_tty_watchdog_timer_expired(void *data)

[snip]

> diff -ru /var/tmp/linux-2.6.12.orig/sound/pci/rme9652/hdspm.c /usr/src/1/linux-2.6.12/sound/pci/rme9652/hdspm.c
> --- /var/tmp/linux-2.6.12.orig/sound/pci/rme9652/hdspm.c	2005-07-03 19:25:29.000000000 +0200
> +++ /usr/src/1/linux-2.6.12/sound/pci/rme9652/hdspm.c	2005-07-03 19:40:55.000000000 +0200
> @@ -394,7 +394,7 @@
>  
>  	/* Mixer vars */
>  	snd_kcontrol_t *playback_mixer_ctls[HDSPM_MAX_CHANNELS];	/* fast alsa mixer */
> -	snd_kcontrol_t *input_mixer_ctls[HDSPM_MAX_CHANNELS];	/* but input to much, so not used */
> +	snd_kcontrol_t *input_mixer_ctls[HDSPM_MAX_CHANNELS];	/* but input too much, so not used */
>  	hdspm_mixer_t *mixer;	/* full mixer accessable over mixer ioctl or hwdep-device */
>  
>  };
> @@ -660,7 +660,7 @@
>  	}
>  
>  	/* hwpointer comes in bytes and is 64Bytes accurate (by docu since PCI Burst)
> -	   i have experimented that it is at most 64 Byte to much for playing 
> +	   i have experimented that it is at most 64 Byte too much for playing 
>  	   so substraction of 64 byte should be ok for ALSA, but use it only
>  	   for application where you know what you do since if you come to
>  	   near with record pointer it can be a disaster */
> @@ -1928,7 +1928,7 @@
>  }
>  
>  /*           Simple Mixer
> -  deprecated since to much faders ???
> +  deprecated since too much faders ???

"too many"

>    MIXER interface says output (source, destination, value)
>     where source > MAX_channels are playback channels 
>     on MADICARD 
> @@ -2270,7 +2270,8 @@
>  	}
>  
>  	/* Channel playback mixer as default control 
> -	   Note: the whole matrix would be 128*HDSPM_MIXER_CHANNELS Faders, thats to big for any alsamixer 
> +	   Note: the whole matrix would be 128*HDSPM_MIXER_CHANNELS Faders,
> +	   that is too big for any alsamixer 
>  	   they are accesible via special IOCTL on hwdep
>  	   and the mixer 2dimensional mixer control */
>  

--===============033563675725353459==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============033563675725353459==--
