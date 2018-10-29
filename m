From: Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 29 Oct 2018 18:34:58 +0000
Subject: Re: [PATCH] x86/ioremap: tighten integer overflow checking
Message-Id: <alpine.DEB.2.21.1810291925470.5984@nanos.tec.linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181025061633.t32bxslxj3h7jv2x@kili.mountain>
In-Reply-To: <20181025061633.t32bxslxj3h7jv2x@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan,

On Thu, 25 Oct 2018, Dan Carpenter wrote:

> The current check is a bit off in the case where "phys_addr + size"
> wraps to zero because then "last_addr" is set to ULONG_MAX which is >> phys_addr.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  arch/x86/mm/ioremap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
> index 5378d10f1d31..ee43df3ebe66 100644
> --- a/arch/x86/mm/ioremap.c
> +++ b/arch/x86/mm/ioremap.c
> @@ -146,9 +146,9 @@ static void __iomem *__ioremap_caller(resource_size_t phys_addr,
>  	void __iomem *ret_addr;
>  
>  	/* Don't allow wraparound or zero size */
> -	last_addr = phys_addr + size - 1;
> -	if (!size || last_addr < phys_addr)
> +	if (!size || phys_addr + size < phys_addr)

Assume the following (resource_size_t = u32, which is the case when
CONFIG_PHYS_ADDR_T_64BIT=n):

       phys_addr = 0xFFFF0000
       size	 = 0x00010000

       sum	 = 0x00000000  which is < phys_addr

But the existing code does:

       last_addr = phys_addr + size - 1

       		 = 0xFFFFFFFF

which is correct. last_addr is the last valid address in the to be remapped
range starting @phys_addr.

Thanks,

	tglx
