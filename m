From: Mukesh Ojha <mojha@codeaurora.org>
Date: Thu, 02 May 2019 14:49:39 +0000
Subject: Re: [PATCH][next] KVM: PPC: Book3S HV: XIVE: fix spelling mistake "acessing" -> "accessing"
Message-Id: <a7883281-bae0-694e-8436-f385023c1f88@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190502102313.25093-1-colin.king@canonical.com>
In-Reply-To: <20190502102313.25093-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Paul Mackerras <paulus@ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 5/2/2019 3:53 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a pr_err message, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh


> ---
>   arch/powerpc/kvm/book3s_xive_native.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
> index 5e14df1a4403..6a8e698c4b6e 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -235,7 +235,7 @@ static vm_fault_t xive_native_esb_fault(struct vm_fault *vmf)
>   	arch_spin_unlock(&sb->lock);
>   
>   	if (WARN_ON(!page)) {
> -		pr_err("%s: acessing invalid ESB page for source %lx !\n",
> +		pr_err("%s: accessing invalid ESB page for source %lx !\n",
>   		       __func__, irq);
>   		return VM_FAULT_SIGBUS;
>   	}
