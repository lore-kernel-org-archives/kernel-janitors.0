From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 26 Jul 2010 08:35:20 +0000
Subject: Re: [PATCH] oss: au1550_ac97: simplify au1550_delay()
Message-Id: <s5h1vaqy71z.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280132913-8306-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280132913-8306-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>

At Mon, 26 Jul 2010 12:28:32 +0400,
Kulikov Vasiliy wrote:
> 
> au1550_delay() uses loop with schedule_timeout() to unconditionally wait
> for msec. Use schedule_timeout_uninteruptible() instead.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Thanks, applied both patches.


Takashi

> ---
>  sound/oss/au1550_ac97.c |   11 +----------
>  1 files changed, 1 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/oss/au1550_ac97.c b/sound/oss/au1550_ac97.c
> index 0fd256c..c4a4cdc 100644
> --- a/sound/oss/au1550_ac97.c
> +++ b/sound/oss/au1550_ac97.c
> @@ -163,19 +163,10 @@ ld2(unsigned int x)
>  static void
>  au1550_delay(int msec)
>  {
> -	unsigned long   tmo;
> -	signed long     tmo2;
> -
>  	if (in_interrupt())
>  		return;
>  
> -	tmo = jiffies + (msec * HZ) / 1000;
> -	for (;;) {
> -		tmo2 = tmo - jiffies;
> -		if (tmo2 <= 0)
> -			break;
> -		schedule_timeout(tmo2);
> -	}
> +	schedule_timeout_uninterruptible(msecs_to_jiffies(msec));
>  }
>  
>  static u16
> -- 
> 1.7.0.4
> 
