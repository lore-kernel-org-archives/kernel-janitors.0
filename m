From: maximilian attems <janitor@sternwelten.at>
Date: Wed, 18 Feb 2004 11:33:31 +0000
Subject: Re: [Kernel-janitors] [PATCH] Moving MODULE_LICENSE();
Message-Id: <20040218113331.GH1606@mail.sternwelten.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1077084589.6225.1.camel@mugen>
In-Reply-To: <1077084589.6225.1.camel@mugen>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 18 Feb 2004, Fry wrote:

> My first kernel patch. Hope I didn't miss one.

consider to send in one patch / file

> --- linux-2.6.3/drivers/video-old/amifb.c	2004-02-18 16:59:33.001422464 +1100
> +++ linux-2.6.3/drivers/video/amifb.c	2004-02-18 16:43:33.267324224 +1100
> @@ -3812,7 +3812,6 @@
>  
>  
>  #ifdef MODULE
> -MODULE_LICENSE("GPL");
>  
>  int init_module(void)
>  {
> @@ -3826,3 +3825,5 @@
>  	amifb_video_off();
>  }
>  #endif /* MODULE */
> +
> +MODULE_LICENSE("GPL");
> [ snipped ]

that doesn't make much sense
please look at lwn.net the driver porting series
http://lwn.net/Articles/driver-porting/

init_module is 2.4 style not 2.6 

good luck so far :)
regards
maks





_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
