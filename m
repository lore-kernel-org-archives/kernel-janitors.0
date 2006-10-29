From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 29 Oct 2006 19:36:30 +0000
Subject: Re: [KJ] [PATCH] cleaning of HANDLE_STACK definition
Message-Id: <20061029193630.GW5591@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
In-Reply-To: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Oct 29, 2006 at 11:14:59AM -0800, Giangiacomo Mariotti wrote:
> This little patch cleans the definition of HANDLE_STACK in arch/x86_64/kernel/traps.c because it's syntax is misleading.

Yeah, but you've wrapped it past the 80 column boundary, so you'd need
to fix that.  And you didn't put a Signed-off-by on it.

I don't think the outer do ... while is necessary anyway.  Is there any
problem with just deleting them?

>  #define HANDLE_STACK(cond) \
> -	do while (cond) { \
> -		unsigned long addr = *stack++; \
> -		if (oops_in_progress ? 		\
> -			__kernel_text_address(addr) : \
> -			kernel_text_address(addr)) { \
> -			/* \
> -			 * If the address is either in the text segment of the \
> -			 * kernel, or in the region which contains vmalloc'ed \
> -			 * memory, it *may* be the address of a calling \
> -			 * routine; if so, print it so that someone tracing \
> -			 * down the cause of the crash will be able to figure \
> -			 * out the call path that was taken. \
> -			 */ \
> -			ops->address(data, addr);   \
> +	do { \
> +		while (cond) { \
> +			unsigned long addr = *stack++; \
> +			if (oops_in_progress ? 		\
> +				__kernel_text_address(addr) : \
> +				kernel_text_address(addr)) { \
> +				/* \
> +				* If the address is either in the text segment of the \
> +			 	* kernel, or in the region which contains vmalloc'ed \
> +			 	* memory, it *may* be the address of a calling \
> +			 	* routine; if so, print it so that someone tracing \
> +			 	* down the cause of the crash will be able to figure \
> +			 	* out the call path that was taken. \
> +			 	*/ \
> +				ops->address(data, addr);   \
> +			} \
>  		} \
>  	} while (0)
>  
> -- 
> 1.4.3.2
> 

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
