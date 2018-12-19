From: David Hildenbrand <david@redhat.com>
Date: Wed, 19 Dec 2018 16:48:10 +0000
Subject: Re: [PATCH -next] KVM: VMX: Remove duplicated include from vmx.c
Message-Id: <7b34c84a-3f09-58fa-1efe-55dab5494aad@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545094909-85500-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1545094909-85500-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 18.12.18 02:01, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index c90fffd..0a826c6 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -62,7 +62,6 @@
>  #include "vmcs12.h"
>  #include "vmx.h"
>  #include "x86.h"
> -#include "vmx.h"
>  
>  MODULE_AUTHOR("Qumranet");
>  MODULE_LICENSE("GPL");
> 
> 
> 
> 
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 

Thanks,

David / dhildenb
