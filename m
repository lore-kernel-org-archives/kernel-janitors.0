From: Jiri Olsa <jolsa@redhat.com>
Date: Sat, 21 Sep 2013 13:35:57 +0000
Subject: Re: [patch] perf: potential underflow in perf_sample_ustack_size()
Message-Id: <20130921133556.GB8304@krava.brq.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130920113736.GB8655@elgon.mountain>
In-Reply-To: <20130920113736.GB8655@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Sep 20, 2013 at 02:37:36PM +0300, Dan Carpenter wrote:
> The code here is trying to ensure that we don't have a
> "header_size + stack_size" which is more than USHRT_MAX.  I changed
> the overflow check a little to make it more clear.
> 
> My concern here is that if "header_size + sizeof(u64)" is very large
> then we could end up with underflow doing the subtraction and end up
> with a "stack_size" larger than intended.
> 
> I don't know perf well enough to say if this is possible.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index dd236b6..eec9e683 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -4217,11 +4217,13 @@ perf_sample_ustack_size(u16 stack_size, u16 header_size,
>  	header_size += 2 * sizeof(u64);
>  
>  	/* Do we fit in with the current stack dump size? */
> -	if ((u16) (header_size + stack_size) < header_size) {
> +	if (header_size > USHRT_MAX - stack_size) {

hum, the original check looks clear enough to me

>  		/*
>  		 * If we overflow the maximum size for the sample,
>  		 * we customize the stack dump size to fit in.
>  		 */
> +		if (header_size + sizeof(u64) > USHRT_MAX)
> +			return 0;

ok, I wonder if we could practically reach header size
this big, but it's safer to check

thanks,
jirka

>  		stack_size = USHRT_MAX - header_size - sizeof(u64);
>  		stack_size = round_up(stack_size, sizeof(u64));
>  	}
