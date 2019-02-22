From: Corey Minyard <minyard@acm.org>
Date: Fri, 22 Feb 2019 21:00:42 +0000
Subject: Re: [PATCH] ipmi_si: Potential array underflow in hotmod_handler()y
Message-Id: <20190222210042.GE2549@minyard.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190222195530.GA306@kadam>
In-Reply-To: <20190222195530.GA306@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 22, 2019 at 10:55:30PM +0300, Dan Carpenter wrote:
> The "ival" variable needs to signed so that we don't read before the
> start of the str[] array.  This would only happen the user passed in a
> module parameter that was just comprised of space characters.

That was quick, I just uploaded that to linux-next yesterday.  Thanks
for this, yes you are right.  Added to my queue.

-corey

> 
> Fixes: e80444ae4fc3 ("ipmi_si: Switch hotmod to use a platform device")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/char/ipmi/ipmi_si_hotmod.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_si_hotmod.c b/drivers/char/ipmi/ipmi_si_hotmod.c
> index 1433055a9705..03140f6cdf6f 100644
> --- a/drivers/char/ipmi/ipmi_si_hotmod.c
> +++ b/drivers/char/ipmi/ipmi_si_hotmod.c
> @@ -187,7 +187,8 @@ static int hotmod_handler(const char *val, const struct kernel_param *kp)
>  	char *str = kstrdup(val, GFP_KERNEL), *curr, *next;
>  	int  rv;
>  	struct ipmi_plat_data h;
> -	unsigned int len, ival;
> +	unsigned int len;
> +	int ival;
>  
>  	if (!str)
>  		return -ENOMEM;
> -- 
> 2.17.1
> 
