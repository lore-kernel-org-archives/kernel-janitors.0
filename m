From: Jiri Slaby <jslaby@suse.cz>
Date: Fri, 02 Mar 2012 19:21:17 +0000
Subject: Re: [patch] tty: cyclades: clean up a type issue
Message-Id: <4F511DAD.1060108@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302064908.GA24508@elgon.mountain>
In-Reply-To: <20120302064908.GA24508@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 03/02/2012 07:49 AM, Dan Carpenter wrote:
> --- a/drivers/tty/cyclades.c
> +++ b/drivers/tty/cyclades.c
...
> @@ -2413,7 +2413,7 @@ static int get_lsr_info(struct cyclades_port *info, unsigned int __user *value)
>  		/* Not supported yet */
>  		return -EINVAL;
>  	}
> -	return put_user(result, (unsigned long __user *)value);
> +	return put_user(result, value);

This was and is wrong BTW. TIOCSERGETLSR should store to uint. Could you
fix that by removing the cast instead, please?

thanks,
-- 
js
suse labs
