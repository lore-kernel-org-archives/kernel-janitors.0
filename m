From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Thu, 04 Apr 2019 16:07:01 +0000
Subject: Re: [PATCH] xen: Prevent buffer overflow in privcmd ioctl
Message-Id: <bbffb44b-4a08-4882-4c19-d1085cfeab2e@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404151217.GA22334@kadam>
In-Reply-To: <20190404151217.GA22334@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org, stable <stable@vger.kernel.org>

On 4/4/19 11:12 AM, Dan Carpenter wrote:
> The "call" variable comes from the user in privcmd_ioctl_hypercall().
> It's an offset into the hypercall_page[] which has (PAGE_SIZE / 32)
> elements.  We need to put an upper bound on it to prevent an out of
> bounds access.
>
> Fixes: 1246ae0bb992 ("xen: add variable hypercall caller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

I am also adding stable@vger.kernel.org

-boris

> ---
>  arch/x86/include/asm/xen/hypercall.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/asm/xen/hypercall.h
> index de6f0d59a24f..2863c2026655 100644
> --- a/arch/x86/include/asm/xen/hypercall.h
> +++ b/arch/x86/include/asm/xen/hypercall.h
> @@ -206,6 +206,9 @@ xen_single_call(unsigned int call,
>  	__HYPERCALL_DECLS;
>  	__HYPERCALL_5ARG(a1, a2, a3, a4, a5);
>  
> +	if (call >= PAGE_SIZE / sizeof(hypercall_page[0]))
> +		return -EINVAL;
> +
>  	asm volatile(CALL_NOSPEC
>  		     : __HYPERCALL_5PARAM
>  		     : [thunk_target] "a" (&hypercall_page[call])
