From: Akira shimahara <akira215corp@gmail.com>
Date: Wed, 20 May 2020 16:44:11 +0000
Subject: Re: [PATCH] w1_therm: Free the correct variable
Message-Id: <5f5b6a08acc94089caf3f9969579a45c4744c7b3.camel@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520120019.GA172354@mwanda>
In-Reply-To: <20200520120019.GA172354@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Evgeniy Polyakov <zbr@ioremap.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Fontana <rfontana@redhat.com>, Allison Randal <allison@lohutok.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

Le mercredi 20 mai 2020 à 15:00 +0300, Dan Carpenter a écrit :
> The problem is that we change "p_args" to point to the middle of the
> string so when we free it at the end of the function it's not freeing
> the same pointer that we originally allocated.
> 
> Fixes: e2c94d6f5720 ("w1_therm: adding alarm sysfs entry")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  I guess it must not cause too much of a problem
> at run time?
> 
>  drivers/w1/slaves/w1_therm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
> index cc4b88056b33..a6c85e486671 100644
> --- a/drivers/w1/slaves/w1_therm.c
> +++ b/drivers/w1/slaves/w1_therm.c
> @@ -1526,8 +1526,9 @@ static ssize_t alarms_store(struct device *device,
>  	int temp, ret = -EINVAL;
>  	char *token = NULL;
>  	s8 tl, th, tt;	/* 1 byte per value + temp ring order */
> -	char *p_args = kmalloc(size, GFP_KERNEL);
> +	char *p_args, *orig;
>  
> +	p_args = orig = kmalloc(size, GFP_KERNEL);
>  	/* Safe string copys as buf is const */
>  	if (!p_args) {
>  		dev_warn(device,
> @@ -1611,7 +1612,7 @@ static ssize_t alarms_store(struct device *device,
>  
>  free_m:
>  	/* free allocated memory */
> -	kfree(p_args);
> +	kfree(orig);
>  
>  	return size;
>  }

I tested it on several devices to be safe, no issue at runtime.
Sorry for the mistake and thanks for the fix.

Akira Shimahara
