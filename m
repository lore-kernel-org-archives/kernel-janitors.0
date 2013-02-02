From: walter harms <wharms@bfs.de>
Date: Sat, 02 Feb 2013 09:51:43 +0000
Subject: Re: [patch] sony-laptop: leak in error handling sony_nc_lid_resume_setup()
Message-Id: <510CE1AF.3070101@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130201132826.GA23374@elgon.mountain>
In-Reply-To: <20130201132826.GA23374@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mattia Dongili <malattia@linux.it>, Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 01.02.2013 14:28, schrieb Dan Carpenter:
> We need to decrement "i" first because the current "i" was not allocated
> succesfully.  Also we should go free the way down to zero to avoid a
> leak.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 438c7fa..9557414 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -2351,7 +2351,7 @@ static int sony_nc_lid_resume_setup(struct platform_device *pd)
>  	return 0;
>  
>  liderror:
> -	for (; i > 0; i--)
> +	for (i--; i >= 0; i--)
>  		device_remove_file(&pd->dev, &lid_ctl->attrs[i]);
>  
>  	kfree(lid_ctl);

i have learned that most people get confused when you do loop
"the-other-way-around". (typical errors see above). Maybe it
would be better foe further generations to turn the loop on its
head like:

int c;
for(c=0; c < i ; c++)
    device_remove_file(&pd->dev, &lid_ctl->attrs[c]);
kfree(lid_ctl);

re,
 wh

yes, there is one var more

> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
