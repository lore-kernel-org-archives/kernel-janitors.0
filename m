From: Juergen Gross <jgross@suse.com>
Date: Mon, 18 Sep 2017 08:43:22 +0000
Subject: Re: [PATCH] x86/xen: clean up clang build warning
Message-Id: <681e7853-f71b-e092-e56b-1d0a2c1ddefe@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170918083817.26870-1-colin.king@canonical.com>
In-Reply-To: <20170918083817.26870-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 18/09/17 10:38, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where sizeof(maddr) != sizeof(long) p is initialized and
> never read and clang throws a warning on this.  Move declaration of
> p to clean up the clang build warning:
> 
> warning: Value stored to 'p' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

With the code style issue pointed out below fixed:

Reviewed-by: Juergen Gross <jgross@suse.com>

> ---
>  arch/x86/include/asm/xen/hypercall.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/asm/xen/hypercall.h
> index 9606688caa4b..5ff77cb2529e 100644
> --- a/arch/x86/include/asm/xen/hypercall.h
> +++ b/arch/x86/include/asm/xen/hypercall.h
> @@ -552,13 +552,13 @@ static inline void
>  MULTI_update_descriptor(struct multicall_entry *mcl, u64 maddr,
>  			struct desc_struct desc)
>  {
> -	u32 *p = (u32 *) &desc;
> -
>  	mcl->op = __HYPERVISOR_update_descriptor;
>  	if (sizeof(maddr) = sizeof(long)) {
>  		mcl->args[0] = maddr;
>  		mcl->args[1] = *(unsigned long *)&desc;
>  	} else {
> +		u32 *p = (u32 *) &desc;

Please omit the space here      ^


Juergen

> +
>  		mcl->args[0] = maddr;
>  		mcl->args[1] = maddr >> 32;
>  		mcl->args[2] = *p++;
> 

