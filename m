From: David Fries <David@Fries.net>
Date: Tue, 02 Jun 2015 12:12:55 +0000
Subject: Re: [patch 2/2] w1: unlock correct lock on error in w1_seq_show()
Message-Id: <20150602121255.GA20149@spacedout.fries.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150601095632.GB897@mwanda>
In-Reply-To: <20150601095632.GB897@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Evgeniy Polyakov <zbr@ioremap.net>, Matt Campbell <mattrcampbell@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks for including me, I'm going to have to nack this though, it is
an error, but bus_mutex is correct, mutex is incorrect, so the other
two lock/unlock in that routine are the ones that need to be changed.

w1.h
 * @mutex:              protect most of w1_master
 * @bus_mutex:          pretect concurrent bus access

On Mon, Jun 01, 2015 at 12:56:32PM +0300, Dan Carpenter wrote:
> Smatch complains that we don't unlock "master->mutex" on this error
> path.  It looks like it is a typo and we unlock ->bus_mutext where
> ->mutex was intended.
> 
> Fixes: d9411e57dc7f ('w1: Add support for DS28EA00 sequence to w1-therm')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
> index 3351be6..79ecaf8 100644
> --- a/drivers/w1/slaves/w1_therm.c
> +++ b/drivers/w1/slaves/w1_therm.c
> @@ -412,7 +412,7 @@ static ssize_t w1_seq_show(struct device *device,
>  	c -= snprintf(buf + PAGE_SIZE - c, c, "%d\n", seq);
>  	return PAGE_SIZE - c;
>  error:
> -	mutex_unlock(&sl->master->bus_mutex);
> +	mutex_unlock(&sl->master->mutex);
>  	return -EIO;
>  }
>  

-- 
David Fries <david@fries.net>
