From: Amol Lad <amol@verismonetworks.com>
Date: Thu, 28 Sep 2006 12:06:50 +0000
Subject: Re: [KJ] [PATCH] check return code for request_region()
Message-Id: <1159444490.7264.22.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060928103514.GA12240@localhost.localdomain>
In-Reply-To: <20060928103514.GA12240@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 2006-09-28 at 07:40 -0300, Hashem Masoud wrote:
> Sorry, ignore the previous message. This is the correct patch.

Still not correct ;-). 

Please read
1. www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt
2. Documentation/SubmittingPatches

> 
> Signed-off-by: Hashem Masoud <masoudh@batelco.com.bh>
> 
> --- linux-2.6.17.13/sound/oss/gus_wave.c	2006-09-27 19:03:42.000000000 -0300
> +++ linux/sound/oss/gus_wave.c	2006-09-28 07:23:02.730614592 -0300
> @@ -2938,7 +2938,8 @@ void __init gus_wave_init(struct address
>  			model_num = "3.7";
>  			gus_type = 0x37;
>  			mixer_type = ICS2101;
> -			request_region(u_MixSelect, 1, "GUS mixer");
> +			if (!request_region(u_MixSelect, 1, "GUS mixer"))
> +				return;

You way want to add a printk before returning

>  		}
>  		else
>  		{
> @@ -3029,7 +3030,7 @@ void __init gus_wave_init(struct address
>  	samples = (struct patch_info *)vmalloc((MAX_SAMPLE + 1) * sizeof(*samples));
>  	if (samples = NULL)
>  	{
> -		printk(KERN_WARNING "gus_init: Cant allocate memory for instrument tables\n");
> +		printk(KERN_WARNING "gus_init: Cannot allocate memory for instrument tables\n");

This change has nothing to do with request_region. One _logical_ change
per patch

>  		return;
>  	}
>  	conf_printf(tmp, hw_config);
> @@ -3084,7 +3085,8 @@ void __init gus_wave_init(struct address
>  		case ICS2101:
>  			gus_mic_vol = gus_line_vol = gus_pcm_volume = 100;
>  			gus_wave_volume = 90;
> -			request_region(u_MixSelect, 1, "GUS mixer");
> +			if (!request_region(u_MixSelect, 1, "GUS mixer"))
> +				return;
>  			hw_config->slots[5] = ics2101_mixer_init();
>  			audio_devs[gus_devnum]->mixer_dev = hw_config->slots[5];	/* Next mixer# */
>  			return;
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
