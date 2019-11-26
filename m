From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 26 Nov 2019 17:24:10 +0000
Subject: Re: [PATCH] KVM: x86/mmu: fix comparison of u8 with -1
Message-Id: <CAKwvOdmG8Az=DFCODtehGTcLRYjEO2B6ZcDd=eNAF40dV-gw6Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126161255.323992-1-colin.king@canonical.com>
In-Reply-To: <20191126161255.323992-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Sean Christopherson <sean.j.christopherson@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, kvm@vger.kernel.org, clang-built-linux <clang-built-linux@googlegroups.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Nov 26, 2019 at 8:21 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The comparison of the u8 value __entry->u with -1 is always
> going to be false because a __entry-u can never be negative.
> Fix this by casting it to a s8 integer.
>
> Addresses clang warning:
> arch/x86/kvm/./mmutrace.h:360:16: warning: result of comparison
> of constant -1 with expression of type 'u8' (aka 'unsigned char')
> is always false [-Wtautological-constant-out-of-range-compare]

(__entry->u is defined as a u8)

>
> Fixes: 335e192a3fa4 ("KVM: x86: add tracepoints around __direct_map and FNAME(fetch)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/x86/kvm/mmutrace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/mmutrace.h b/arch/x86/kvm/mmutrace.h
> index 7ca8831c7d1a..3466cd528a67 100644
> --- a/arch/x86/kvm/mmutrace.h
> +++ b/arch/x86/kvm/mmutrace.h
> @@ -357,7 +357,7 @@ TRACE_EVENT(
>                   __entry->r ? "r" : "-",
>                   __entry->spte & PT_WRITABLE_MASK ? "w" : "-",
>                   __entry->x ? "x" : "-",
> -                 __entry->u = -1 ? "" : (__entry->u ? "u" : "-"),
> +                 (s8)__entry->u = -1 ? "" : (__entry->u ? "u" : "-"),

Or could compare against 0xFF instead of -1.  Either way, thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>                   __entry->level, __entry->sptep
>         )
>  );


-- 
Thanks,
~Nick Desaulniers
