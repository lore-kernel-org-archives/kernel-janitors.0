From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 24 Feb 2005 16:06:55 +0000
Subject: Re: [KJ] [PATCH] drivers/i2c/chips/* : timer_after
Message-Id: <421DFB9F.6040804@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050224095217.GB2721@rhum.iomeda.fr>
In-Reply-To: <20050224095217.GB2721@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Christophe Lucas wrote:
> Hi kj folks,
> 
> I think this patch have already posted, but kj TODO have been recently
> updated, and this entry already is here, so:
> 
> description:
>>From kj/TODO:
> 4.
> Some drivers do:
> if ((jiffies - data->last_updated > HZ * 2) ||
>             (jiffies < data->last_updated))
> Should be:
> #include <linux/jiffies.h>
> if (time_after(jiffies, data->last_updated + HZ * 2))

I see that Alexey's patch is already merged, but in the continuing
spirit of KJ mentoring...  :)

It would make sense in several of these to check for '!data_valid'
before the time_after() test instead of after it, as is done
in the last patch segment.

> ------------------------------------------------------------------------
> 
> diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/i2c/chips/adm1025.c linux-2.6.11-rc4/drivers/i2c/chips/adm1025.c
> --- linux-2.6.11-rc4-vanilla/drivers/i2c/chips/adm1025.c	2004-12-24 22:33:47.000000000 +0100
> +++ linux-2.6.11-rc4/drivers/i2c/chips/adm1025.c	2005-02-24 09:30:35.000000000 +0100
> @@ -512,8 +513,7 @@ static struct adm1025_data *adm1025_upda
>  
>  	down(&data->update_lock);
>  
> -	if ((jiffies - data->last_updated > HZ * 2) ||
> -	    (jiffies < data->last_updated) ||
> +	if (time_after(jiffies, data->last_updated + HZ * 2) || 
>  	    !data->valid) {
>  		int i;
>  
> diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/i2c/chips/lm83.c linux-2.6.11-rc4/drivers/i2c/chips/lm83.c
> --- linux-2.6.11-rc4-vanilla/drivers/i2c/chips/lm83.c	2004-12-24 22:34:32.000000000 +0100
> +++ linux-2.6.11-rc4/drivers/i2c/chips/lm83.c	2005-02-24 09:27:07.000000000 +0100
> @@ -369,8 +370,7 @@ static struct lm83_data *lm83_update_dev
>  
>  	down(&data->update_lock);
>  
> -	if ((jiffies - data->last_updated > HZ * 2) ||
> -	    (jiffies < data->last_updated) ||
> +	if (time_after(jiffies, data->last_updated + HZ * 2) || 
>  	    !data->valid) {
>  		int nr;
>  
> diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/i2c/chips/lm90.c linux-2.6.11-rc4/drivers/i2c/chips/lm90.c
> --- linux-2.6.11-rc4-vanilla/drivers/i2c/chips/lm90.c	2005-02-24 09:34:22.000000000 +0100
> +++ linux-2.6.11-rc4/drivers/i2c/chips/lm90.c	2005-02-24 09:26:55.000000000 +0100
> @@ -495,8 +496,7 @@ static struct lm90_data *lm90_update_dev
>  
>  	down(&data->update_lock);
>  
> -	if ((jiffies - data->last_updated > HZ * 2) ||
> -	    (jiffies < data->last_updated) ||
> +	if ( time_after(jiffies, data->last_updated + HZ * 2) || 
>  	    !data->valid) {
>  		u8 oldh, newh;
>  
> diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/i2c/chips/max1619.c linux-2.6.11-rc4/drivers/i2c/chips/max1619.c
> --- linux-2.6.11-rc4-vanilla/drivers/i2c/chips/max1619.c	2004-12-24 22:35:25.000000000 +0100
> +++ linux-2.6.11-rc4/drivers/i2c/chips/max1619.c	2005-02-24 09:27:54.000000000 +0100
> @@ -331,8 +332,7 @@ static struct max1619_data *max1619_upda
>  
>  	down(&data->update_lock);
>  
> -	if ((jiffies - data->last_updated > HZ * 2) ||
> -	    (jiffies < data->last_updated) ||
> +	if (time_after(jiffies, data->last_updated + HZ * 2) ||
>  	    !data->valid) {
>  		
>  		dev_dbg(&client->dev, "Updating max1619 data.\n");
> diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/i2c/chips/pc87360.c linux-2.6.11-rc4/drivers/i2c/chips/pc87360.c
> --- linux-2.6.11-rc4-vanilla/drivers/i2c/chips/pc87360.c	2005-02-24 09:34:22.000000000 +0100
> +++ linux-2.6.11-rc4/drivers/i2c/chips/pc87360.c	2005-02-24 09:29:04.000000000 +0100
> @@ -1174,8 +1175,7 @@ static struct pc87360_data *pc87360_upda
>  
>  	down(&data->update_lock);
>  
> -	if ((jiffies - data->last_updated > HZ * 2)
> -	 || (jiffies < data->last_updated) || !data->valid) {
> +	if (time_after(jiffies, data->last_updated + HZ * 2) || !data->valid) {
>  		dev_dbg(&client->dev, "Data update\n");
>  
>  		/* Fans */
> diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/i2c/chips/w83l785ts.c linux-2.6.11-rc4/drivers/i2c/chips/w83l785ts.c
> --- linux-2.6.11-rc4-vanilla/drivers/i2c/chips/w83l785ts.c	2004-12-24 22:34:26.000000000 +0100
> +++ linux-2.6.11-rc4/drivers/i2c/chips/w83l785ts.c	2005-02-24 09:30:17.000000000 +0100
> @@ -301,9 +302,7 @@ static struct w83l785ts_data *w83l785ts_
>  
>  	down(&data->update_lock);
>  
> -	if (!data->valid
> -	 || (jiffies - data->last_updated > HZ * 2)
> -	 || (jiffies < data->last_updated)) {
> +	if (!data->valid || time_after(jiffies, data->last_updated + HZ * 2)) {
>  		dev_dbg(&client->dev, "Updating w83l785ts data.\n");


-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
