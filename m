From: Marcelo Tosatti <mtosatti@redhat.com>
Date: Mon, 01 Nov 2010 17:19:37 +0000
Subject: Re: [patch v2] x86: kvm: x86: fix information leak to userland
Message-Id: <20101101171937.GA4484@amt.cnet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288447871-7715-1-git-send-email-segooon@gmail.com>
 <4CCC2D11.7090109@web.de>
 <20101030153147.GA14169@albatros>
 <4CCC3DC2.6090505@web.de>
 <20101030185447.GA7629@albatros>
In-Reply-To: <20101030185447.GA7629@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: Jan Kiszka <jan.kiszka@web.de>, kernel-janitors@vger.kernel.org, Avi Kivity <avi@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Oct 30, 2010 at 10:54:47PM +0400, Vasiliy Kulikov wrote:
> Structures kvm_vcpu_events, kvm_debugregs, kvm_pit_state2 and
> kvm_clock_data are copied to userland with some padding and reserved
> fields unitialized.  It leads to leaking of contents of kernel stack
> memory.  We have to initialize them to zero.
> 
> In patch v1 Jan Kiszka suggested to fill reserved fields with zeros
> instead of memset'ting the whole struct.  It makes sense as these
> fields are explicitly marked as padding.  No more fields need zeroing.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  Compile tesed only.
> 
>  arch/x86/kvm/x86.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)

Applied, thanks.

