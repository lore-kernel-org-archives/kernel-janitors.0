From: Jonathan Woithe <jwoithe@just42.net>
Date: Thu, 26 Feb 2015 22:16:03 +0000
Subject: Re: [patch] fujitsu-laptop: simplify show_brightness_changed()
Message-Id: <20150226220403.GA658@marvin.atrad.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150226204143.GF6820@mwanda>
In-Reply-To: <20150226204143.GF6820@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 26, 2015 at 11:41:43PM +0300, Dan Carpenter wrote:
> ->brightness_changed is either 0 or 1, and never a negative.  We can
> just remove this code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I agree.  Thanks for spotting this.

Acked-by: Jonathan Woithe <jwoithe@just42.net>

> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 2a9afa2..aa5ee98 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -444,14 +444,7 @@ static ssize_t
>  show_brightness_changed(struct device *dev,
>  			struct device_attribute *attr, char *buf)
>  {
> -
> -	int ret;
> -
> -	ret = fujitsu->brightness_changed;
> -	if (ret < 0)
> -		return ret;
> -
> -	return sprintf(buf, "%i\n", ret);
> +	return sprintf(buf, "%i\n", fujitsu->brightness_changed);
>  }
>  
>  static ssize_t show_lcd_level(struct device *dev,
