From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Oct 2011 10:49:14 +0000
Subject: Re: [patch] PM / Hibernate: NULL dereferences on error paths
Message-Id: <20111008104914.GQ30887@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111007132453.GA31424@elgon.mountain>
In-Reply-To: <20111007132453.GA31424@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Oct 08, 2011 at 09:28:48PM +1100, Bojan Smojver wrote:
> +out_clean:
> +	if (data) {
> +		for (thr = 0; thr < nr_threads; thr++) {
> +			if (data[thr].thr)
> +				kthread_stop(data[thr].thr);
> +		}
> +		vfree(data);
> +	}
> +	if (page) free_page((unsigned long)page);
>  

This obviously works, but why don't you use a normal kernel unwind
style?  You tried this complicated error handling before and it
already caused bugs...  It's simpler if the error handling code has
no if statements.

regards,
dan carpenter

