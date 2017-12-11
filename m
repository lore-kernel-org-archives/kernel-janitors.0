From: Palmer Dabbelt <palmer@sifive.com>
Date: Mon, 11 Dec 2017 15:58:29 +0000
Subject: Re: [PATCH] RISC-V: Logical vs Bitwise typo
Message-Id: <mhng-bd44de9d-40a6-4221-93ad-97223c68eb63@palmer-si-x1c4>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171209114914.fbor54gqfcmvqipf@mwanda>
In-Reply-To: <20171209114914.fbor54gqfcmvqipf@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 09 Dec 2017 03:49:14 PST (-0800), dan.carpenter@oracle.com wrote:
> In the current code, there is a ! logical NOT where a bitwise ~ NOT was
> intended.  It means that we never return -EINVAL.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index a2ae936a093e..79c78668258e 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -70,7 +70,7 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
>  	bool local = (flags & SYS_RISCV_FLUSH_ICACHE_LOCAL) != 0;
>
>  	/* Check the reserved flags. */
> -	if (unlikely(flags & !SYS_RISCV_FLUSH_ICACHE_ALL))
> +	if (unlikely(flags & ~SYS_RISCV_FLUSH_ICACHE_ALL))
>  		return -EINVAL;
>
>  	flush_icache_mm(mm, local);

Thanks!
