From: David Hildenbrand <david@redhat.com>
Date: Mon, 04 Dec 2017 10:41:04 +0000
Subject: Re: [PATCH] KVM: x86: MMU: make array audit_point_name static
Message-Id: <45047bd6-4a27-2c16-b00b-bb7911792b8f@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171130120422.4783-1-colin.king@canonical.com>
In-Reply-To: <20171130120422.4783-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 30.11.2017 13:04, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The array audit_point_name is local to the source and does not need to
> be in global scope, so make it static.
> 
> Cleans up sparse warning:
> arch/x86/kvm/mmu_audit.c:22:12: warning: symbol 'audit_point_name' was
> not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/x86/kvm/mmu_audit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/mmu_audit.c b/arch/x86/kvm/mmu_audit.c
> index d22ddbdf5e6e..1272861e77b9 100644
> --- a/arch/x86/kvm/mmu_audit.c
> +++ b/arch/x86/kvm/mmu_audit.c
> @@ -19,7 +19,7 @@
>  
>  #include <linux/ratelimit.h>
>  
> -char const *audit_point_name[] = {
> +static char const *audit_point_name[] = {
>  	"pre page fault",
>  	"post page fault",
>  	"pre pte write",
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 

Thanks,

David / dhildenb
